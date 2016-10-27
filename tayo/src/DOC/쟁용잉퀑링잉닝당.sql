CREATE TABLE USERINFO(                     --USER는 테이블명 부적합 오류발생
ID       VARCHAR2(40),                     -- 아이디
NAME     VARCHAR2(20) NOT NULL,            -- 이름
BIRTH    VARCHAR2(30) NOT NULL,            -- 생년월일
TEL      VARCHAR2(30) NOT NULL,            -- 휴대폰번호
ADDR     VARCHAR2(200) NOT NULL,           -- 주소
PW       VARCHAR2(10) NOT NULL,            -- 대여비밀번호
JDATE    DATE DEFAULT SYSDATE,             -- 가입날짜
RANK     NUMBER(1) NOT NULL,               -- 등급
STATUS   NUMBER(1) NOT NULL,               -- 계정상태
LDATE    DATE DEFAULT SYSDATE,             -- 접속일
AGREE    CHAR(1) DEFAULT 'N' NOT NULL,     -- 개인정보동의
CONSTRAINT USERINFO_ID_PK PRIMARY KEY (ID) -- primary key: 아이디
);

COMMIT;

SELECT * FROM userinfo;

INSERT INTO userinfo VALUES('seiko__@naver.com','이재용','2010-02-04','010-1234-1234','서울시 구로구','1234',SYSDATE,1,1,SYSDATE,'Y');

DELETE FROM userinfo WHERE id='seiko__@naver.com';








SELECT *
  FROM
       (SELECT ROWNUM AS RNO,
              NO,
              WRITER,
              TITLE,
              WDAY,
              HIT,
              LGROUP,
              LSTEP,
              LORDER,
              IP
         FROM
              (SELECT ROWNUM,
                     ab_NO AS NO,
                     ab_Writer AS WRITER,
                     ab_Title AS TITLE,
                     ab_Date AS WDAY,
                     ab_Hit AS HIT,
                     ab_Group AS LGROUP,
                     ab_Step AS LSTEP,
                     ab_Order AS LORDER,
                     ab_IP AS IP
                FROM AnBoard
               WHERE ab_isShow ='0'
            ORDER BY ab_Group DESC,
                     ab_Order ASC
              )
       )
 WHERE RNO BETWEEN 1 AND 5;





SELECT * FROM
(SELECT row_number() OVER (ORDER BY ab_group desc, ab_order ASC) RANK,
       ab_NO AS NO,
       ab_Writer AS writer,
       ab_title AS TITLE,
       ab_date AS WDAY,
       ab_Hit AS HIT,
       ab_Group AS LGROUP,
       ab_Step AS LSTEP,
       ab_Order AS LORDER

  FROM anboard
  )
  WHERE rank BETWEEN 1 AND 5;

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
);

COMMIT;


INSERT INTO freeboard VALUES(1,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(2,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(3,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
 INSERT INTO freeboard VALUES(4,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
 INSERT INTO freeboard VALUES(5,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
 INSERT INTO freeboard VALUES(6,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
 INSERT INTO freeboard VALUES(7,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
 INSERT INTO freeboard VALUES(8,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(9,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(10,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(11,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(12,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(13,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(14,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(15,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(16,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(17,'이재용','자유게시판 제목','자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');
INSERT INTO freeboard VALUES(18,'이재용2','1자유게시판 제목','1자유게시판 본문',SYSDATE,1,1,1,'165.162.101.100','T');



INSERT INTO freeboard VALUES
       (
              (SELECT NVL(MAX(rb_No),0) +1
                FROM ReBoard
              ),
              ,
              ?,
              ?,
              ?,
              SYSDATE,
              0,
              0,
              0,
              ?,
              'T'
          )




DESC FREEBOARD;
SELECT NO, FWRITER, FTITLE, FDATE
FROM FREEBOARD
WHERE ISSHOW = 'T';


SELECT COUNT(*) AS TOTAL FROM FREEBOARD WHERE ISSHOW = 'T';


SELECT NO, FWRITER, FTITLE, FDATE, FHIT
FROM FREEBOARD
WHERE ISSHOW = 'T';









SELECT NO, FWRITER, FTITLE, FDATE
FROM FREEBOARD
WHERE ISSHOW = 'T'
	AND NO BETWEEN 1 AND 5;




  SELECT * FROM
(SELECT row_number() OVER (ORDER BY NO  desc) RANK,
       NO,
       fwriter,
       fTITLE,
       fDATE,
       FHIT
  FROM FREEBOARD
  )
  WHERE rank BETWEEN 1 AND 10;

  SELECT * FROM FREEBOARD;