import luigi
import os
import logging
from clean_data import Clean_data
import boto
import boto.s3
import sys
from boto.s3.key import Key
from boto.s3.connection import Location

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


def check_if_file_exists(aws_access_key,aws_secret_key,filePath):
    bucket_name = 'ads_final_project'
    conn = boto.connect_s3(aws_access_key,aws_secret_key)
    filePresetflag = False
    bucket = conn.lookup(bucket_name)
    if not (bucket == None):
        for key in bucket.list(delimiter='/'):
            for f in bucket.list(key.name):
                if(f.name == filePath):
                    filePresetflag = True
    if (filePresetflag == True):
        return True
    else:
        return False


def amazon_upload(AWS_ACCESS_KEY_ID,AWS_SECRET_ACCESS_KEY,file, logger):
    try:
        bucket_name = 'ads_final_project'
        conn = boto.connect_s3(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
        bucket = conn.lookup(bucket_name)
        if bucket is None:
            bucket = conn.create_bucket(bucket_name, location=boto.s3.connection.Location.DEFAULT)

        k = Key(bucket)
        k.key = file
        logger.info("Uploading zip file on AWS S3..")
        k.set_contents_from_filename(file)
        logger.info("Data can be found in - bucket_name : "+bucket_name+" and key : "+k.key)
        conn.close()
    except:
        logger.error("Either AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY or both are invalid!")
        conn.close()


class start_task(luigi.Task):

    def requires(self):
        return Clean_data()

    def output(self):
        return luigi.LocalTarget('logs/start_pipeline.log')

    def run(self):
        logFilePath = 'logs/start_pipeline.log'
        funCheckDir(logFilePath)
        logger = getLogger(logFilePath)
        logger.info("Pipeline started....")

        #READ AMAZON KEYS FROM USER
        aws_access_key = input("Enter your aws access key: ")
        aws_secret_key = input("Enter your aws secret key: ")

        aws_access_key = aws_access_key.strip()
        aws_secret_key = aws_secret_key.strip()

        filePath = 'data/processed_data/purchase_data.csv'

        flag = check_if_file_exists(aws_access_key,aws_secret_key, filePath)

        if (flag == False):
            amazon_upload(aws_access_key,aws_secret_key,filePath, logger)

        #Logging finished
        logger.info("Pipeline finished....")
        logging.shutdown()

if __name__ == '__main__':
    try:
        os.remove('logs/start_pipeline.log')
    except OSError:
        pass
    luigi.run()
