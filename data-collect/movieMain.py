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
    driver.get("https://pedia.watcha.com/ko-KR/?domain=movie")
    print('url connected')

    return driver

now = datetime.now()
save_date = now.strftime("%Y%m%d")

driver = init_driver()

#conn = MySQLdb.connect(host='127.0.0.1', port=3306, user='root', password='1234', database='ott')
conn = MySQLdb.connect(host='15.164.32.95', port=3306, user='lbw0109', password='Lgt010109@@', database='ott')
cursor = conn.cursor(MySQLdb.cursors.DictCursor)

sql1 = "SELECT media_id FROM media WHERE replace(media_name, ' ', '') = %(media_name)s"
sql2 = "UPDATE media SET media_code = %s WHERE media_id = %s"
sql3 = "INSERT INTO watcha (media_id, media_code, media_name, media_href, img_src) VALUES (%s, %s, %s, %s, %s)"
sql4 = "UPDATE watcha SET media_code = %s, media_name = %s, media_href = %s, img_src = %s WHERE media_id = %s"

#popup 광고 삭제
try:
    closeBtn = driver.find_element(By.XPATH, "//*[contains(@id, 'modal-container-')]/div/div/div[2]/span[1]")
    closeBtn.click()
    driver.implicitly_wait(10)
    time.sleep(1)
except:
    print("광고 모달이 없습니다")


section = driver.find_element(By.XPATH, "//*[@id='root']/div/div[1]/section/div/section")

# 박스오피스 순위만 조회
no = 2
try:
    title = section.find_element(By.XPATH, "div[" + str(no) + "]/div[1]/p")
    print("section title: ", title.text.strip())

    medias = section.find_element(By.XPATH, "div[" + str(no) + "]/div[2]")
    list = medias.find_elements(By.XPATH, "div/div[1]/div/div/ul/li[*]")
#    print("list length: ", len(list))
    media_rank = 1

    for media in list:
        link = media.find_element(By.TAG_NAME, "a")
        media_name = link.get_attribute("title")
        media_href = link.get_attribute("href")
        media_code = media_href[40:]
        print("media_name:", media_name, ", media_code:", media_code)
        
        try:
            img = link.find_element(By.TAG_NAME, "img")
            img_src = img.get_attribute("src")
        except NoSuchElementException:
            img_src = "none"

        # media_name 으로 일치하는 media_id를 조회
        cursor.execute(sql1, { 'media_name': media_name.replace(" ", "") })
        sql1_result = cursor.fetchone()
        if sql1_result == None:
            print("해당 media는 가지고 있지 않습니다")
            continue

        media_id = sql1_result['media_id']

        # media table에 watch media_code를 update
        data2 = (media_code, media_id)
        cursor.execute(sql2, data2)

        try:
            data3 = ( media_id, media_code, media_name, media_href, img_src)
            cursor.execute(sql3, data3)
        except MySQLdb.IntegrityError as e:
            print("이미 있으므로 update하겠음.")
            data4 = ( media_code, media_name, media_href, img_src, media_id)
            cursor.execute(sql4, data4)

        conn.commit()
except NoSuchElementException as e:
    print(e)

conn.close()
driver.quit()
print("SUCCESS!")

