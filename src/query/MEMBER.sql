----------------------------------------
---- 회원 테이블 -----------------------
----------------------------------------
CREATE TABLE MEMBER (
      CODE VARCHAR2(8) NOT NULL
      , EGENCY VARCHAR2(50) NOT NULL
      , ID VARCHAR(50) NOT NULL
      , NAME VARCHAR2(50) NOT NULL
      , PHONE VARCHAR2(30) NOT NULL
      , EMAIL VARCHAR2(50)
      , PW VARCHAR2(50) NOT NULL
      , REPW VARCHAR2(50) NOT NULL
      , PRIMARY KEY(ID)
);

----------------------------------------
---- 내부인 테스트 회원 데이터 삽입 ----
----------------------------------------
INSERT INTO MEMBER (
    CODE
    , DEPARTMENT
    , ID
    , NAME
    , PHONE
    , EMAIL
    , PW
    , REPW 
)
VALUES (
    'AGENCY'
    ,'이젠아카데미'
    ,'a'
    ,'테스트'
    ,'01051889303'
    ,'test1@naver.com'
    ,'1234'
    ,'1234'
);

----------------------------------------
---- 내부인 테스트 회원 데이터 삽입 ----
----------------------------------------
INSERT INTO MEMBER (
    CODE
    , DEPARTMENT
    , ID
    , NAME
    , PHONE
    , EMAIL
    , PW
    , REPW 
)
VALUES (
    'SELLER'
    ,'외부거래처'
    ,'s'
    ,'외부거래처계정'
    ,'01051889303'
    ,'test1@naver.com'
    ,'1234'
    ,'1234'
);


----------------------------------------
---- 관리자 계정 데이터 삽입 -----------
----------------------------------------

INSERT INTO MEMBER (
    CODE
    , DEPARTMENT
    , ID
    , NAME
    , PHONE
    , EMAIL
    , PW
    , REPW 
)
VALUES (
    'ADMIN'
    ,'관리자'
    ,'a'
    ,'관리자'
    ,'01012345678'
    ,'9303kj@gmail.com'
    ,'1234'
    ,'1234'
);


SELECT
	CODE
	, DEPARTMENT
	, ID
	, NAME
    , REGEXP_REPLACE(PHONE, '(02|.{3})(.+)(.{4})', '\1-\2-\3')
	, EMAIL
	, PW
	, REPW
FROM MEMBER;

commit;