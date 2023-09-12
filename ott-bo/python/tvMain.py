# -*- coding: utf-8 -*-
import time
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.support.ui import Select
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import undetected_chromedriver as uc
import MySQLdb
from datetime import datetime

now = datetime.now()
save_date = now.strftime("%Y%m%d")

# chrome_options = webdriver.ChromeOptions()
chrome_options = Options()
chrome_options.add_experimental_option("detach", True)
chrome_options.add_experimental_option("excludeSwitches" , ["enable-logging"])
chrome_options.add_argument('headless')
driver_exec_path = ChromeDriverManager().install()
driver = uc.Chrome(driver_executable_path=driver_exec_path)
# driver = webdriver.Chrome(service=Service(ChromeDriverManager(version="114.0.5735.90").install()), options=chrome_options)
driver.get("https://pedia.watcha.com/ko-KR/?domain=tv")

# conn = MySQLdb.connect(host='127.0.0.1', port=3306, user='root', password='1234', database='ott')
conn = MySQLdb.connect(host='3.35.38.53', port=3306, user='lbw0109', password='Lgt010109@@', database='ott')
cursor = conn.cursor(MySQLdb.cursors.DictCursor)
#cursor = conn.cursor()

sql1 = "INSERT INTO media (media_name, media_div, media_code, save_date) VALUES (%s, %s, %s, %s)"
#num = "SELECT last_insert_id() from media"
sql2 = "INSERT INTO watcha (media_id, media_code, media_name, media_href, img_src) VALUES ((SELECT last_insert_id()), %s, %s, %s, %s)"
sql3 = "SELECT count(*) as cnt FROM watcha WHERE media_code = %(media_code)s"

#한줄씩 타이틀별로 가져오면 좋을듯
#타이틀 = /html/body/div/div/div[1]/section/div/section/div[1] 에서 div가 늘어나면 되지만 중간에 광고땜에 div class="w_exposed_cell css-lufi3b" data-rowindex="?" ?가 늘어나는데로 가져오는게 광고없이 깔끔함
section = driver.find_element(By.XPATH, "//*[@id='root']/div/div[1]/section/div/section")
for no in range(1, 5):
    title = section.find_element(By.XPATH, "div[" + str(no) + "]/div[1]/p")
#    print("section title: ", title.text.strip())

    medias = section.find_element(By.XPATH, "div[" + str(no) + "]/div[2]")
    list = medias.find_elements(By.XPATH, "div/div[1]/div/div/ul/li[*]")
#    print("list length: ", len(list))

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

        cursor.execute(sql3, { 'media_code': media_code})
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
            conn.commit()
        else:
            print("Already exists media")

        
conn.close()
driver.quit()
print("SUCCESS!")

