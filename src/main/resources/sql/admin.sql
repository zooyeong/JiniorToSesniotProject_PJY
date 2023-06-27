-- admin 테이블 생성도 진행중...

CREATE TABLE REPORT_USERS (
REPORT_NUM NUMBER(10) PRIMARY KEY,
SENIOR_ID VARCHAR2(38) NOT NULL,
PARENT_ID VARCHAR2(38) NOT NULL,
NAME VARCHAR2(38) NOT NULL,
REPORTED_REASON VARCHAR2(1000) NOT NULL,
REPORT_DATE DATE NOT NULL,
REPORT_CONFIRM_STATUS VARCHAR2(8) DEFAULT 'N',
REPORT_COUNT NUMBER(1) DEFAULT 0
);

select * from report_users; 
--drop table report_users; 

insert into report_users 
values (num_seq.nextval, 'ektkfka123', 'hohoho22', '황호춘', '약속장소에 노쇼해서 아이가 혼자 귀가했습니다. 이럴거면 서비스 제공하지 마세욧!!!!', '2023-06-22', 'N', 0);


select * from user_info;

CREATE SEQUENCE NUM_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;

drop sequence NUM_SEQ;




CREATE TABLE REPORT_USERS (
REPORT_NUM NUMBER(10) PRIMARY KEY,
PARENT_ID VARCHAR2(38) NOT NULL,
SENIOR_ID VARCHAR2(38) NOT NULL,
NAME VARCHAR2(38) NOT NULL,
REPORTED_REASON VARCHAR2(1000) NOT NULL,
REPORT_DATE DATE NOT NULL,
REPORT_CONFIRM_STATUS VARCHAR2(8) DEFAULT 'N',
REPORT_COUNT NUMBER(1) DEFAULT 0
);

select * from report_users; 
--drop table report_users; 

insert into report_users 
values (num_seq.nextval, 'qktkfka123', 'hohoho22', '황호춘', '약속장소에 노쇼해서 아이가 혼자 귀가했습니다. 이럴거면 서비스 제공하지 마세욧!!!!', '2023-06-22', 'N', 0);


select * from user_info;

CREATE SEQUENCE NUM_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--drop sequence NUM_SEQ;



		select * from report_users;