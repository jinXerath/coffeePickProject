-- 관리자 임시 데이터
-- 최고 관리자 레코드
INSERT INTO admin(admin_no, admin_id, admin_pw, admin_name, admin_phone,  admin_email, admin_regdate, admin_authority)
VALUES(admin_seq.nextval, 'qwer1234', '1234', '배준영', '010-7777-7777', 'qwer1234@gmail.com', default, 'S');

-- 1번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin1', 'password1', 'Admin 1', '123-456-7890', 'admin1@example.com');

-- 2번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin2', 'password2', 'Admin 2', '987-654-3210', 'admin2@example.com');

-- 3번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin3', 'password3', 'Admin 3', '111-222-3333', 'admin3@example.com');

-- 4번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin4', 'password4', 'Admin 4', '444-555-6666', 'admin4@example.com');

-- 5번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin5', 'password5', 'Admin 5', '777-888-9999', 'admin5@example.com');

-- 6번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin6', 'password6', 'Admin 6', '123-987-6543', 'admin6@example.com');

-- 7번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin7', 'password7', 'Admin 7', '987-123-4567', 'admin7@example.com');

-- 8번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin8', 'password8', 'Admin 8', '333-444-5555', 'admin8@example.com');

-- 9번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin9', 'password9', 'Admin 9', '666-777-8888', 'admin9@example.com');

-- 10번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin10', 'password10', 'Admin 10', '555-999-1234', 'admin10@example.com');

-- 11번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin11', 'password11', 'Admin 11', '123-111-2222', 'admin11@example.com');

-- 12번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin12', 'password12', 'Admin 12', '987-222-3333', 'admin12@example.com');

-- 13번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin13', 'password13', 'Admin 13', '111-333-4444', 'admin13@example.com');

-- 14번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin14', 'password14', 'Admin 14', '444-444-5555', 'admin14@example.com');

-- 15번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin15', 'password15', 'Admin 15', '777-555-6666', 'admin15@example.com');

-- 16번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin16', 'password16', 'Admin 16', '123-666-7777', 'admin16@example.com');

-- 17번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin17', 'password17', 'Admin 17', '987-777-8888', 'admin17@example.com');

-- 18번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin18', 'password18', 'Admin 18', '333-888-9999', 'admin18@example.com');

-- 19번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin19', 'password19', 'Admin 19', '666-999-1111', 'admin19@example.com');

-- 20번 레코드
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email)
VALUES (admin_seq.nextval, 'admin20', 'password20', 'Admin 20', '555-111-2222', 'admin20@example.com');

-- 관리자 키 데이터
insert into admin_key
values ('123412341234');

--------------------------------------------------------------------------------




select
    nvl((
        select 1 from admin
        where admin_id = '123'
    ),0) as state
from dual;

DROP INDEX admin_index;
CREATE INDEX admin_index ON admin(admin_regdate DESC);
CREATE INDEX admin_index ON admin(admin_regdate DESC, admin_id ASC);

select /*+ index(admin admin_pk) */
*
from admin;

select
*
from admin
where admin_regdate > '1/01/01';

ALTER TABLE admin MODIFY (admin_regdate NOT NULL);


select /*+ INDEX_DESC(admin admin_admin_no_pk) */
    *
from admin;


select * from admin;

SELECT /*+ index(admin admin_index) */
admin_regdate
FROM admin;

select * from admin order by admin_regdate;

delete from admin purge;

SELECT rownum as rnum, admin_id, admin_name, admin_phone, admin_email, admin_regdate, admin_authority
				FROM admin
				ORDER BY admin_regdate DESC;




select * from admin_key;
select * from admin;
UPDATE admin
SET admin_pw = 'zxcv' 
WHERE admin_id = 'zxcv';


-- 개인 회원 상담/문의 게시판
CREATE TABLE member_qna (
	member_qna_no	        NUMBER	        NOT NULL,
	member_qna_title	    VARCHAR2(100)	NOT NULL,
	member_qna_content	    CLOB	        NOT NULL,
	member_qna_secret	    CHAR(1)	        NOT NULL,
	member_qna_img	        VARCHAR2(500)	NULL,
	member_qna_regdate	    DATE	        DEFAULT SYSDATE,
	member_id	            VARCHAR2(15)	NOT NULL,
    
    CONSTRAINT member_qna_member_qna_no_pk PRIMARY KEY(member_qna_no),
    CONSTRAINT member_qna_member_qna_secret_ck CHECK(member_qna_secret IN('Y','N'))
);

-- 개인 회원 상담/문의 답글
CREATE TABLE member_qna_reply (
	member_qna_no               NUMBER	    NOT NULL,
	member_qna_reply_content	CLOB	    NOT NULL,
	member_qna_reply_regdate	DATE	    DEFAULT SYSDATE,
    
    CONSTRAINT member_qna_reply_member_qna_no_pk PRIMARY KEY(member_qna_no),
    CONSTRAINT member_qna_reply_member_qna_no_fk FOREIGN KEY(member_qna_no) REFERENCES member_qna(member_qna_no) ON DELETE CASCADE
);

-- 기업 회원 상담/문의 게시판
CREATE TABLE corp_qna (
	corp_qna_no	        NUMBER	        NOT NULL,
	corp_qna_title	    VARCHAR2(100)	NOT NULL,
	corp_qna_content	CLOB	        NOT NULL,
	corp_qna_secret	    CHAR(1)	        NOT NULL,
	corp_qna_img	    VARCHAR2(500)	NULL,
	corp_qna_regdate	DATE	        DEFAULT SYSDATE,
	corp_id	            VARCHAR2(15)	NOT NULL,
    
    CONSTRAINT corp_qna_corp_qna_no_pk PRIMARY KEY(corp_qna_no),
    CONSTRAINT corp_qna_corp_qna_secret_ck CHECK(corp_qna_secret IN('Y','N'))
);

-- 기업 회원 상담/문의 답글
CREATE TABLE corp_qna_reply (
	corp_qna_no	            NUMBER	NOT NULL,
	corp_qna_reply_content	CLOB	NOT NULL,
	corp_qna_reply_regdate	DATE	DEFAULT SYSDATE,
    
    CONSTRAINT corp_qna_reply_corp_qna_no_pk PRIMARY KEY(corp_qna_no),
    CONSTRAINT corp_qna_reply_corp_qna_no_fk FOREIGN KEY(corp_qna_no) REFERENCES corp_qna(corp_qna_no) ON DELETE CASCADE
);