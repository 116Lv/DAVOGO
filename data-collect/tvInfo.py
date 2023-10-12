import time
from selenium import webdriver
from selenium.webdriver.support.ui import Select
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import undetected_chromedriver as uc
import MySQLdb
from datetime import datetime

#conn = MySQLdb.connect(host='127.0.0.1', port=3306, user='root', password='1234', database='ott')
conn = MySQLdb.connect(host='15.164.32.95', port=3306, user='lbw0109', password='Lgt010109@@', database='ott')
cursor = conn.cursor()
sql1 = "SELECT media_id, media_href FROM watcha"
cursor.execute(sql1)
href_list = cursor.fetchall()

# chrome_options = webdriver.ChromeOptions()
chrome_options = Options()
chrome_options.add_experimental_option("detach", True)
chrome_options.add_experimental_option("excludeSwitches", ["enable-logging"])
chrome_options.add_argument('headless')
# driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
driver_exec_path = ChromeDriverManager().install()
driver = uc.Chrome(driver_executable_path=driver_exec_path)

for rows in href_list:

    media_id = rows[0]
    media_href = rows[1]

    sql3 = "SELECT ifnull(channel, '') as channel FROM media where media_id = %(media_id)s"
    cursor.execute(sql3, { 'media_id' : media_id})
    sql3_result = cursor.fetchone()
    channel = sql3_result[0]
    if channel == '':
        # 주소에 /overview붙이면 기본정보화면으로 감
        driver.get(media_href+"/overview")

        sql2 = "UPDATE media SET period=%s, channel=%s, genre=%s, country=%s, rating_grade=%s, introduce=%s, update_date=%s WHERE media_id=%s"

        #dl밑에 dd를 긁어 와야함
        ul = driver.find_element(By.XPATH, "//*[@id='root']/div/div[1]/section/section/div/div/ul")

        dl_list = ul.find_elements(By.XPATH, "dl[*]")
    #    print("list length: ", len(dl_list))

        for dl in dl_list:
            dt_value = dl.find_element(By.TAG_NAME, "dt").text
            dd_value = dl.find_element(By.TAG_NAME, "dd").text
            if dt_value == "원제":
                media_title = dd_value

            elif dt_value.replace(" ","") == "제작연도":
                period = dd_value

            elif dt_value == "채널":
                channel = dd_value

            elif dt_value == "장르":
                genre = dd_value

            elif dt_value == "국가":
                country = dd_value

            elif dt_value.replace(" ","") == "연령등급":
                rating_grade = dd_value

            elif dt_value == "내용":
                introduce = dd_value
                
    #    print("media_title: ", media_title)
    #    print("period: ", period)
    #    print("channel: ", channel)
    #    print("genre: ", genre)
    #    print("country: ", country)
    #    print("rating_grade: ", rating_grade)
    #    print("introduce: ", introduce)

        now = datetime.now()
        update_date = now.strftime("%Y%m%d")


        data1 = ( period, channel, genre, country, rating_grade, introduce, update_date, media_id )
        cursor.execute(sql2, data1)
        conn.commit()
    else:
        print("Already exists media")


conn.close()
driver.quit()
print("SUCCESS!")