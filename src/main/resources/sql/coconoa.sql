-- PJY
create table senior_enable_schedule(
    id varchar2(38),
    schedule_code varchar2(8),
    status varchar2(2),
    work_status varchar2(2)    
);

create table mailbox(
    no number,
    rev_id varchar2(38),
    send_id varchar2(38),
    content varchar2(1000),
    matching_number number,
    status varchar2(10),
    send_time date default sysdate
);

create table matching_m(
    matching_number number primary key,
    snr_id varchar2(38),
    par_id varchar2(38),
    start_date date,
    end_date date,
    schedule_code varchar2(300),
    pick_up_place varchar2(300),
    arrive_place varchar2(300),
    status varchar2(24)
);

create table matching_d(
    matching_number number,
    schedule_code varchar2(8),
    day date,
    status varchar2(24)
);

-- JSY
CREATE TABLE USER_INFO (
	ID VARCHAR2(38) PRIMARY KEY,
   	PASSWORD VARCHAR2(38) NOT NULL,
	NAME VARCHAR2(38) NOT NULL,
	BIRTHDAY DATE NOT NULL,
	PHONE_NUMBER VARCHAR2(50) NOT NULL,
	POST_CODE VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(300) NOT NULL,
    DETAIL_ADDRESS VARCHAR2(300) ,
    EXTRA_ADDRESS VARCHAR2(30) ,
	GENDER VARCHAR2(1) NOT NULL,
    EMAIL VARCHAR2(100),
	USER_CODE VARCHAR2(10) NOT NULL,
	REG_DATE DATE DEFAULT SYSDATE
);
 
    CREATE TABLE PAR(
    ID VARCHAR2(38) PRIMARY KEY,
    C_NAME VARCHAR2(38) NOT NULL,
    BIRTHYEAR DATE NOT NULL,
    C_GENDER VARCHAR(10) NOT NULL,
    PERSONALITY VARCHAR(2000) NOT NULL,
    ETC VARCHAR(2000)
    );

    SELECT * FROM PAR;


--

    CREATE TABLE SNR(
    ID VARCHAR2(38) PRIMARY KEY,
    INFO VARCHAR2(2000),
    AREA VARCHAR2(300)
    );
    
    SELECT * FROM SNR;
    
--

CREATE TABLE AGREEMENT (
	ID VARCHAR2(38) PRIMARY KEY,
    AGREE_CODE_01 VARCHAR2(10),
    AGREE_CODE_02 VARCHAR2(10),
    AGREE_CODE_03 VARCHAR2(10)
    );_

-- KDH

--이미지파일
CREATE TABLE image_file
(
 uploadnumber number(5),
 fileName varchar2(200),
 filePath varchar2(200),
 id varchar2(38)
);
CREATE SEQUENCE image_file_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  NOCACHE;
  
  ALTER TABLE image_file
  MODIFY uploadnumber DEFAULT image_file_seq.nextval;
--인증
CREATE TABLE VERIFICATION(
  verification_num number(10),
  idcpicture varchar2(40),
  cmnpicture varchar2(40),
  id varchar2(50) ,
  verification_status VARCHAR2(8) DEFAULT 'N'
);
CREATE SEQUENCE verification_num_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE
    NOCACHE;
--신고
CREATE TABLE REPORT_USERS (
  REPORT_NUM NUMBER(10) PRIMARY KEY,
  PARENT_ID VARCHAR2(38),
  SENIOR_ID VARCHAR2(38),
  NAME VARCHAR2(38),
  REPORTED_REASON VARCHAR2(1000),
  REPORT_DATE DATE,
  REPORT_CONFIRM_STATUS VARCHAR2(8) DEFAULT 'N',
  REPORT_COUNT NUMBER(1)
);

CREATE SEQUENCE report_num_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE
    NOCACHE;

-- KYW
CREATE TABLE BOARD(
    article_no NUMBER(10) NOT NULL PRIMARY KEY,
    parent_no NUMBER(10) DEFAULT 0 NOT NULL,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    id VARCHAR2(20) NOT NULL,
    created_at DATE DEFAULT SYSDATE NOT NULL,
    views NUMBER(10) DEFAULT 0 NOT NULL
);