#improting all the required packages
import logging
import csv
import os
import numpy as np
import pandas as pd
import luigi
from download_data import Download_data
from sklearn.ensemble import RandomForestClassifier
import warnings
warnings.filterwarnings('ignore')

#function to generate the loggs
def getLogger(dir):
    logging.basicConfig(level=logging.INFO)
    logger = logging.getLogger()
    handler = logging.FileHandler(dir)
    handler.setLevel(logging.INFO)
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    return logger

#function to check is directory exists
def funCheckDir(filepath):
    directory = os.path.dirname(filepath) # defining directory path
    if not os.path.exists(directory): # checking if directory already exists
        os.makedirs(directory) # making a directory
        return False
    else :
        try:
            os.remove(filepath)
        except OSError:
            pass
        return True

#function to write the data in chunks
def chunker(seq, size):
    return (seq[pos:pos + size] for pos in range(0, len(seq), size))

def funReadRawData(path):
    dateparse = lambda x: pd.datetime.strptime(x, '%H:%M')
    df = pd.read_csv(path, parse_dates=['time'], date_parser=dateparse)

    return df

def funFillMissingData(df):
    df['car_value'].fillna('z', inplace=True)

    df['C_previous'].fillna(df['C'], inplace=True)
    df['duration_previous'].fillna(0, inplace=True)

    return df

def funDeriveColumns(df):
    df['plan'] = df['A'].map(str) + df['B'].map(str) + df['C'].map(str) + df['D'].map(str) + df['E'].map(str) + df['F'].map(str) + df['G'].map(str)

    df['hour'] = df['time'].dt.hour
    del df['time']
    df['is_weekend'] = np.where(df['day'].isin(list(range(0, 4))) , 0, 1)

    df['is_family'] = np.where(((df['group_size'] > 2) & (df['age_youngest'] < 25) & (df['married_couple'] == 1)), 0, 1)

    df['agediff'] = df['age_oldest'] - df['age_youngest']

    df['is_individual'] = np.where(((df['agediff'] == 0) & (df['group_size'] == 1)), 1, 0)

    return df

def funChangeDataTypes(df):
    df['state_code'] = df['state'].astype('category')
    df['state_code'] = df['state_code'].cat.codes

    df['car_value_code'] = df['car_value'].astype('category')
    df['car_value_code'] = df['car_value_code'].cat.codes

    columns = ['record_type', 'day','location', 'group_size', 'homeowner', 'risk_factor', 'married_couple', 'C_previous',
               'A','B','C','D','E','F','G','hour', 'is_weekend', 'is_family', 'is_individual', 'state_code', 'car_value_code']

    for col in columns:
        df[col] = df[col].astype('category')

    return df


def funPredictNFillRiskFactor(df):
    dfrisk = df[~ pd.isnull(df['risk_factor'])]
    dfnorisk = df[pd.isnull(df['risk_factor'])]

    columns = ['location', 'car_age', 'age_oldest', 'age_youngest', 'state_code']

    train_X = dfrisk[columns]
    train_y = dfrisk['risk_factor']

    model = RandomForestClassifier(n_jobs=2)
    model.fit(train_X, train_y)

    test_X = dfnorisk[columns]
    dfnorisk['risk_factor'] = model.predict(test_X)

    test_X = dfnorisk[columns]
    dfnorisk['risk_factor'] = model.predict(test_X)

    df = pd.concat([dfrisk, dfnorisk])

    return df

def funWriteDataCSV(df, filePath):
    funCheckDir(filePath)

    withHeaders = True
    for i in chunker(df,10000):
        if(withHeaders):
            i.to_csv(filePath, index=False, mode='a')
            withHeaders = False
        else:
            i.to_csv(filePath, index=False, mode='a', header = False)

#function to perform aggregations
def main():
    #defining the file-directory
    fileDir = os.path.dirname(os.path.realpath('__file__'))

    #Logging started
    logFilePath = fileDir+'/logs/clean_data.log'
    funCheckDir(logFilePath)
    logger = getLogger(logFilePath)
    logger.info("Application started....")

    #cleaning and filling missing data started
    logger.info("Cleaning and filling missing data started..")

    #defining data frame for the consolidated data
    df = pd.DataFrame()

    #reading loan data stats
    for directory, subdirectory, filenames in  os.walk(fileDir + '/data/raw_data/'):
        for filename in filenames:
            logger.info("Working on file: " + filename + '....')
            df = funReadRawData(os.path.join(directory, filename))

    #Filling missing data
    logger.info("Filling missing data..")
    df = funFillMissingData(df)

    #Deriving columns
    logger.info("Deriving columns..")
    df = funDeriveColumns(df)

    #categorizing the columns
    logger.info("Converting the data type..")
    df = funChangeDataTypes(df)

    #categorizing the columns
    logger.info("Predicting & filling missing risk_factor..")
    df = funPredictNFillRiskFactor(df)

    # dfPurchased is subset of train that only includes purchases
    dfPurchased = df[~ df.duplicated(['customer_ID'], take_last=True)]
    dfPurchased = dfPurchased.reset_index(drop=True)

    # dfPurchased is subset of train that excludes purchases
    dfQuotes = df[df.duplicated(['customer_ID'], take_last=True)]
    dfQuotes = dfQuotes.reset_index(drop=True)

    # dfLastQuote only includes last quote before purchase
    dfLastQuote = dfQuotes[~ dfQuotes.duplicated(['customer_ID'], take_last=True)]
    dfLastQuote = dfLastQuote.reset_index(drop=True)

    # changed is anyone who changed from their last quote
    dfLastQuoteTemp = dfLastQuote[['customer_ID', 'plan']]
    dfPurchased = pd.merge(dfPurchased, dfLastQuoteTemp, on='customer_ID')
    dfPurchased['is_changed'] = np.where((dfPurchased['plan_x'] != dfPurchased['plan_y']), 1, 0)
    del dfPurchased['plan_y']
    dfPurchased.rename(columns={'plan_x': 'plan'}, inplace=True)

    dfPurchasedTemp = dfPurchased[['customer_ID', 'is_changed']]
    dfLastQuote = pd.merge(dfLastQuote, dfPurchasedTemp, on='customer_ID')

    #writing data frame to the purchase_data.csv
    filePath = fileDir+'/data/processed_data/purchase_data.csv'
    logger.info("Writing purchases data to CSV..")
    funWriteDataCSV(dfPurchased, filePath)
    logger.info("Total number of records in the purchase_data : "+str(len(dfPurchased)))

    #writing data frame to the quotes_data.csv
    filePath = fileDir+'/data/processed_data/quotes_data.csv'
    logger.info("Writing quotes data to CSV..")
    funWriteDataCSV(dfQuotes, filePath)
    logger.info("Total number of records in the quotes_data : "+str(len(dfQuotes)))

    #writing data frame to the last_quote_data.csv
    filePath = fileDir+'/data/processed_data/last_quote_data.csv'
    logger.info("Writing last quote data to CSV..")
    funWriteDataCSV(dfLastQuote, filePath)
    logger.info("Total number of records in the last_quote_data : "+str(len(dfLastQuote)))

    #Logging finished
    logger.info("Application finished....")
    logging.shutdown()

class Clean_data(luigi.Task):
    def requires(self):
        return Download_data()

    def output(self):
        return{
        'output1' : luigi.LocalTarget('data/processed_data/purchase_data.csv'),\
        'output2' : luigi.LocalTarget('data/processed_data/quotes_data.csv'),\
        'output3' : luigi.LocalTarget('data/processed_data/last_quote_data.csv')
        }

    def run(self):
        main()
