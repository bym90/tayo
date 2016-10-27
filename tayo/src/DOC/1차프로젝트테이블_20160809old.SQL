
CREATE TABLE USERINFO(                     --USER는 테이블명 부적합 오류발생
ID       VARCHAR2(40),                     -- 아이디  
NAME     VARCHAR2(20) NOT NULL,            -- 이름
BIRTH    VARCHAR2(30) NOT NULL,            -- 생년월일
TEL      VARCHAR2(30) NOT NULL,            -- 휴대폰번호
ADDR     VARCHAR2(200) NOT NULL,           -- 주소
PW       VARCHAR2(10) NOT NULL,            -- 대여비밀번호
JDATE    DATE DEFAULT SYSDATE,             -- 가입날짜
RANK     NUMBER(1) DEFAULT 2 NOT NULL,     -- 등급
STATUS   NUMBER(1) DEFAULT 0 NOT NULL,     -- 계정상태
LDATE    DATE DEFAULT SYSDATE,             -- 접속일
AGREE    CHAR(1) DEFAULT 'N' NOT NULL,     -- 개인정보동의
CONSTRAINT USERINFO_ID_PK PRIMARY KEY (ID) -- primary key: 아이디
);                                         -- 수정 0804 09:02 치현

CREATE TABLE RESERVE(
ID        VARCHAR2(40),                       -- 아이디
ATEL      VARCHAR2(30),                       -- 추가연락처
RDAY      VARCHAR2(30) NOT NULL,              -- 예약날짜
RSTIME    VARCHAR2(30) NOT NULL,              -- 예약시작시간
RETIME    VARCHAR2(30) NOT NULL,              -- 예약종료시간
CHARGE    VARCHAR2(30) NOT NULL,              -- 요금
BYNO      VARCHAR2(30) NOT NULL UNIQUE,       -- 자전거번호
RSTATUS   NUMBER(1) NOT NULL,                 -- 예약상태
BIGO      VARCHAR2(4000),                     -- 비고
LOCATION  VARCHAR2(200) NOT NULL,             -- 주소
CONSTRAINT RESERVE_ID_PK PRIMARY KEY (ID),    -- primary key 아이디
CONSTRAINT RESERVE_ID_FK FOREIGN KEY (ID)     -- foreign key 아이디
  REFERENCES USERINFO(ID) ON DELETE CASCADE
);                                            -- 수정 0804 09:11 치현

-- 예약 정보 테스트용 데이터 2개 삽입 예제	수정 0809 09:56 치현
INSERT INTO RESERVE(
  ID,ATEL,RDAY,RSTIME,RETIME,CHARGE,BYNO,RSTATUS,BIGO,LOCATION
) 
VALUES(
  'anchi15@naver.com','070-4444-4444','20160809','09:00','10:00',
  '500','A1000','0','테스트용데이터여.','서울특별시 구로구 신도림동 460-26'
);

INSERT INTO RESERVE(
  ID,ATEL,RDAY,RSTIME,RETIME,CHARGE,BYNO,RSTATUS,BIGO,LOCATION
) 
VALUES(
  'java3333@naver.com','070-5555-8888','20160808','09:00','10:00',
  '500','A1001','2','테스트용데이터여.','서울특별시 마포구 상암동 487-257'
);

CREATE TABLE STATION(
STNO      NUMBER(3),                                  -- 지점번호
GU        VARCHAR2(30) NOT NULL,                      -- 구
DONG      VARCHAR2(30) NOT NULL,                      -- 동
JIJEOM    VARCHAR2(30) UNIQUE NOT NULL,               -- 지점
LOCATION  VARCHAR2(200) NOT NULL,                     -- 주소
STEL      VARCHAR2(30) NOT NULL,                      -- 지점전화번호
BCOUNT    NUMBER(5) NOT NULL,                         -- 대수
CONSTRAINT STATION_STNO_PK PRIMARY KEY (STNO)         -- primary key 지점번호
);                                                    -- 수정 0804 09:24 치현

-- 지점 정보 삽입 예제.

INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'구로구','신도림동','신도림역지점','서울특별시 구로구 신도림동 460-26','02-6110-2341',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'구로구','신도림동','신도림동주민센터지점','서울특별시 구로구 신도림동 390-44','02-2620-7100',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'구로구','구로동','구로역지점','서울특별시 구로구 구로동 585-3','02-1544-7788',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'구로구','구로동','구로5동주민센터지점','서울특별시 구로구 구로5동 109-4','02-2620-7600',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'영등포구','여의도동','여의도역지점','서울특별시 영등포구 여의도동 3','02-6311-5261',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'영등포구','여의도동','여의나루역지점','서울특별시 영등포구 여의도동 84-4','02-6311-5271',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'영등포구','당산동','당산역지점','서울특별시 영등포구 당산동6가 323-1','02-6110-2371',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'영등포구','당산동','당산2동주민센터지점','서울특별시 영등포구 당산동4가 86-2','02-2670-1129',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'동작구','노량진동','노량진역지점','서울특별시 동작구 노량진동 67-2','02-1544-7788',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'동작구','노량진동','노량진2동주민센터지점','서울특별시 동작구 노량진2동 302-97','02-812-0903',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'동작구','사당동','이수역지점','서울특별시 동작구 사당동 144-4','02-6311-7361',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'동작구','사당동','남성역지점','서울특별시 동작구 사당동 산 25-33','02-6311-7371',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'마포구','망원동','망원1동주민센터지점','서울특별시 마포구 망원1동 403-2','02-3153-6800',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'마포구','망원동','망원한강공원지점','서울특별시 마포구 망원동 205-4','02-3780-0601',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'마포구','상암동','하늘공원지점','서울특별시 마포구 상암동 482','02-300-5501',20);
INSERT INTO STATION VALUES((SELECT NVL(MAX(STNO),0) + 1 FROM STATION),'마포구','상암동','난지한강공원지점','서울특별시 마포구 상암동 487-257','02-3780-06111',20);

SELECT * FROM STATION;

CREATE TABLE BICYCLEINFO(
BYNO    VARCHAR2(30),                               -- 자전거 번호
BSTATUS NUMBER(1) NOT NULL,                         -- 상태
JIJEOM  VARCHAR2(30) NOT NULL UNIQUE,               -- 지점
CONSTRAINT BICYCLEINFO_BYNO_PK PRIMARY KEY (BYNO),  -- primary key 자전거번호
CONSTRAINT BICYCLEINFO_BYNO_FK FOREIGN KEY (BYNO)   -- foreign key 자전거번호
  REFERENCES RESERVE(BYNO) ON DELETE CASCADE,
CONSTRAINT BICYCLEINFO_JIJEOM_FK FOREIGN KEY (JIJEOM)
  REFERENCES STATION (JIJEOM) ON DELETE CASCADE
);                                                  -- 수정 0804 09:23 치현

CREATE TABLE FREEBOARD(
NO        NUMBER(10),                           -- 글번호
FWRITER   VARCHAR2(30) NOT NULL,                -- 작성자
FTITLE    VARCHAR2(200) NOT NULL,               -- 제목
FBODY     CLOB NOT NULL,                        -- 본문
FDATE     DATE DEFAULT SYSDATE,                 -- 쓴날짜
FHIT      NUMBER(10) DEFAULT 0 NOT NULL,        -- 조회수
FGOOD     NUMBER(10) DEFAULT 0 NOT NULL,        -- 좋아요
FBAD      NUMBER(10) DEFAULT 0 NOT NULL,        -- 싫어요
FIP       VARCHAR2(16) NOT NULL,                -- 글쓴이 아이피
ISSHOW    CHAR(1) DEFAULT 'T' NOT NULL,         -- 삭제
CONSTRAINT FREEBOARD_NO_PK PRIMARY KEY (NO)     -- primary key 글번호
);                                              -- 수정 0804 09:33 치현

CREATE TABLE QNABOARD(
NO        NUMBER(10),                           -- 글번호
QWRITER   VARCHAR2(30) NOT NULL,                -- 작성자
QTITLE    VARCHAR2(200) NOT NULL,               -- 제목
QBODY     CLOB NOT NULL,                        -- 본문
QDATE     DATE DEFAULT SYSDATE NOT NULL,        -- 쓴날짜
QHIT      NUMBER(10) DEFAULT 0 NOT NULL,        -- 조회수
QIP       VARCHAR2(16) NOT NULL,                -- 글쓴이 아이피
QGROUP    NUMBER(5) DEFAULT 0 NOT NULL,         -- 그룹
QSTEP     NUMBER(5) DEFAULT 0 NOT NULL,         -- 스텝
QORDER    NUMBER(5) DEFAULT 0 NOT NULL,         -- 오더
SECRET    CHAR(1) DEFAULT 'N' NOT NULL,         -- 비밀글
ISSHOW    CHAR(1) DEFAULT 'T' NOT NULL,         -- 삭제
CONSTRAINT QNABOARD_NO_PK PRIMARY KEY (NO)      -- primary key 글번호
);                                              -- 수정 0804 10:32 치현

CREATE TABLE REPORTBOARD(
NO        NUMBER(10),                           -- 글번호
WRITER    VARCHAR2(30) NOT NULL,                -- 작성자
RTITLE    VARCHAR2(200) NOT NULL,               -- 제목
RBODY     CLOB NOT NULL,                        -- 본문
RDATE     DATE DEFAULT SYSDATE NOT NULL,        -- 쓴날짜
RHIT      NUMBER(10) DEFAULT 0 NOT NULL,        -- 조회수
RIP       VARCHAR2(16) NOT NULL,                -- 글쓴이 아이피
ISSHOW    CHAR(1) DEFAULT 'T' NOT NULL,         -- 삭제
CONSTRAINT REPORTBOARD_NO_PK PRIMARY KEY (NO)   -- primary key 글번호
);                                              -- 수정 0804 10:38 치현

CREATE TABLE RBOARD(
NO        NUMBER(10),                           		-- 글번호
RENO      NUMBER(10),                           		-- 댓글번호
RWRITER   VARCHAR2(30) NOT NULL,                		-- 작성자
RTITLE    VARCHAR2(200) NOT NULL,               		-- 제목
RBODY     CLOB NOT NULL,                        		-- 본문
RDATE     DATE DEFAULT SYSDATE NOT NULL,        		-- 작성일
ISSHOW    CHAR(1) DEFAULT 'T' NOT NULL,         		-- 삭제
CONSTRAINT                                          	-- foreign key 글번호: freeboard
  REBOARD_NO_FK1 FOREIGN KEY (NO)                   	
    REFERENCES FREEBOARD (NO) ON DELETE CASCADE,    	
CONSTRAINT                                         	  -- foreign key 글번호: reportboard
  REBOARD_NO_FK2 FOREIGN KEY (NO)                   	
    REFERENCES REPORTBOARD (NO) ON DELETE CASCADE,  	
CONSTRAINT REBOARD_RENO_PK PRIMARY KEY (RENO)       	-- primary key 댓글번호
);

CREATE TABLE FILETABLE(
NO      NUMBER(10),                                   -- 글번호
FNO     NUMBER(10),                                   -- 파일번호
SNAME   VARCHAR2(100) NOT NULL,                       -- 저장이름
ONAME   VARCHAR2(100) NOT NULL,                       -- 원래이름
PATH    VARCHAR2(100) NOT NULL,                       -- 경로
LENGTH  NUMBER(12) NOT NULL,                          -- 길이
CONSTRAINT FILE_NO_FK FOREIGN KEY (NO)                -- foreign key 글번호
  REFERENCES REPORTBOARD (NO) ON DELETE CASCADE,
CONSTRAINT FILE_FNO_PK PRIMARY KEY (FNO)              -- primary key 파일번호
);

COMMIT;

DROP TABLE FILETABLE;
DROP TABLE RBOARD;
DROP TABLE REPORTBOARD;
DROP TABLE QNABOARD;
DROP TABLE FREEBOARD;
DROP TABLE BICYCLEINFO;
DROP TABLE STATION;
DROP TABLE RESERVE;
DROP TABLE USERINFO;

