# -*- coding: utf-8 -*-
import time
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
#from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
#from selenium.webdriver.chrome.options import Options
import undetected_chromedriver as uc
import MySQLdb
from datetime import datetime

def init_driver():
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--incognito')
    #chrome_options.add_argument('--headless')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument("--window-size=1920,1080")
    chrome_options.add_argument("--start-maximized")

    chrome_options.add_argument("--disable-extensions")
    chrome_options.add_argument("--disable-application-cache")
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-setuid-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")

    driver_exec_path = ChromeDriverManager().install()
    print("driver_exec_path=" + driver_exec_path)
    driver = uc.Chrome(driver_executable_path=driver_exec_path)
    #driver = uc.Chrome(options=chrome_options)
    # driver = webdriver.Chrome(service=Service(ChromeDriverManager(version="114.0.5735.90").install()), options=chrome_options)
    driver.get("https://pedia.watcha.com/ko-KR/?domain=tv")
    print('url connected')

    return driver

now = datetime.now()
save_date = now.strftime("%Y%m%d")

driver = init_driver()

conn = MySQLdb.connect(host='127.0.0.1', port=3306, user='root', password='1234', database='ott')
#conn = MySQLdb.connect(host='3.35.38.53', port=3306, user='lbw0109', password='Lgt010109@@', database='ott')
cursor = conn.cursor(MySQLdb.cursors.DictCursor)
#cursor = conn.cursor()



sql = ""



#오늘자료가 수집되었다면 watcha-rank 자료 삭제
cursor.execute("DELETE FROM watcha_rank WHERE save_date = %(save_date)s", {'save_date': save_date})

#popup 광고 삭제
closeBtn = driver.find_element(By.XPATH, "//*[contains(@id, 'modal-container-')]/div/div/div[2]/span[1]")
closeBtn.click()
driver.implicitly_wait(10)
time.sleep(1)

