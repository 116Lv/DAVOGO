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

# conn = MySQLdb.connect(host='127.0.0.1', port=3306, user='root', password='1234', database='ott')
conn = MySQLdb.connect(host='3.35.38.53', port=3306, user='lbw0109', password='Lgt010109@@', database='ott')
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
    watchable = ''

    # 주소에 /overview붙이면 기본정보화면으로 감
    driver.get(media_href)
    print("media_id:", media_id)

    sql2 = "UPDATE media SET watchable=%s, update_date=%s WHERE media_id=%s"

    try:
        ul = driver.find_element(By.XPATH, "//*[@id='root']/div/div[1]/section/div/div[2]/div/div/div/div[1]/div[2]/div[1]/div/section[1]/div[2]/div[1]/div/div/div/ul")

        li_list = ul.find_elements(By.XPATH, "li")
#        print("li_list: ", len(li_list))

        if len(li_list) == 0:
            watchable = "none"
        else:
            for li in li_list:
                watchable += li.find_element(By.XPATH, "a/div[2]/div[1]/div").get_attribute('innerHTML') + "^"
            
        watchableLastIndex = watchable.rfind("^")
        if watchableLastIndex > -1:
            watchable = watchable[0:watchableLastIndex]

        print("watchable: ", watchable)

        now = datetime.now()
        update_date = now.strftime("%Y%m%d")

        data1 = ( watchable, update_date, media_id )
        cursor.execute(sql2, data1)
        conn.commit()
    except:
        continue


conn.close()
driver.quit()
print("SUCCESS!")