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

#conn = MySQLdb.connect(host='127.0.0.1', port=3306, user='root', password='1234', database='ott')
conn = MySQLdb.connect(host='15.164.32.95', port=3306, user='lbw0109', password='Lgt010109@@', database='ott')
cursor = conn.cursor(MySQLdb.cursors.DictCursor)
#cursor = conn.cursor()

sql1 = "INSERT INTO media (media_name, media_div, media_code, save_date) VALUES (%s, %s, %s, %s)"
#num = "SELECT last_insert_id() from media"
sql2 = "INSERT INTO watcha (media_id, media_code, media_name, media_href, img_src) VALUES ((SELECT last_insert_id()), %s, %s, %s, %s)"
sql3 = "SELECT count(*) as cnt FROM watcha WHERE media_code = %(media_code)s"
sql4 = "SELECT media_id FROM watcha WHERE media_code = %(media_code)s"
sql5 = "INSERT INTO watcha_rank (save_date, media_id, category_title, media_rank) VALUES (%s, %s, %s, %s)"

#오늘자료가 수집되었다면 watcha-rank 자료 삭제
cursor.execute("DELETE FROM watcha_rank WHERE save_date = %(save_date)s", {'save_date': save_date})

#popup 광고 삭제
try:
    closeBtn = driver.find_element(By.XPATH, "//*[contains(@id, 'modal-container-')]/div/div/div[2]/span[1]")
    closeBtn.click()
    driver.implicitly_wait(10)
    time.sleep(1)
except:
    print("광고 모달이 없습니다")

#한줄씩 타이틀별로 가져오면 좋을듯
#타이틀 = /html/body/div/div/div[1]/section/div/section/div[1] 에서 div가 늘어나면 되지만 중간에 광고땜에 div class="w_exposed_cell css-lufi3b" data-rowindex="?" ?가 늘어나는데로 가져오는게 광고없이 깔끔함
section = driver.find_element(By.XPATH, "//*[@id='root']/div/div[1]/section/div/section")

for no in range(1, 6):
    try:
        print("section순번=div[" + str(no) + "]/div[1]/p")
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
            
    #        print("media_code:", media_code)
            
            try:
                img = link.find_element(By.TAG_NAME, "img")
                img_src = img.get_attribute("src")
            except NoSuchElementException:
                img_src = "none"

            data1 = ( media_name, '2', media_code, save_date)
            data2 = ( media_code, media_name, media_href, img_src)
            
            cursor.execute(sql3, { 'media_code': media_code })
            sql3_result = cursor.fetchone()
            cnt = sql3_result['cnt']
    #        print("rowcount: ", cnt)
            if cnt == 0:
    #            print("media_title: ", media_name)
    #            print("media_code: ", media_code)
    #            print("media_href: ", media_href)
    #            print("img_src: ", img_src)
                cursor.execute(sql1, data1)
                cursor.execute(sql2, data2)
            else:
                print("Already exists media")

            cursor.execute(sql4, { 'media_code': media_code })
            num = cursor.fetchone()
            media_id = num['media_id']
            data3 = ( save_date, media_id, title.text, media_rank )
            media_rank += 1
            cursor.execute(sql5, data3)
            conn.commit()
    except NoSuchElementException as e:
        print("카테고리가 존재하지 않음")
        #print(e)
        continue

conn.close()
driver.quit()
print("SUCCESS!")

