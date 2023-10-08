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

conn = MySQLdb.connect(host='127.0.0.1', port=3306, user='root', password='1234', database='ott')
# conn = MySQLdb.connect(host='3.35.38.53', port=3306, user='lbw0109', password='Lgt010109@@', database='ott')
cursor = conn.cursor()
sql1 = "SELECT a.media_id, a.media_href FROM watcha a, media b where a.media_id = b.media_id and b.actor is null"
cursor.execute(sql1)
href_list = cursor.fetchall()

# chrome_options = webdriver.ChromeOptions()
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

# driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
driver_exec_path = ChromeDriverManager().install()
driver = uc.Chrome(driver_executable_path=driver_exec_path, options=chrome_options)

sql2 = "UPDATE media SET actor=%s, director=%s, author=%s, update_date=%s WHERE media_id=%s"

for rows in href_list:
    media_id = rows[0]
    media_href = rows[1]

    actors= ''
    directors= ''
    authors= ''

    # 주소에 /overview붙이면 기본정보화면으로 감
    driver.get(media_href)
    print(media_href)
    driver.implicitly_wait(20)
    time.sleep(2)

    li_list = driver.find_elements(By.XPATH, "//*[@id='content_credits']/div/div[1]/div/div/ul/li[*]")
    #li가 바뀌어야 사람이 바뀜

    print("총 출연/제작 인원: ", len(li_list))

    total_count = len(li_list)

    if total_count == 12:
        nextBtn = driver.find_element(By.XPATH, "//*[@id='content_credits']/div/div[5]/div")
        nextBtn.click()
        print("clicked")
        driver.implicitly_wait(5)
        time.sleep(1)

    for idx in range(total_count):

        if eeeeeeeeeee > 0:
            try:
                nextBtn = driver.find_element(By.XPATH, "//*[@id='content_credits']/div/div[5]/div")
                nextBtn.click()
                print("clicked")
                driver.implicitly_wait(10)
                time.sleep(1)
            except:
                print("next버튼 없음")
                break

        li = driver.find_element(By.XPATH, "//*[@id='content_credits']/div/div[1]/div/div/ul/li[" + str(idx+1) + "]")
        name = li.find_element(By.XPATH, "a/div[2]/div[1]/div[1]").text
        
        role = li.find_element(By.XPATH, "a/div[2]/div[1]/div[2]").text
        compare_role = role.split('|')[0].strip()
        print({"name": name, "role": compare_role})

        if compare_role == "출연" or compare_role == "특별출연" or compare_role == "성우" or compare_role == "나레이션":
            actors += name + "^"
        elif compare_role == "감독" or compare_role == "프로듀서":
            directors += name + "^"
        elif compare_role == "극본" or compare_role == "원작" or compare_role == "시리즈 구성":
            authors += name + "^"

    now = datetime.now()
    update_date = now.strftime("%Y%m%d")

    actorsLastIndex = actors.rfind("^")
    if actorsLastIndex > -1:
        actors = actors[0:actorsLastIndex]

    directorsLastIndex = directors.rfind("^")
    if directorsLastIndex > -1:
        directors = directors[0:directorsLastIndex]

    authorsLastIndex = authors.rfind("^")
    if authorsLastIndex > -1:
        authors = authors[0:authorsLastIndex]

    data1 = ( actors, directors, authors, update_date, media_id )
    print(data1)
    cursor.execute(sql2, data1)
    conn.commit()

conn.close()
driver.quit()
print("SUCCESS!")