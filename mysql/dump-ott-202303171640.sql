-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ott
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(2000) DEFAULT NULL,
  `writer` varchar(100) DEFAULT NULL,
  `save_date` varchar(16) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'aaaa','lbw0109','20230214','aaaa');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code` (
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '코드',
  `code_group` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '코드그룹',
  `code_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '코드명',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES ('1','media_div','movie'),('2','media_div','tv');
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `file_id` int NOT NULL AUTO_INCREMENT COMMENT '파일ID',
  `file_div` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '파일구분',
  `media_id` int DEFAULT NULL COMMENT '미디어ID',
  `store_locate` varchar(2000) DEFAULT NULL COMMENT '저장하는 파일의 경로',
  `store_fname` varchar(2000) DEFAULT NULL COMMENT '저장하는 파일명',
  `store_tname` varchar(2000) DEFAULT NULL COMMENT '저장하는 썸네일명',
  `org_fname` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '원본파일명',
  PRIMARY KEY (`file_id`),
  KEY `image_FK` (`media_id`),
  CONSTRAINT `image_FK` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (21,'poster',2,'C:/OTT/img/movie/poster/2','20230202161947378.png','20230202161947378_thumb.png','topgun.png'),(22,'ads',2,'C:/OTT/img/movie/ads/2','20230202161947501.jpg','20230202161947501_thumb.jpg','topgun_4dx.jpg'),(23,'ads',2,'C:/OTT/img/movie/ads/2','20230202161947538.jpg','20230202161947538_thumb.jpg','topgun_imax.jpg'),(24,'ads',2,'C:/OTT/img/movie/ads/2','20230202161947547.jpg','20230202161947547_thumb.jpg','topgun_screenx.jpg'),(25,'ads',2,'C:/OTT/img/movie/ads/2','20230202161947573.jpg','20230202161947573_thumb.jpg','topgun_super4d.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainbanner`
--

DROP TABLE IF EXISTS `mainbanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mainbanner` (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `media_id` int DEFAULT NULL,
  `banner_path` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '배너이미지 경로',
  `banner_image` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '배너 파일명',
  `banner_thumb` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '배너 썸네일명',
  `title` varchar(2000) DEFAULT NULL,
  `display_start` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `display_end` char(12) DEFAULT NULL,
  `hide` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  PRIMARY KEY (`banner_id`),
  KEY `banner_FK` (`media_id`),
  CONSTRAINT `banner_FK` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainbanner`
--

LOCK TABLES `mainbanner` WRITE;
/*!40000 ALTER TABLE `mainbanner` DISABLE KEYS */;
/*!40000 ALTER TABLE `mainbanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `media_id` int NOT NULL AUTO_INCREMENT COMMENT '미디어ID',
  `media_name` varchar(2000) DEFAULT NULL COMMENT '미디어명',
  `media_div` varchar(100) DEFAULT NULL COMMENT '미디어구분',
  `director` varchar(2000) DEFAULT NULL COMMENT '감독',
  `actor` varchar(2000) DEFAULT NULL COMMENT '출연진',
  `producer` varchar(2000) DEFAULT NULL COMMENT '제작사',
  `distributor` varchar(500) DEFAULT NULL COMMENT '배급사',
  `author` varchar(2000) DEFAULT NULL COMMENT '작가',
  `channel` varchar(500) DEFAULT NULL COMMENT '채널',
  `open_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '개봉일자',
  `period` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '방송시작일자',
  `episode` int DEFAULT NULL COMMENT '방송횟수',
  `running_time` int DEFAULT NULL COMMENT '상영시간',
  `rating_grade` varchar(500) DEFAULT NULL COMMENT '상영등급',
  `genre` varchar(2000) DEFAULT NULL COMMENT '장르',
  `introduce` text COMMENT '소개글',
  `movie_code` varchar(2000) DEFAULT NULL COMMENT '영화코드',
  `audiAcc` int DEFAULT NULL COMMENT '누적관객수',
  `rank` int DEFAULT NULL COMMENT '순위',
  `save_date` varchar(16) DEFAULT NULL COMMENT '저장일자',
  `week_rank` int DEFAULT NULL COMMENT '주간순위',
  `weekly_save_date` varchar(16) DEFAULT NULL COMMENT '주간순위 저장일자',
  PRIMARY KEY (`media_id`),
  KEY `media_FK` (`media_div`),
  CONSTRAINT `media_FK` FOREIGN KEY (`media_div`) REFERENCES `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (2,'탑건: 매버릭','1','조셉 코신스키','톰 크루즈, 마일스 텔러, 제니퍼 코넬리, 존 햄, 글렌 파월, 에드 해리스, 발 킬머','스카이댄스 미디어','파라마운트 픽처스','크리스토퍼 맥쿼리',NULL,'20220622',NULL,NULL,130,'12세 이상 관람가',NULL,'한순간의 실수도 용납되지 않는 하늘 위, 가장 압도적인 비행이 시작된다!  최고의 파일럿이자 전설적인 인물 매버릭(톰 크루즈)은 자신이 졸업한 훈련학교 교관으로 발탁된다. 그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만 실전을 방불케 하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다.  매버릭의 지휘 아래 견고한 팀워크를 쌓아가던 팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자 매버릭은 자신이 가르친 동료들과 함께 마지막이 될지 모를 하늘 위 비행에 나서는데…',NULL,NULL,NULL,NULL,NULL,NULL),(3,'탑건','1','토니 스콧','톰 크루즈, 켈리 맥길리스, 발 킬머, 앤서니 에드워즈, 톰 스커릿','돈 심슨/제리 브룩하이머 필름스','파라마운트 픽처스','짐 캐시',NULL,'19870813',NULL,NULL,110,'15세 이상 관람가',NULL,'인도양에 배치된 미국 항공모함에서 발진한 F-14 두 대는 초계비행중 최신형 MiG-28과 조우한다. 상부에서는 자칫 실전이 벌어져 사태가 확전되는 것을 우려했기 때문에 절대로 먼저 발포하지 말 것을 명령하였고, 이렇게 서로 예의주의하며 신경전을 벌이던 중 미그기가 쿠거 대위가 모는 F-14에 레이더 락온을 걸어 지속적으로 위협하자 쿠거는 공포에 질려 공황발작을 일으킨다. 하지만 미첼 대위가 모는 F-14가 과감한 기동으로 미그를 견제비행하여 유혈사태 없이 이들을 쫓아버린다. 쿠거는 항공전대에서 최고의 파일럿이었지만 이 사건으로 전투기 파일럿이라는 업무에 부담감을 느껴 예편을 선택하고, 미첼 대위와 그의 파트너인 후방관제사(Radar interceptor Operator, RIO) 브래드쇼 중위는 쿠거를 대신해 캘리포니아 미라마(Miramar) 해군기지에 있는 탑건 스쿨에 입학한다. 이곳에서 미첼과 브래드쇼는 그들과 마찬가지로 각 항모 전단에서 선발된 미해군 최고의 파일럿들과 함께 공중전 훈련과 치열한 경쟁을 벌이게 되는데...',NULL,NULL,NULL,NULL,NULL,NULL),(8,'여고추리반','2','정종연, 임수정','박지윤, 장도연, 재재, 비비, 최예나','CJ ENM',NULL,'.','TVING',NULL,'20210129',16,NULL,'12세 이상 관람가',NULL,'<대탈출>, <더 지니어스> 제작진의 미스터리 어드벤처! 클래스가 다른 추리가 온다!',NULL,NULL,NULL,NULL,NULL,NULL),(10,'더 퍼스트 슬램덩크','1','이노우에 다케히코','','','(주)넥스트엔터테인먼트월드(NEW)^',NULL,NULL,'20230104',NULL,NULL,124,'12세이상관람가','애니메이션',NULL,'20228555',3895172,2,'20230309',NULL,NULL),(11,'타이타닉','1','제임스 카메론','레오나르도 디카프리오^케이트 윈슬렛','파라마운트 픽쳐스^','월트디즈니컴퍼니코리아 유한책임회사^씨네힐^이십세기폭스코리아(주)^',NULL,NULL,'19980220',NULL,NULL,194,'15세이상관람가','드라마^멜로/로맨스^액션',NULL,'19980074',857407,3,'20230221',NULL,NULL),(12,'아바타: 물의 길','1','제임스 카메론','조 샐다나^샘 워싱턴^시고니 위버^스티븐 랭^케이트 윈슬렛','','월트디즈니컴퍼니코리아 유한책임회사^',NULL,NULL,'20221214',NULL,NULL,192,'12세이상관람가','액션^어드벤처^SF^스릴러',NULL,'20225061',10772842,9,'20230227',NULL,NULL),(13,'교섭','1','임순례','황정민^현빈^강기영','(주)영화사수박^원테이크필름^','플러스엠 엔터테인먼트^',NULL,NULL,'20230118',NULL,NULL,108,'12세이상관람가','드라마',NULL,'20190808',1709122,6,'20230215',NULL,NULL),(14,'영웅','1','윤제균','정성화^김고은^나문희^조재윤^배정남^이현우^박진주^권라희','(주)제이케이필름^(주)씨제이이엔엠^','(주)씨제이이엔엠^',NULL,NULL,'20221221',NULL,NULL,120,'12세이상관람가','드라마^뮤지컬',NULL,'20196478',3233135,8,'20230221',NULL,NULL),(15,'바빌론','1','데이미언 셔젤','브래드 피트^마고 로비^디에고 칼바^진 스마트^조반 아데포^리 준 리^토비 맥과이어','','롯데컬처웍스(주)롯데엔터테인먼트^',NULL,NULL,'20230201',NULL,NULL,188,'청소년관람불가','드라마',NULL,'20227374',189120,10,'20230221',NULL,NULL),(16,'다음 소희','1','정주리','김시은^배두나^박우영^정수하','트윈플러스파트너스(주)^','트윈플러스파트너스(주)^',NULL,NULL,'20230208',NULL,NULL,137,'15세이상관람가','드라마',NULL,'20223565',75884,7,'20230223',NULL,NULL),(17,'장화신은 고양이: 끝내주는 모험','1','조엘 크로포드','안토니오 반데라스^셀마 헤이엑^올리비아 콜맨^하비 길렌^샘슨 카요^와그너 모라^안토니 멘데즈^존 멀레이니^플로렌스 퓨^더바인 조이 랜돌프^레이 윈스톤','','유니버설픽쳐스인터내셔널 코리아(유)^',NULL,NULL,'20230104',NULL,NULL,102,'전체관람가','애니메이션',NULL,'20224109',823213,8,'20230213',NULL,NULL),(18,'상견니','1','황천인','가가연^허광한^시백우','','오드^리바이브콘텐츠 주식회사^씨제이 씨지브이(CJ CGV)(주)^',NULL,NULL,'20230125',NULL,NULL,107,'15세이상관람가','드라마^판타지^멜로/로맨스',NULL,'20229551',330365,9,'20230221',NULL,NULL),(19,'유령','1','이해영','설경구^이하늬^박소담^박해수^서현우^김동희','더램프(주)^','(주)씨제이이엔엠^',NULL,NULL,'20230118',NULL,NULL,132,'15세이상관람가','액션',NULL,'20214823',653096,10,'20230213',NULL,NULL),(20,'카운트','1','권혁재','진선규^성유빈^오나라^고창석^장동주^고규필','(주)필름케이^(주)26컴퍼니^','(주)씨제이이엔엠^',NULL,NULL,'20230222',NULL,NULL,108,'12세이상관람가','드라마',NULL,'20193706',338777,8,'20230305',NULL,NULL),(21,'네가 떨어뜨린 푸른 하늘','1','사이토 유키','후쿠모토 리코^이타가키 미즈키','','메가박스중앙(주)^(주)이놀미디어^(주)바이포엠스튜디오^',NULL,NULL,'20230208',NULL,NULL,93,'12세이상관람가','멜로/로맨스^SF',NULL,'20229305',26377,10,'20230215',NULL,NULL),(22,'앤트맨과 와스프: 퀀텀매니아','1','페이튼 리드','폴 러드^에반젤린 릴리^미셀 파이퍼^마이클 더글라스','','월트디즈니컴퍼니코리아 유한책임회사^',NULL,NULL,'20230215',NULL,NULL,124,'12세이상관람가','액션',NULL,'20230209',1523178,8,'20230309',NULL,NULL),(23,'어메이징 모리스','1','토비 젠켈','휴 로리^에밀리아 클라크^데이빗 듈리스^히메쉬 파텔^정재헌^박지윤^오인성^김현욱^장미^홍진욱^정의한^이규창^김사라','','(주)블루라벨픽쳐스^',NULL,NULL,'20230215',NULL,NULL,93,'전체관람가','애니메이션^판타지^어드벤처',NULL,'20228966',85346,10,'20230227',NULL,NULL),(24,'두다다쿵: 후후섬의 비밀','1','김지윤^최병선','','아이스크림 스튜디오(주)^','(주)넥스트엔터테인먼트월드(NEW)^',NULL,NULL,'20230215',NULL,NULL,83,'전체관람가','애니메이션',NULL,'20210684',79007,7,'20230227',NULL,NULL),(25,'서치 2','1','니콜라스 D 존슨^윌 메릭','스톰 리드^켄 렁^다니엘 헤니^니아 롱','','소니픽쳐스엔터테인먼트코리아주식회사극장배급지점^',NULL,NULL,'20230222',NULL,NULL,110,'12세이상관람가','미스터리^스릴러',NULL,'20239573',369271,7,'20230309',NULL,NULL),(26,'마루이 비디오','1','윤준형','서현우^조민경','(주)발포플랜^(주)브라더픽처스^','씨제이 씨지브이(CJ CGV)(주)^(주)케이티알파^',NULL,NULL,'20230222',NULL,NULL,86,'15세이상관람가','미스터리^공포(호러)',NULL,'20202026',146974,10,'20230305',NULL,NULL),(27,'TAR 타르','1','토드 필드','케이트 블란쳇^노에미 멜랑^니나 호스','','유니버설픽쳐스인터내셔널 코리아(유)^',NULL,NULL,'20230222',NULL,NULL,158,'15세이상관람가','드라마',NULL,'20230007',6732,8,'20230223',NULL,NULL),(28,'바다 탐험대 옥토넛 육지수호 대작전 : 열대우림을 지켜라!','1','','하성용^정재헌^엄상현^윤승희^김율^유동균^김정은^한경화^박성영^이재현','','와이드 릴리즈(주)^',NULL,NULL,'20230223',NULL,NULL,57,'전체관람가','애니메이션^액션^어드벤처',NULL,'20239913',23840,8,'20230227',NULL,NULL),(29,'미녀와 야수: 마법에 걸린 왕자','1','','박시윤^김용','','(주)인터파크^예지림엔터테인먼트^(주)띵크^',NULL,NULL,'20230222',NULL,NULL,97,'전체관람가','애니메이션^판타지^어드벤처',NULL,'20228648',6509,10,'20230225',NULL,NULL),(30,'스즈메의 문단속','1','신카이 마코토','','','(주)쇼박스^',NULL,NULL,'20230308',NULL,NULL,121,'12세이상관람가','애니메이션',NULL,'20226270',203057,1,'20230309',NULL,NULL),(31,'대외비','1','이원태','조진웅^이성민^김무열','(주)트윈필름^(주)비에이엔터테인먼트^','플러스엠 엔터테인먼트^',NULL,NULL,'20230301',NULL,NULL,115,'15세이상관람가','범죄^드라마',NULL,'20208962',574465,3,'20230309',NULL,NULL),(32,'귀멸의 칼날: 상현집결, 그리고 도공 마을로','1','소토자키 하루오','하나에 나츠키^키토 아카리^시모노 히로^마츠오카 요시츠구','','(주)디스테이션^',NULL,NULL,'20230302',NULL,NULL,109,'15세이상관람가','애니메이션',NULL,'20230533',352994,4,'20230309',NULL,NULL),(33,'아임 히어로 더 파이널','1','오윤동','임영웅','씨제이포디플렉스 주식회사^','씨제이포디플렉스 주식회사^CGV ICECON^',NULL,NULL,'20230301',NULL,NULL,102,'전체관람가','공연^다큐멘터리',NULL,'20230495',160042,5,'20230309',NULL,NULL),(34,'멍뭉이','1','김주환','유연석^차태현','(주)와이웍스엔터테인먼트^(주)돈키호테엔터테인먼트^','(주)키다리스튜디오^',NULL,NULL,'20230301',NULL,NULL,112,'전체관람가','드라마',NULL,'20227684',120153,9,'20230309',NULL,NULL),(35,'똑똑똑','1','M. 나이트 샤말란','데이브 바티스타^조나단 그로프^루퍼트 그린트','','유니버설픽쳐스인터내셔널 코리아(유)^',NULL,NULL,'20230308',NULL,NULL,100,'15세이상관람가','미스터리^스릴러',NULL,'20230200',7234,6,'20230309',NULL,NULL),(36,'소울메이트','1','민용근','김다미^전소니^변우석','클라이맥스 스튜디오(주)^(주)앤드마크^(주)스튜디오앤뉴^(주)키이스트^','(주)넥스트엔터테인먼트월드(NEW)^',NULL,NULL,'20230315',NULL,NULL,123,'12세이상관람가','드라마',NULL,'20197654',9627,10,'20230309',NULL,NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT COMMENT '리뷰ID',
  `media_id` int DEFAULT NULL COMMENT '미디어ID',
  `user_id` int DEFAULT NULL COMMENT '고객ID',
  `rate` float DEFAULT NULL COMMENT '평점',
  `content` text COMMENT '리뷰내용',
  `writing_date` date DEFAULT NULL COMMENT '작성일자',
  `hide` varchar(1) DEFAULT '0' COMMENT '비공개여부',
  PRIMARY KEY (`review_id`),
  KEY `review_FK` (`media_id`),
  KEY `review_FK_1` (`user_id`),
  CONSTRAINT `review_FK` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`),
  CONSTRAINT `review_FK_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT COMMENT '직원ID',
  `staff_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '직원명',
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ID',
  `email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '이메일',
  `phone_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '전화번호',
  `address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '주소',
  `entering_date` varchar(16) DEFAULT NULL COMMENT '입사일자',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '비밀번호',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'이병우','lbw0109','lbw0109@gmail.com','010-8528-5212','서울시 중랑구 공릉로 18길 59','20230213','lgt010109@@');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '고객ID',
  `email` varchar(500) DEFAULT NULL COMMENT '이메일',
  `signup_date` varchar(16) DEFAULT NULL COMMENT '가입일자',
  `password` varchar(100) DEFAULT NULL COMMENT '비밀번호',
  `birth_date` date DEFAULT NULL COMMENT '생년월일',
  `age` int DEFAULT NULL COMMENT '나이',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ott'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 16:40:32
