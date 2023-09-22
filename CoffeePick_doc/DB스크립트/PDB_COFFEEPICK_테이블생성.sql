--------------------------------------------------------------------------------
-- 사용자 연관 테이블
--------------------------------------------------------------------------------
-- 개인 회원
CREATE TABLE member (
	member_id	    VARCHAR2(15)	NOT NULL,
	member_pw	    VARCHAR2(20)	NOT NULL,
	member_name	    VARCHAR2(60)	NOT NULL,
	member_nickname	VARCHAR2(30)	NOT NULL,
    member_email	VARCHAR2(100)	NOT NULL,
	member_addr	    VARCHAR2(150)	NOT NULL,
	member_phone	VARCHAR2(20)	NOT NULL,
    member_status	CHAR(1)	        DEFAULT 'Y',
	member_regdate	DATE            DEFAULT SYSDATE,
    
	CONSTRAINT member_member_id_pk PRIMARY KEY(member_id),
    CONSTRAINT member_member_nickname_uk UNIQUE(member_nickname),
    CONSTRAINT member_member_status_ck CHECK(member_status IN('Y','N'))
);

-- 포인트
CREATE TABLE point (
	member_id	    VARCHAR2(15)	NOT NULL,
	point_total	    NUMBER	        DEFAULT 0,
    
    CONSTRAINT point_member_id_pk PRIMARY KEY(member_id),
    CONSTRAINT point_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id)
);

-- 포인트 내역
CREATE TABLE point_history (
	point_history_no	    NUMBER	        NOT NULL,
	point_history_date	    DATE	        NOT NULL,
	point_history_amount	NUMBER	        NOT NULL,
	point_history_reason	CHAR(1)	        NOT NULL,
	member_id	            VARCHAR2(15)	NOT NULL,
    
    CONSTRAINT point_history_no_pk PRIMARY KEY(point_history_no),
    CONSTRAINT point_history_reason_ck CHECK(point_history_reason IN('I','O')),
    CONSTRAINT point_history_member_id_fk FOREIGN KEY(member_id) REFERENCES point(member_id)
);

-- 픽머니(캐시)
CREATE TABLE pickmoney (
	member_id	    VARCHAR2(15)	NOT NULL,
	pickmoney_total	NUMBER	        DEFAULT 0,
    
    CONSTRAINT pickmoney_member_id_pk PRIMARY KEY(member_id),
    CONSTRAINT pickmoney_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id)
);

-- 픽머니(캐시) 내역
CREATE TABLE pickmoney_history (
	pickmoney_history_no	    NUMBER	        NOT NULL,
	pickmoney_history_date	    DATE	        NOT NULL,
	pickmoney_history_amount	NUMBER	        NOT NULL,
	pickmoney_history_reason	CHAR(1)	        NOT NULL,
	member_id	                VARCHAR2(15)	NOT NULL,
    
    CONSTRAINT pickmoney_history_pickmoney_history_no_pk PRIMARY KEY(pickmoney_history_no),
    CONSTRAINT pickmoney_history_pickmoney_history_reason_ck CHECK(pickmoney_history_reason IN('I','O')),
    CONSTRAINT pickmoney_history_member_id_fk FOREIGN KEY(member_id) REFERENCES pickmoney(member_id)    
);

-- 기업 회원
CREATE TABLE corperation (
	corp_id	                    VARCHAR2(15)	NOT NULL,
	corp_pw	                    VARCHAR2(20)	NOT NULL,
	corp_name	                VARCHAR2(60)	NOT NULL,
	corp_email	                VARCHAR2(100)	NOT NULL,
	corp_addr	                VARCHAR2(150)	NOT NULL,
	corp_phone	                VARCHAR2(20)	NOT NULL,
	corp_regdate	            DATE	        DEFAULT SYSDATE,
	corp_registration_number	VARCHAR2(50)	NOT NULL,
	corp_status	                CHAR(1)	        DEFAULT 'Y',
    
    CONSTRAINT corperation_corp_id_pk PRIMARY KEY(corp_id),
    CONSTRAINT corperation_corp_status_ck CHECK(corp_status IN('Y','N'))
);

-- 매장
CREATE TABLE store (
	store_id	            VARCHAR2(21)	NOT NULL,
	store_name	            VARCHAR2(100)	NOT NULL,
	store_addr	            VARCHAR2(150)	NOT NULL,
	store_phone	            VARCHAR2(20)	NOT NULL,
	store_content	        VARCHAR2(500)	NULL,
    store_content_detail	CLOB	        NULL,
	store_operate_hour	    VARCHAR2(100)	NOT NULL,
	store_operate_status	CHAR(1)	        DEFAULT 'N',
	store_regdate	        DATE	        DEFAULT SYSDATE,
	store_img	            VARCHAR2(500)	NULL,
	corp_id	                VARCHAR2(15)	NOT NULL,
    
    CONSTRAINT store_store_id_pk PRIMARY KEY(store_id),
    CONSTRAINT store_store_operate_status_ck CHECK(store_operate_status IN('Y','N')),
    CONSTRAINT store_corp_id_fk FOREIGN KEY(corp_id) REFERENCES corperation(corp_id)
);

-- 메뉴
CREATE TABLE menu (
	menu_no	        NUMBER	        NOT NULL,
	menu_name	    VARCHAR2(100)	NOT NULL,
	menu_price	    NUMBER	        NOT NULL,
	menu_content	VARCHAR2(150)	NOT NULL,
	menu_category	VARCHAR2(50)	NOT NULL,
	menu_img	    VARCHAR2(500)	NOT NULL,
	menu_regdate	DATE	        DEFAULT sysdate,
	store_id	    VARCHAR2(21)	NOT NULL,
    
    CONSTRAINT menu_menu_no_pk PRIMARY KEY(menu_no),
    CONSTRAINT menu_menu_category_ck CHECK(menu_category IN('coffee','nonCoffee','dessert')),
    CONSTRAINT menu_store_id_fk FOREIGN KEY(store_id) REFERENCES store(store_id) ON DELETE CASCADE
);

-- 메뉴 옵션
CREATE TABLE menu_option (
	menu_option_no	    NUMBER	        NOT NULL,
	menu_option_name	VARCHAR2(100)	NOT NULL,
	menu_option_content	VARCHAR2(100)	NOT NULL,
	menu_option_price	NUMBER	        NOT NULL,
	menu_option_regdate	DATE	        DEFAULT SYSDATE,
	menu_no	            NUMBER	        NOT NULL,
    
    CONSTRAINT menu_option_menu_option_no_pk PRIMARY KEY(menu_option_no),
    CONSTRAINT menu_option_menu_no_fk FOREIGN KEY(menu_no) REFERENCES menu(menu_no) ON DELETE CASCADE
);

-- 장바구니
CREATE TABLE cart (
	cart_id	            VARCHAR2(20)	NOT NULL,
	member_id	        VARCHAR2(15)	NOT NULL,
    
    CONSTRAINT cart_cart_id_pk PRIMARY KEY(cart_id),
    CONSTRAINT cart_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id)
);

-- 장바구니 상세
CREATE TABLE cart_detail (
	cart_detail_no	NUMBER	        NOT NULL,
	menu_quantity	NUMBER	        NOT NULL,
	menu_no	        NUMBER	        NOT NULL,
	cart_id	        VARCHAR2(100)	NOT NULL,
    
    CONSTRAINT cart_detail_no_pk PRIMARY KEY(cart_detail_no),
    CONSTRAINT cart_detail_menu_no_fk FOREIGN KEY(menu_no) REFERENCES menu(menu_no) ON DELETE CASCADE,
    CONSTRAINT cart_detail_cart_id_fk FOREIGN KEY(cart_id) REFERENCES cart(cart_id)
);

-- 주문
CREATE TABLE order_history (
	order_no	        VARCHAR2(100)	NOT NULL,
	order_basic_price	NUMBER	        NOT NULL,
	order_use_point	    NUMBER	        DEFAULT 0,
	order_total_price	NUMBER	        NOT NULL,
	order_request	    VARCHAR2(300)	NULL,
	order_status	    NUMBER	        DEFAULT 0,
	order_method	    NUMBER	    NOT NULL,
	order_store_name	VARCHAR2(100)	NOT NULL,
	order_store_phone	VARCHAR2(50)	NOT NULL,
	order_store_addr	VARCHAR2(150)	NOT NULL,
	order_regdate	    DATE	        DEFAULT SYSDATE,
	member_id	        VARCHAR2(100)	NOT NULL,
	store_id	        VARCHAR2(21)	NULL,
    
    CONSTRAINT order_order_no_pk PRIMARY KEY(order_no),
    CONSTRAINT order_order_status_ck CHECK(order_status IN(0,1,2,3,4)),
    CONSTRAINT order_member_order_method_ck CHECK(order_method IN(1,2)),
    CONSTRAINT order_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id),
    CONSTRAINT order_store_id_fk FOREIGN KEY(store_id) REFERENCES store(store_id) ON DELETE SET NULL
);

-- 주문 상세
CREATE TABLE order_detail (
	order_detail_no	            NUMBER	        NOT NULL,
	order_detail_menu_name	    VARCHAR2(100)	NOT NULL,
	order_detail_menu_count 	NUMBER	        NOT NULL,
	order_detail_menu_price	    NUMBER	        NOT NULL,
	order_detail_option_name	VARCHAR2(100)	NULL,
	order_detail_option_text	VARCHAR2(100)	NULL,
	order_detail_option_price	NUMBER	        NULL,
	order_no	                VARCHAR2(100)	NOT NULL,
    
    CONSTRAINT order_detail_order_detail_no_pk PRIMARY KEY(order_detail_no),
    CONSTRAINT order_detail_order_no_fk FOREIGN KEY(order_no) REFERENCES order_history(order_no)
);

-- 결제
CREATE TABLE payment (
	payment_id	            VARCHAR2(100)	NOT NULL,
	payment_before_date	    DATE	        DEFAULT SYSDATE,
	payment_after_date	    DATE	        DEFAULT SYSDATE,
	payment_total_price	    NUMBER	        NOT NULL,
	payment_charget_point	NUMBER	        NOT NULL,
	payment_use_pickmoney	NUMBER	        DEFAULT 0,
	order_no	            VARCHAR2(100)	NOT NULL,
    
    CONSTRAINT payment_payment_id_pk PRIMARY KEY(payment_id),
    CONSTRAINT payment_order_no_fk FOREIGN KEY(order_no) REFERENCES order_history(order_no)
);

-- 리뷰
CREATE TABLE review (
	review_no	            NUMBER	        NOT NULL,
	review_content	        VARCHAR2(1000)	NOT NULL,
	review_rating	        NUMBER	        NOT NULL,
	review_regdate	        DATE	        DEFAULT SYSDATE,
	review_img	            VARCHAR2(500)	NULL,
	review_report_status	NUMBER	        DEFAULT 0,
	order_no	            VARCHAR2(100)	NOT NULL,
	store_id	            VARCHAR2(21)	NOT NULL,
	member_id	            VARCHAR2(15)	NOT NULL,
    
    CONSTRAINT review_review_no_pk PRIMARY KEY(review_no),
    CONSTRAINT review_order_no_fk FOREIGN KEY(order_no) REFERENCES order_history(order_no),
    CONSTRAINT review_store_id_fk FOREIGN KEY(store_id) REFERENCES store(store_id) ON DELETE SET NULL,
    CONSTRAINT review_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id)
);

-- 리뷰 답글
CREATE TABLE review_reply (
	review_reply_no	        NUMBER	        NOT NULL,
	review_reply_content	VARCHAR2(1000)	NOT NULL,
	review_reply_date	    DATE	        DEFAULT SYSDATE,
	review_no	            NUMBER	        NOT NULL,
    
    CONSTRAINT review_reply_review_reply_no_pk PRIMARY KEY(review_reply_no),
    CONSTRAINT review_reply_review_no_fk FOREIGN KEY(review_no) REFERENCES review(review_no) ON DELETE CASCADE
);
-- 리뷰 신고
CREATE TABLE review_report (
	review_report_no	    NUMBER	        NOT NULL,
	review_report_content	VARCHAR2(1000)	NOT NULL,
	review_report_regdate	DATE	        DEFAULT SYSDATE,
	review_no	            NUMBER	        NOT NULL,
    
    CONSTRAINT review_report_review_report_no_pk PRIMARY KEY(review_report_no),
    CONSTRAINT review_report_review_no_fk FOREIGN KEY(review_no) REFERENCES review(review_no) ON DELETE SET NULL
);

--------------------------------------------------------------------------------
-- 관리자 관련 테이블
--------------------------------------------------------------------------------
-- 관리자
CREATE TABLE admin (
    admin_no        NUMBER          NOT NULL,
	admin_id	    VARCHAR2(15)	NOT NULL,
	admin_pw	    VARCHAR2(20)	NOT NULL,
	admin_name	    VARCHAR2(60)	NOT NULL,
	admin_phone	    VARCHAR2(20)	NOT NULL,
	admin_email	    VARCHAR2(100)	NOT NULL,
	admin_regdate	DATE	        DEFAULT SYSDATE     NOT NULL,
	admin_authority	CHAR(1)	        DEFAULT 'A'         NOT NULL,
    
    CONSTRAINT admin_admin_no_pk PRIMARY KEY(admin_no),
    CONSTRAINT admin_admin_id_uk UNIQUE(admin_id),
    CONSTRAINT admin_admin_authority_ck CHECK(admin_authority IN('S','A'))
);

-- 관리자 고유키
CREATE TABLE admin_key (
	admin_key	    CHAR(12)	    NOT NULL,
        CONSTRAINT admin_key_admin_key_pk PRIMARY KEY(admin_key)
);

-- 공지사항 게시판
CREATE TABLE notice (
	notice_no	    NUMBER	        NOT NULL,
	notice_title	VARCHAR2(100)	NOT NULL,
	notice_content	CLOB	        NOT NULL,
	notice_readcnt	NUMBER	        DEFAULT 0,
	notice_regdate	DATE	        DEFAULT SYSDATE,
	notice_img	    VARCHAR2(500)	NULL,
    
    CONSTRAINT notice_notice_no_pk PRIMARY KEY(notice_no)
);

-- 이벤트 게시판
CREATE TABLE event (
	event_no	    NUMBER	        NOT NULL,
	event_title	    VARCHAR2(100)	NOT NULL,
	event_content	CLOB	        NOT NULL,
	event_readcnt	NUMBER	        DEFAULT 0,
	event_regdate	DATE	        DEFAULT SYSDATE,
	event_img	    VARCHAR2(500)	NULL,
    
    CONSTRAINT event_event_no_pk PRIMARY KEY(event_no)
);

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
    CONSTRAINT member_qna_member_qna_secret_ck CHECK(member_qna_secret IN('Y','N')),
    CONSTRAINT member_qna_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id)
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
    CONSTRAINT corp_qna_corp_qna_secret_ck CHECK(corp_qna_secret IN('Y','N')),
    CONSTRAINT corp_qna_corp_id_fk FOREIGN KEY(corp_id) REFERENCES corperation(corp_id)
);

-- 기업 회원 상담/문의 답글
CREATE TABLE corp_qna_reply (
	corp_qna_no	            NUMBER	NOT NULL,
	corp_qna_reply_content	CLOB	NOT NULL,
	corp_qna_reply_regdate	DATE	DEFAULT SYSDATE,
    
    CONSTRAINT corp_qna_reply_corp_qna_no_pk PRIMARY KEY(corp_qna_no),
    CONSTRAINT corp_qna_reply_corp_qna_no_fk FOREIGN KEY(corp_qna_no) REFERENCES corp_qna(corp_qna_no) ON DELETE CASCADE
);