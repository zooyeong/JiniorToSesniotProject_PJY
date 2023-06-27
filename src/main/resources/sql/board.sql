--게시판 테이블 생성
CREATE TABLE BOARD(
    article_no NUMBER(10) NOT NULL,
    parent_no NUMBER(10) DEFAULT 0 NOT NULL,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    id VARCHAR2(20) NOT NULL,
    created_at DATE DEFAULT SYSDATE NOT NULL,
    views NUMBER(10) DEFAULT 0 NOT NULL
);

-- 페이징을 위한 쿼리문
select level, article_no, parent_no, title, content, id , created_at, views
		from  board start with parent_no = 0 connect by prior article_no = parent_no order siblings by article_no desc
        offset 0 rows fetch first 10 rows only;

-- 답변이 부모글 밑에 올 수 있도록 수정한 쿼리
select * from
(
    select level, article_no, parent_no, title, content, id , created_at, views
            from  board start with parent_no = 0 connect by prior article_no = parent_no order siblings by article_no desc
) offset 0 rows fetch first 10 rows only;
