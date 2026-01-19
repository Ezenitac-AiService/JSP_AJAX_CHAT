-- Database 및 Table 생성 시 캐릭터셋 명시 (UTF-8 고도화)
CREATE DATABASE IF NOT EXISTS chatdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE chatdb;

DROP TABLE IF EXISTS chat;
CREATE TABLE chat
(
    cno int PRIMARY KEY AUTO_INCREMENT COMMENT '채팅번호',
    cdate datetime DEFAULT NOW() COMMENT '작성일자',
    cname varchar(100) COMMENT '작성자명',
    cnote text COMMENT '채팅내용'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET NAMES utf8mb4;

INSERT INTO chat (cname, cnote) VALUES 
('홍길동', '안녕하세요?? 1번 메시지입니다.'),
('홍길동', '안녕하세요?? 2번 메시지입니다.'),
('홍길동', '안녕하세요?? 3번 메시지입니다.');
