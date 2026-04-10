/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: beanst
-- ------------------------------------------------------
-- Server version	10.11.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- =============================================
-- 1. users (외래키 없음 - 가장 먼저 생성)
-- =============================================

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `dataNum` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'USER',
  `status` varchar(15) NOT NULL DEFAULT '1' COMMENT '1. 정상 2. 탈퇴요청 3.탈퇴완료',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`dataNum`) USING BTREE,
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','1111','admin@admin.com','관리자',NULL,'admin','1','2026-02-27 03:55:25','2026-03-08 03:08:10'),
(2,'user01','1111','user05@user.com','김영훈','등록된 전화번호가 없습니다.','USER','1','2026-03-03 06:11:09','2026-03-11 07:12:54'),
(3,'user02','1111','user02@naver.com','강태준','010-1111-1111','USER','1','2026-03-05 03:45:26','2026-03-11 07:13:09'),
(4,'user03','1111','user03@naver.com','채미숙','010-2222-2222','USER','1','2026-03-05 03:49:31','2026-03-11 07:13:24'),
(5,'user04','1111','user04@naver.com','김현우','010-4444-4444','USER','1','2026-03-05 06:16:42','2026-03-11 07:13:46'),
(41,'essong','1111','essong@abc.com','은설','010-0000-0000','USER','1','2026-03-11 00:57:05','2026-03-11 07:14:23'),
(43,'mnor2','qwertyuI1@','mnor2@naver.com','김현우','010-1111-2221','USER','1','2026-03-11 02:00:51','2026-03-11 02:14:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


-- =============================================
-- 2. room_manage (외래키 없음)
-- =============================================

DROP TABLE IF EXISTS `room_manage`;
CREATE TABLE `room_manage` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '객실번호',
  `room_name` varchar(50) DEFAULT NULL COMMENT '객실명',
  `capacity` varchar(50) DEFAULT NULL COMMENT '정원',
  `room_location` varchar(50) DEFAULT NULL COMMENT '위치',
  `room_description` varchar(100) DEFAULT NULL COMMENT '룸구성',
  `usage_time` varchar(50) DEFAULT NULL COMMENT '이용시간',
  `amenity` varchar(255) DEFAULT NULL COMMENT '어매니티',
  `minibar` varchar(255) DEFAULT NULL COMMENT '미니바',
  `created_at` datetime DEFAULT NULL COMMENT '등록일',
  `updated_at` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `room_manage` WRITE;
/*!40000 ALTER TABLE `room_manage` DISABLE KEYS */;
INSERT INTO `room_manage` VALUES
(1,'Deluxe Room','기준 2인 / 최대 3인','7층','모던한 디자인의 디럭스 객실','15:00 체크인 / 11:00 체크아웃','TV, WiFi, 에어컨, 욕조','콜라, 맥주, 스낵',NULL,'2026-03-10 19:58:20'),
(2,'Premier Room','기준 2인 / 최대 3인','8층','넓은 공간과 시티뷰를 갖춘 프리미어 객실','15:00 체크인 / 11:00 체크아웃','TV, WiFi, 에어컨, 욕조, 커피머신','콜라, 맥주, 와인, 스낵',NULL,'2026-03-10 17:31:14'),
(3,'Family Suite','기준 4인 / 최대 5인','9층','가족 여행에 적합한 패밀리 스위트','15:00 체크인 / 11:00 체크아웃','TV, WiFi, 거실, 욕조, 커피머신','콜라, 맥주, 와인, 스낵',NULL,'2026-03-10 17:31:00'),
(4,'Royal Suite','기준 4인 / 최대 6인','10층','고급 인테리어의 로얄 스위트 객실','15:00 체크인 / 11:00 체크아웃','TV, WiFi, 거실, 욕조, 커피머신, 바','와인, 위스키, 스낵',NULL,'2026-03-10 17:30:48'),
(5,'Presidential Suite','기준 6인 / 최대 8인','최상층','호텔 최고급 프레지덴셜 스위트','15:00 체크인 / 11:00 체크아웃','TV, WiFi, 거실, 욕조, 자쿠지, 바','와인, 샴페인, 스낵',NULL,'2026-03-10 17:30:36');
/*!40000 ALTER TABLE `room_manage` ENABLE KEYS */;
UNLOCK TABLES;


-- =============================================
-- 3. room (FK → room_manage)
-- =============================================

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL COMMENT '방 번호 (부모 참조)',
  `room_name` varchar(50) NOT NULL COMMENT '방 이름',
  `base_capacity` int(11) DEFAULT 2 COMMENT '최소 인원',
  `max_capacity` int(11) DEFAULT 4 COMMENT '최대 인원',
  `base_price` int(11) NOT NULL COMMENT '기본 요금',
  `extra_charge` int(11) DEFAULT 20000 COMMENT '추가 인원 요금',
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `uk_room_name` (`room_name`),
  CONSTRAINT `fk_room_manage_id` FOREIGN KEY (`room_id`) REFERENCES `room_manage` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES
(1,'Deluxe Room',2,3,120000,20000),
(2,'Premier Room',2,3,150000,25000),
(3,'Family Suite',4,5,220000,30000),
(4,'Royal Suite',4,6,350000,50000),
(5,'Presidential Suite',6,8,600000,100000);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;


-- =============================================
-- 4. hotel_facility (외래키 없음)
-- =============================================

DROP TABLE IF EXISTS `hotel_facility`;
CREATE TABLE `hotel_facility` (
  `facility_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '부대시설 고유 번호',
  `facility_type` varchar(50) NOT NULL COMMENT '부대시설 종류',
  `facility_name` varchar(100) NOT NULL COMMENT '부대시설 이름',
  `description` text DEFAULT NULL COMMENT '부대시설 상세 설명',
  `open_time` varchar(50) DEFAULT NULL COMMENT '운영시간',
  `location` varchar(100) DEFAULT NULL COMMENT '부대시설 위치',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '부대시설 정보 등록 일시',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '부대시설 정보 최근 수정 일시',
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='호텔 정보 테이블입니다.';

LOCK TABLES `hotel_facility` WRITE;
/*!40000 ALTER TABLE `hotel_facility` DISABLE KEYS */;
INSERT INTO `hotel_facility` VALUES
(45,'SPA','Heavenly SPA','도심 속에서 즐기는 프리미엄 천연 온천 스파. 따뜻한 온천수와 함께 몸과 마음의 긴장을 풀고 깊은 휴식을 경험할 수 있습니다. 고요한 분위기 속에서 최고의 힐링을 선사하는 Vinst Hotel의 대표 웰니스 공간입니다.','06:00 - 23:00','B1F Wellness Zone','2026-03-10 17:49:38','2026-03-10 18:14:28'),
(46,'FITNESS','Vinst Signature Fitness','최신 프리미엄 운동 장비와 탁 트인 도심 전망을 동시에 즐길 수 있는 피트니스 센터입니다. 전문적인 트레이닝 환경과 세련된 공간에서 건강하고 활기찬 하루를 시작해보세요.','24 Hours','5F Wellness Floor','2026-03-10 17:49:45','2026-03-10 17:49:45'),
(47,'POOL','Infinity Pool','도심의 스카이라인을 한눈에 담을 수 있는 인피니티 풀. 여유로운 휴식과 함께 아름다운 전망을 즐길 수 있는 Vinst Hotel의 시그니처 공간입니다.','07:00 - 22:00','6F Outdoor Terrace','2026-03-10 17:50:03','2026-03-10 17:50:56'),
(48,'LOUNGE','Sky Lounge','도시의 야경을 가장 아름답게 감상할 수 있는 프리미엄 스카이 라운지. 다양한 시그니처 칵테일과 함께 낭만적인 시간을 보낼 수 있는 특별한 공간입니다.','17:00 - 01:00','12F Rooftop','2026-03-10 17:50:09','2026-03-10 18:13:56'),
(49,'DINING','Vinst Buffet','세계 각국의 요리를 한자리에서 즐길 수 있는 프리미엄 뷔페 레스토랑. 신선한 재료와 셰프의 정성이 담긴 다양한 요리를 품격 있는 공간에서 경험해보세요.','07:00 - 21:00','2F Dining Hall','2026-03-10 17:50:16','2026-03-10 18:14:12');
/*!40000 ALTER TABLE `hotel_facility` ENABLE KEYS */;
UNLOCK TABLES;


-- =============================================
-- 5. faq (외래키 없음)
-- =============================================

DROP TABLE IF EXISTS `faq`;
CREATE TABLE `faq` (
  `faq_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'FAQ 고유 번호',
  `category` varchar(50) NOT NULL DEFAULT '기타' COMMENT '질문 카테고리',
  `question` varchar(500) NOT NULL COMMENT '자주 묻는 질문 내용',
  `answer` text NOT NULL COMMENT '질문에 대한 답변 내용',
  `sort_order` int(11) DEFAULT 0 COMMENT '화면 출력 정렬 순서',
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE' COMMENT '노출 상태 (ACTIVE: 노출, INACTIVE: 숨김)',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT 'FAQ 등록 일시',
  PRIMARY KEY (`faq_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES
(16,'예약','예약은 어떻게 하나요?','홈페이지 예약 페이지에서 날짜와 객실을 선택 후 결제하시면 예약이 완료됩니다. 예약 확인 이메일이 자동 발송됩니다.',1,'ACTIVE','2026-03-05 16:32:34'),
(17,'예약','예약 변경이 가능한가요?','체크인 3일 전까지 예약 변경이 가능합니다. 마이페이지 또는 고객센터(1588-0000)로 문의해 주세요.',2,'ACTIVE','2026-03-05 16:32:34'),
(18,'예약','예약 취소 및 환불 규정이 어떻게 되나요?','체크인 7일 전 취소 시 100% 환불, 3~6일 전 50% 환불, 2일 이내 취소 시 환불이 불가합니다.',3,'ACTIVE','2026-03-05 16:32:34'),
(19,'예약','비회원도 예약이 가능한가요?','예약은 회원 가입 후 이용 가능합니다. 간편하게 소셜 로그인으로도 가입하실 수 있습니다.',4,'ACTIVE','2026-03-05 16:32:34'),
(20,'시설','체크인·체크아웃 시간이 어떻게 되나요?','체크인은 오후 3시, 체크아웃은 오전 11시입니다. 얼리 체크인/레이트 체크아웃은 객실 상황에 따라 유료로 제공됩니다.',1,'ACTIVE','2026-03-05 16:32:34'),
(21,'시설','주차장이 있나요?','지하 주차장을 운영 중이며 투숙객은 무료로 이용 가능합니다. 대형 차량은 사전 문의 바랍니다.',2,'ACTIVE','2026-03-05 16:32:34'),
(22,'시설','조식은 어디서 이용하나요?','1층 레스토랑에서 운영되며, 이용 시간은 오전 7시~10시입니다. 조식 포함 패키지 예약 고객은 무료로 이용하실 수 있습니다.',3,'ACTIVE','2026-03-05 16:32:34'),
(23,'시설','수영장 이용 시간이 어떻게 되나요?','실내 수영장은 오전 7시~오후 10시 운영됩니다. 투숙객에 한해 무료로 이용 가능합니다.',4,'ACTIVE','2026-03-05 16:32:34'),
(24,'시설','객실 내 금연인가요?','호텔 내 모든 객실은 금연입니다. 흡연은 지정된 흡연 구역에서만 가능하며, 객실 내 흡연 적발 시 청소 비용이 청구됩니다.',5,'ACTIVE','2026-03-05 16:32:34'),
(25,'기타','반려동물 동반이 가능한가요?','죄송합니다. 현재 반려동물 동반 입실은 불가합니다. 수정합니다',1,'ACTIVE','2026-03-05 16:32:34'),
(26,'기타','어떤 결제 수단을 사용할 수 있나요?','신용카드(국내외), 체크카드, 계좌이체, 카카오페이, 네이버페이를 지원합니다.',2,'ACTIVE','2026-03-05 16:32:34'),
(27,'기타','세금계산서 발행이 가능한가요?','사업자 고객의 경우 세금계산서 발행이 가능합니다. 체크인 전 프런트 또는 고객센터로 사전 요청 부탁드립니다.',3,'ACTIVE','2026-03-05 16:32:34'),
(28,'기타','짐 보관 서비스가 있나요?','체크아웃 당일 오후 6시까지 프런트에서 무료로 짐을 보관해 드립니다.',4,'ACTIVE','2026-03-05 16:32:34'),
(29,'기타','일부 시설 이용 제한 안내','현재 3층 피트니스센터는 리모델링 공사로 이용이 제한됩니다. 불편을 드려 죄송합니다.',5,'INACTIVE','2026-03-05 16:32:34'),
(31,'기타','집에 갈 수 있나요?','어림도 없죠 ㅎ',10,'INACTIVE','2026-03-09 18:22:35');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;


-- =============================================
-- 6. reservation (FK → room)
-- =============================================

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '예약 고유 번호',
  `user_id` varchar(50) NOT NULL COMMENT '예약자 회원 아이디',
  `room_id` int(11) NOT NULL COMMENT '예약한 객실 고유 번호',
  `room_name` varchar(50) NOT NULL COMMENT '예약한 객실 이름',
  `name` varchar(50) NOT NULL COMMENT '예약자 이름',
  `check_in` date NOT NULL COMMENT '체크인 날짜',
  `check_out` date NOT NULL COMMENT '체크아웃 날짜',
  `adult_count` int(11) NOT NULL COMMENT '성인 숙박 인원수',
  `child_count` int(11) NOT NULL COMMENT '아동 숙박 인원수',
  `total_price` int(11) NOT NULL COMMENT '총 결제(예약) 금액',
  `status` int(11) unsigned DEFAULT NULL COMMENT '1:예약대기, 2:예약확정, 3:예약취소요청, 4:예약취소',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT '예약 접수 일시',
  PRIMARY KEY (`reservation_id`),
  KEY `room_id` (`room_id`),
  KEY `reservation_ibfk_2` (`room_name`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`room_name`) REFERENCES `room` (`room_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES
(46,'user01',1,'Deluxe Room','김영훈','2026-03-10','2026-03-12',3,0,320000,2,'2026-03-10 07:31:00'),
(47,'user01',2,'Premier Room','김영훈','2026-03-27','2026-03-31',2,0,600000,2,'2026-03-10 07:31:24'),
(48,'user01',4,'Royal Suite','김영훈','2026-03-13','2026-03-14',2,0,350000,2,'2026-03-10 07:31:39'),
(49,'user01',5,'Presidential Suite','김영훈','2026-03-10','2026-03-11',2,0,500000,2,'2026-03-10 08:44:24'),
(50,'essong',5,'Presidential Suite','은설a','2026-03-11','2026-03-12',1,0,600000,4,'2026-03-11 01:02:00'),
(51,'mnor2',2,'Premier Room','김현우','2026-03-12','2026-03-13',3,0,175000,4,'2026-03-11 02:01:33'),
(52,'mnor2',2,'Premier Room','김현우','2026-03-11','2026-03-12',2,0,150000,2,'2026-03-11 02:02:22'),
(53,'user02',1,'Deluxe Room','강태준','2026-03-12','2026-03-24',3,0,1680000,2,'2026-03-11 05:19:03'),
(54,'user03',2,'Premier Room','채미숙','2026-03-12','2026-03-18',3,0,1050000,2,'2026-03-11 05:20:00'),
(55,'user01',1,'Deluxe Room','김영훈','2026-03-24','2026-03-25',2,1,160000,1,'2026-03-11 06:07:43'),
(56,'essong',2,'Premier Room','은설','2026-03-18','2026-03-27',2,0,1350000,3,'2026-03-11 06:58:51');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;


-- =============================================
-- 7. room_image (FK → room_manage)
-- =============================================

DROP TABLE IF EXISTS `room_image`;
CREATE TABLE `room_image` (
  `image_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '이미지 고유 번호',
  `room_id` int(11) DEFAULT NULL COMMENT '객실 고유 번호',
  `image_path` varchar(255) DEFAULT NULL COMMENT '이미지 저장 경로',
  `is_main` varchar(255) DEFAULT NULL COMMENT '대표 이미지 여부',
  `display_order` int(11) DEFAULT NULL COMMENT '이미지 출력(정렬) 순서',
  `created_at` datetime DEFAULT NULL COMMENT '이미지 등록 일시',
  PRIMARY KEY (`image_no`) USING BTREE,
  KEY `fk_room_image_room_id` (`room_id`),
  CONSTRAINT `fk_room_image_room_id` FOREIGN KEY (`room_id`) REFERENCES `room_manage` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `room_image` WRITE;
/*!40000 ALTER TABLE `room_image` DISABLE KEYS */;
INSERT INTO `room_image` VALUES
(236,5,'/upload/room/5_bar.png','N',1,'2026-03-10 17:30:33'),
(237,5,'/upload/room/5_bed.png','N',2,'2026-03-10 17:30:33'),
(238,5,'/upload/room/5_Jacuzzi.png','Y',3,'2026-03-10 17:30:33'),
(239,5,'/upload/room/5_main.png','N',4,'2026-03-10 17:30:33'),
(240,5,'/upload/room/5_sofa.png','N',5,'2026-03-10 17:30:33'),
(241,4,'/upload/room/4_bar.png','Y',1,'2026-03-10 17:30:46'),
(242,4,'/upload/room/4_bathroom.png','N',2,'2026-03-10 17:30:46'),
(243,4,'/upload/room/4_bed.png','N',3,'2026-03-10 17:30:46'),
(244,4,'/upload/room/4_main.png','N',4,'2026-03-10 17:30:46'),
(245,4,'/upload/room/4_view.png','N',5,'2026-03-10 17:30:46'),
(246,3,'/upload/room/3_bathroom.png','N',1,'2026-03-10 17:30:58'),
(247,3,'/upload/room/3_bed.png','N',2,'2026-03-10 17:30:58'),
(248,3,'/upload/room/3_main.png','Y',3,'2026-03-10 17:30:58'),
(249,3,'/upload/room/3_minibar.png','N',4,'2026-03-10 17:30:58'),
(250,3,'/upload/room/3_view.png','N',5,'2026-03-10 17:30:58'),
(251,2,'/upload/room/2_bathroom.png','N',1,'2026-03-10 17:31:12'),
(252,2,'/upload/room/2_bed.png','N',2,'2026-03-10 17:31:12'),
(253,2,'/upload/room/2_main.png','Y',3,'2026-03-10 17:31:12'),
(254,2,'/upload/room/2_minibar.png','N',4,'2026-03-10 17:31:12'),
(255,2,'/upload/room/2_view.png','N',5,'2026-03-10 17:31:12'),
(256,1,'/upload/room/1_bathroom.png','N',1,'2026-03-10 17:31:35'),
(257,1,'/upload/room/1_bed.png','N',2,'2026-03-10 17:31:35'),
(259,1,'/upload/room/1_minibar.png','N',4,'2026-03-10 17:31:35'),
(260,1,'/upload/room/1_view.png','N',5,'2026-03-10 17:31:35'),
(261,1,'/upload/room/1_main.png','Y',6,'2026-03-10 19:58:18');
/*!40000 ALTER TABLE `room_image` ENABLE KEYS */;
UNLOCK TABLES;


-- =============================================
-- 8. facility_image (FK → hotel_facility)
-- =============================================

DROP TABLE IF EXISTS `facility_image`;
CREATE TABLE `facility_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '부대시설 고유 번호',
  `facility_id` int(11) NOT NULL COMMENT '연결된 부대시설 고유 번호',
  `image_path` varchar(255) NOT NULL COMMENT '이미지 저장 경로',
  `is_main` char(1) DEFAULT 'N' COMMENT '대표 이미지 여부 (Y: 대표, N: 일반)',
  `display_order` int(11) DEFAULT 0 COMMENT '이미지 출력(정렬) 순서',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '이미지 등록 일시',
  PRIMARY KEY (`image_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `facility_image_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `hotel_facility` (`facility_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='호텔 정보 이미지 모음 테이블';

LOCK TABLES `facility_image` WRITE;
/*!40000 ALTER TABLE `facility_image` DISABLE KEYS */;
INSERT INTO `facility_image` VALUES
(222,49,'/upload/facility/6ce08a0e-3ef4-449d-8b3c-287de3709258.png','Y',0,'2026-03-10 19:50:27'),
(223,49,'/upload/facility/64d6249c-49f8-4646-9bba-790cd8e3f6c3.png','N',0,'2026-03-10 19:50:27'),
(224,49,'/upload/facility/35254837-c102-458d-836b-2b608fe4ff6d.png','N',0,'2026-03-10 19:50:27'),
(225,49,'/upload/facility/c5e05a5e-198a-446b-a1bf-5c378dc4568a.png','N',0,'2026-03-10 19:50:27'),
(226,49,'/upload/facility/9133fd98-5812-4d2e-9420-ba110d5fc851.png','N',0,'2026-03-10 19:50:27'),
(227,48,'/upload/facility/cb70c39d-a0c5-43b1-b4e8-8cfd06a8f517.png','N',0,'2026-03-10 19:51:09'),
(228,48,'/upload/facility/f2c683d3-a60a-439c-8300-a2fa01e19a15.png','N',0,'2026-03-10 19:51:09'),
(229,48,'/upload/facility/019af47a-9a18-4701-8342-b8b2565a8a7a.png','N',0,'2026-03-10 19:51:09'),
(230,48,'/upload/facility/4b159dd8-b0f9-4ea2-86ea-c3afb1a4bfc9.png','N',0,'2026-03-10 19:51:09'),
(231,48,'/upload/facility/e2f5d201-5960-4e68-a02b-51b69fb8f9a7.png','Y',0,'2026-03-10 19:51:09'),
(232,47,'/upload/facility/ecbc0ec2-633b-47fc-898f-8d7b4d7c3d9f.png','Y',0,'2026-03-10 19:51:47'),
(233,47,'/upload/facility/b122f0b5-4f08-4fc8-b6b9-a4fb9128bd6e.png','N',0,'2026-03-10 19:51:47'),
(234,47,'/upload/facility/572c0681-2624-48f7-887d-da96e5c079e6.png','N',0,'2026-03-10 19:51:47'),
(235,47,'/upload/facility/bad95e8e-0d7c-46d5-ac1b-0ff08a64f170.png','N',0,'2026-03-10 19:51:47'),
(236,47,'/upload/facility/c8202e05-5f59-4abb-9e84-50d83426d059.png','N',0,'2026-03-10 19:51:47'),
(237,46,'/upload/facility/6379cbc1-efe0-498c-b38c-707b87286323.png','Y',0,'2026-03-10 19:52:10'),
(238,46,'/upload/facility/81124148-8f09-4be0-8cb0-cdd4dfe9f371.png','N',0,'2026-03-10 19:52:10'),
(239,46,'/upload/facility/033c8574-8b29-46d6-a5a3-2ced7d5ca155.png','N',0,'2026-03-10 19:52:10'),
(240,46,'/upload/facility/c6f27b7e-4fa9-4c43-83ac-6c58bc3af0d7.png','N',0,'2026-03-10 19:52:10'),
(241,46,'/upload/facility/5453c699-53c4-4132-ae20-d7e73278d40b.png','N',0,'2026-03-10 19:52:10'),
(242,45,'/upload/facility/965112b1-e41b-4ce1-988e-dee8c120346b.png','Y',0,'2026-03-10 19:52:29'),
(243,45,'/upload/facility/a346f3be-8be4-468b-91c5-0b3fe3bce8ac.png','N',0,'2026-03-10 19:52:29'),
(244,45,'/upload/facility/47a4f5d5-5e10-4573-af89-5771b9a319ce.png','N',0,'2026-03-10 19:52:29'),
(245,45,'/upload/facility/8759527f-f5dd-4097-b438-b1adf0344bda.png','N',0,'2026-03-10 19:52:29'),
(246,45,'/upload/facility/79f86587-6e70-4169-8301-fe2d0f3ec250.png','N',0,'2026-03-10 19:52:29');
/*!40000 ALTER TABLE `facility_image` ENABLE KEYS */;
UNLOCK TABLES;


-- =============================================
-- 9. qna (FK → users)
-- =============================================

DROP TABLE IF EXISTS `qna`;
CREATE TABLE `qna` (
  `qna_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Q&A 고유 번호',
  `user_id` varchar(50) NOT NULL COMMENT '작성자 회원 아이디',
  `title` varchar(200) NOT NULL COMMENT '문의 제목',
  `content` text NOT NULL COMMENT '문의 내용',
  `answer` text DEFAULT NULL COMMENT '관리자 답변 내용',
  `answer_date` datetime DEFAULT NULL COMMENT '답변 등록 일시',
  `status` enum('WAITING','ANSWERED') DEFAULT 'WAITING' COMMENT '답변 상태 (WAITING: 답변대기, ANSWERED: 답변완료)',
  `view_count` int(11) DEFAULT 0 COMMENT '조회수',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '문의 등록 일시',
  PRIMARY KEY (`qna_no`) USING BTREE,
  KEY `fk_qna_user` (`user_id`),
  CONSTRAINT `fk_qna_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES
(1,'user01','체크인 시간 변경 가능한가요?','예약한 날짜에 오후 2시 이후 체크인이 가능한지 문의드립니다.','안녕하세요, VIN\'st Hotel입니다. 체크인은 기본 오후 3시이며, 객실 상황에 따라 얼리 체크인 가능합니다. 프런트로 문의 부탁드립니다. gg','2026-03-06 12:53:47','ANSWERED',27,'2026-02-28 14:30:00'),
(2,'user02','조식 포함 여부 확인 부탁드립니다.','예약 시 조식 포함으로 선택했는데 확인이 가능할까요?','네, 고객님 예약에 조식 2인이 포함되어 있습니다. 레스토랑은 오전 7시~10시 운영입니다.','2026-03-02 09:00:00','ANSWERED',3,'2026-03-01 18:00:00'),
(3,'user03','주차 공간이 있나요?','차량을 가지고 방문하려고 하는데 주차 가능한지 궁금합니다.','지하 주차장 운영 중이며 투숙객은 무료입니다. 대형 차량은 사전 문의 바랍니다.','2026-03-03 11:00:00','ANSWERED',7,'2026-03-02 20:00:00'),
(5,'user01','룸 업그레이드 요청 가능한가요?','결혼기념일 방문인데 룸 업그레이드가 가능한지 문의드립니다.','쉽지 않아요','2026-03-10 16:46:33','ANSWERED',11,'2026-03-05 08:00:00'),
(29,'essong','탈퇴문의드립니다','방금 요청했는데 승인언제되나요?','승인 완료되었습니다','2026-03-11 15:51:36','ANSWERED',4,'2026-03-11 10:12:29'),
(33,'essong','방내부 궁금합니다','궁금합니다.',NULL,NULL,'WAITING',1,'2026-03-11 15:53:35'),
(34,'essong','주차관련 문의드려요','문의드려요',NULL,NULL,'WAITING',1,'2026-03-11 15:53:56'),
(35,'essong','예약시 조식포함했는데 확인부탁드려요','부탁드려요',NULL,NULL,'WAITING',1,'2026-03-11 15:55:06'),
(36,'essong','예약 취소 환불 규정이 어떻게 되나요?','환불규정',NULL,NULL,'WAITING',1,'2026-03-11 15:55:22'),
(37,'essong','반려 동물 동반 가능한지 문의드려요','문의 드려요',NULL,NULL,'WAITING',1,'2026-03-11 15:55:38');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
