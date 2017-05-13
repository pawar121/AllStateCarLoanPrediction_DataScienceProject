#improting all the required packages
from __future__ import print_function
import argparse
import mechanicalsoup
from getpass import getpass
import urllib.response
import urllib.request
from bs4 import BeautifulSoup
from urllib.request import urlopen
import logging
import csv
import os
from zipfile import ZipFile
from io import BytesIO
import luigi
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


#function to perform aggregations
def main():
    #defining the file-directory
    fileDir = os.path.dirname(os.path.realpath('__file__'))

    #Logging started
    logFilePath = fileDir+'/logs/download_data.log'
    funCheckDir(logFilePath)
    logger = getLogger(logFilePath)
    logger.info("Application started....")

    #defining base ulrs
    url = 'https://www.kaggle.com/account/login.action'

    #ask for login credentials
    # username = "sumitdeo911@yahoo.com"
    username = input("Please provide username : ")
    # password = "Passw0rd"
    password = input("Please provide password : ")

    #trying to loging to the lending-club
    logger.info("Trying to loging in..")
    browser = mechanicalsoup.Browser()
    login_page = browser.get(url)
    login_form = login_page.soup.find('form', {"id":"signin"})
    login_form.find("input", {"id" : "UserName"})["value"] = username
    login_form.find("input", {"id" : "Password"})["value"] = password
    login_form.find("input", {"id" : "RememberMe"})["value"] = True
    response = browser.submit(login_form, login_page.url)

    if (response.url == 'https://www.kaggle.com/account/login.action'):
        logger.info(username + " logged in successfully!")

        baseURL = 'https://www.kaggle.com/c/allstate-purchase-prediction-challenge/download/'

        #downloading Loan Stats Data
        logger.info("Downloading training data files...")
        r = browser.get(baseURL + 'train.csv.zip')
        path = os.path.join(fileDir, 'data/raw_data/')
        with urlopen(r.url) as zipresp:
            with ZipFile(BytesIO(zipresp.read())) as zfile:
                zfile.extractall(path)

        logger.info("Downloaded data location - " + os.path.join(fileDir, 'data/raw_data/'))

        luigi_completion_text_file = fileDir+'/luigi/download_data_completed.txt'
        funCheckDir(luigi_completion_text_file)
        text_file = open(luigi_completion_text_file, "w")
        text_file.write("Downloaded data files.")
        text_file.close()

        #Logging finished
        logger.info("Application finished....")
        logging.shutdown()

    else:
        logger.info("Either username or password or both are wrong..")
        #Logging finished
        logger.info("Application finished....")
        logging.shutdown()

        try:
            luigi_completion_text_file = fileDir+'/luigi/download_data_completed.txt'
            os.remove(luigi_completion_text_file)
        except OSError:
            pass

class Download_data(luigi.Task):
    def requires(self):
        return None

    def output(self):
        return luigi.LocalTarget('luigi/download_data_completed.txt')

    def run(self):
        main()
