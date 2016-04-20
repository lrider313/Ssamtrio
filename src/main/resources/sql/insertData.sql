-- phpMyAdmin SQL Dump
-- version 2.11.5.1
-- http://www.phpmyadmin.net
--
-- 호스트: localhost
-- 처리한 시간: 16-04-20 17:09 
-- 서버 버전: 5.1.45
-- PHP 버전: 5.2.17p1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 데이터베이스: 'lrider'
--

--
-- 테이블의 덤프 데이터 'BOARD'
--

INSERT INTO BOARD (BOARDID, BOARDTITLE) VALUES
(1, '공지사항'),
(2, '맵자료실'),
(3, '고객센터');


--
-- 데이터베이스: 'lrider'
--

--
-- 테이블의 덤프 데이터 'MEMBER'
--

INSERT INTO MEMBER (MEMID, MEMPW, MEMNAME, MEMNICK, MEMEMAIL, MEMPHONE, MEMADDR, MEMAUTH, MEMDATE, MEMLVL) VALUES
('lrider', 'dlrltn', '이기수', '불량작가', 'lrider@gmail.com', '010-4848-339', '경기도 화성시 능동', 1, '2016-04-20 09:35:56', 100),
('siven', 'gksehdghks', '한동환', '한동환이다', 'siven@naver.com', NULL, NULL, 1, '2016-04-20 09:37:18', 100);


--
-- 데이터베이스: 'lrider'
--

--
-- 테이블의 덤프 데이터 'STRUMN'
--

INSERT INTO STRUMN (STRID, STRTITLE, STRCONT, STRTYPE, STRIP, STRCOUNT, STRDATE, BOARDID, MEMID) VALUES
(1, '빠무', '빠른 무한의 약자.\r\n미네랼과 가스의 수급이 매우 빠른 것이 특징이다. 이런 특징 때문에 일반 맵보다 게임진행이 빠르다.', 'operation', '0:0:0:0:0:0:0:1', 0, '2016-04-20 10:37:43', 2, 'lrider'),
(2, '벌컨', '벌처컨트롤의 약자.\r\n벌처를 컨트롤하여 생성된 모든 유닛을 처치하면 된다.', 'controll', '0:0:0:0:0:0:0:1', 0, '2016-04-20 11:15:21', 2, 'lrider'),
(3, '개랜디', '개인랜덤디팬스의 약자.\r\n각자 랜덤하게 유닛을 뽑아서 적 유닛을 모두 죽이면 클리어.', 'depence', '0:0:0:0:0:0:0:1', 0, '2016-04-20 15:14:30', 2, 'lrider'),
(4, '마라톤', '랜덤하게 생성된 유닛을 가지고 지정된 트랙을 다 돌면 게임이 완료.', 'controll', '0:0:0:0:0:0:0:1', 0, '2016-04-20 15:15:06', 2, 'lrider'),
(5, '넥뿌', '넥서스부시기의 약자.\r\n상대방의 넥서스를 부시면 이긴다.', 'operation', '0:0:0:0:0:0:0:1', 0, '2016-04-20 15:15:41', 2, 'lrider'),
(6, '컴까기', '쏟아지는 컴퓨터의 물량을 막고 컴퓨터를 엘리 시키면 이긴다.', 'operation', '0:0:0:0:0:0:0:1', 0, '2016-04-20 15:16:36', 2, 'lrider'),
(7, '저글링 막기', '랜덤하게 나오는 유닛으로 쏟아지는 저글링을 모두 죽이면 클리어.', 'depence', '0:0:0:0:0:0:0:1', 0, '2016-04-20 15:17:34', 2, 'lrider'),
(8, '개랜컨', '개인랜덤컨트롤의 약자.\r\n랜덤하게 나온 유닛을 가지고 컨트롤해서 적 유닛을 모두 섬멸하면 클리어.', 'controll', '0:0:0:0:0:0:0:1', 0, '2016-04-20 15:18:28', 2, 'lrider');


--
-- 데이터베이스: 'lrider'
--

--
-- 테이블의 덤프 데이터 'STRUMF'
--

INSERT INTO STRUMF (MAPID, MAPNAME, MAPCOUNT, MAPLOD, MAPTIME, MAPMINN, MAPMAXN, MAPVER, MAPCRT, MAPMANA, STRID) VALUES
(1, '[                  그린빠무.SCX', 0, 'veryEasy', 'half', 2, 8, 'green', '', 'n', 1),
(2, '[                  졸라빠무.scx', 0, 'veryEasy', 'half', 2, 8, '졸라', '엉님', 'n', 1),
(3, '[                  빠른무한.scm', 1, 'veryEasy', 'half', 2, 8, '빠른무한', '', 'n', 1),
(4, '벌쳐컨트롤2011.scx', 0, 'easy', 'aHour', 2, 6, '2011', '', 'n', 2),
(5, '벌쳐 컨트롤_울티메잇.scx', 0, 'hard', 'aHour', 3, 6, 'ultimate', '', 'n', 2),
(6, '개랜디 히어로 하드.scx', 0, 'hard', 'soLong', 2, 6, '히어로 하드', '', 'y', 3),
(7, '개랜디싱글Winter미네랄7 (1).scx', 0, 'veryEasy', 'soLong', 1, 6, '싱글Winter', '', 'n', 3),
(8, '혈마 절대 못간다.scx', 0, 'hardcore', 'soLong', 2, 8, '못간다고전해라', '', 'y', 4),
(9, '혈압_마라톤_지옥의맛 ㅋ.scx', 0, 'hardcore', 'soLong', 2, 7, '지옥의 맛', '지옥수호대', 'y', 4),
(10, '넥서스 부수기 테란vs플토7.9.scx', 1, 'easy', 'half', 2, 6, '테란vs플토7.9', '', 'n', 5),
(11, '!1)Super★빠른무한컴까기.scx', 0, 'hard', 'aHour', 2, 6, 'super★', '', 'n', 6),
(12, 'All랜덤저글링막기Hard5.scx', 0, 'hard', 'aHour', 1, 6, 'Hard5', '', 'n', 7),
(13, '[개인랜덤컨트롤[Final].scx', 0, 'normal', 'aHour', 2, 6, 'Final', '', 'n', 8);
