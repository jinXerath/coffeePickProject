-- 사용자 연관 테이블
--------------------------------------------------------------------------------
-- 개인 회원 
INSERT INTO member (member_no, member_id, member_pw, member_name, member_nickname, member_email, member_addr, member_phone, member_status, member_regdate, member_leavedate)
VALUES (member_seq.NEXTVAL, 'mem123', 'mem123', 'John Doe', 'johndoe', 'john@example.com', '123 Main St', '123-456-7890', 'Y', SYSDATE, NULL);

INSERT INTO member (member_no, member_id, member_pw, member_name, member_nickname, member_email, member_addr, member_phone, member_status, member_regdate, member_leavedate)
VALUES (member_seq.NEXTVAL, 'mem234', 'mem234', 'Jane Smith', 'janesmith', 'jane@example.com', '456 Elm St', '987-654-3210', 'Y', SYSDATE, NULL);

-- 포인트 
INSERT INTO point (member_id, point_total)
VALUES ('mem123', default);

INSERT INTO point (member_id, point_total)
VALUES ('mem234', default);

-- 포인트 내역 

-- 픽머니(캐시)
INSERT INTO pickmoney (member_id, pickmoney_total)
VALUES ('mem123', default);

INSERT INTO pickmoney (member_id, pickmoney_total)
VALUES ('mem234', default);

-- 픽머니(캐시) 내역 

-- 기업 회원
INSERT INTO corperation (corp_no, corp_id, corp_pw, corp_name, corp_email, corp_addr, corp_phone, corp_registration_number, corp_status, corp_regdate, corp_leavedate)
VALUES (corp_seq.NEXTVAL, 'corp1', 'corp1', 'ABC Corporation', 'abc@example.com', '123 Corporate St', '123-456-7890', '12345-ABC', 'Y', SYSDATE, NULL);

INSERT INTO corperation (corp_no, corp_id, corp_pw, corp_name, corp_email, corp_addr, corp_phone, corp_registration_number, corp_status, corp_regdate, corp_leavedate)
VALUES (corp_seq.NEXTVAL, 'corp2', 'corp2', 'XYZ Corporation', 'xyz@example.com', '456 Business Blvd', '987-654-3210', '67890-XYZ', 'Y', SYSDATE, NULL);

-- 매장
INSERT INTO store (store_id, store_name, store_addr, store_phone, store_content, store_content_detail, store_operate_hour, store_operate_status, store_regdate, store_img, corp_id)
VALUES ('corp1_store', 'Store One', '123 Main St', '123-456-7890', 'This is store one.', 'Details about store one.', '9:00 AM - 5:00 PM', 'Y', SYSDATE, 'store1.jpg', 'corp1');

INSERT INTO store (store_id, store_name, store_addr, store_phone, store_content, store_content_detail, store_operate_hour, store_operate_status, store_regdate, store_img, corp_id)
VALUES ('corp2_store', 'Store Two', '456 Elm St', '987-654-3210', 'This is store two.', 'Details about store two.', '10:00 AM - 6:00 PM', 'Y', SYSDATE, 'store2.jpg', 'corp2');

-- 메뉴
INSERT INTO menu (menu_no, menu_name, menu_price, menu_content, menu_category, menu_img, menu_regdate, store_id)
VALUES (menu_seq.NEXTVAL, 'Espresso', 3.99, 'A shot of espresso.', 'coffee', 'espresso.jpg', SYSDATE, 'corp1_store');

INSERT INTO menu (menu_no, menu_name, menu_price, menu_content, menu_category, menu_img, menu_regdate, store_id)
VALUES (menu_seq.NEXTVAL, 'Cappuccino', 4.99, 'Espresso with steamed milk and foam.', 'coffee', 'cappuccino.jpg', SYSDATE, 'corp2_store');


-- 장바구니
INSERT INTO cart (cart_id, member_id)
VALUES ('mem123_cart', 'mem123');

INSERT INTO cart (cart_id, member_id)
VALUES ('mem234_cart', 'mem234');

-- 장바구니 상세
INSERT INTO cart_detail (cart_detail_no, menu_quantity, menu_no, cart_id)
VALUES (cart_detail_seq.NEXTVAL, 2, 1, 'mem123_cart');

INSERT INTO cart_detail (cart_detail_no, menu_quantity, menu_no, cart_id)
VALUES (cart_detail_seq.NEXTVAL, 3, 2, 'mem123_cart');

-- 주문
INSERT INTO order_history (order_no, order_basic_price, order_use_point, order_total_price, order_request, order_status, order_method, order_store_name, order_store_phone, order_store_addr, member_id, store_id, order_charge_point, oreder_use_pickmoney)
VALUES ('order1', 25.99, 5, 20.99, 'No sugar', 1, 1, 'Coffee Shop 1', '123-456-7890', '123 Main St', 'mem123', 'corp1_store', 0, 0);

INSERT INTO order_history (order_no, order_basic_price, order_use_point, order_total_price, order_request, order_status, order_method, order_store_name, order_store_phone, order_store_addr, member_id, store_id, order_charge_point, oreder_use_pickmoney)
VALUES ('order2', 18.99, 0, 18.99, 'Extra cream', 2, 1, 'Coffee Shop 2', '987-654-3210', '456 Elm St', 'mem123', 'corp2_store', 0, 0);

-- 주문 상세
INSERT INTO order_detail (order_detail_no, order_detail_menu_name, order_detail_menu_count, order_detail_menu_price, order_no)
VALUES (order_detail_seq.NEXTVAL, 'Espresso', 2, 7.98, 'order1');

INSERT INTO order_detail (order_detail_no, order_detail_menu_name, order_detail_menu_count, order_detail_menu_price, order_no)
VALUES (order_detail_seq.NEXTVAL, 'Cappuccino', 3, 14.97, 'order2');

-- 리뷰


-- 리뷰 답글

-- 리뷰 신고


--------------------------------------------------------------------------------
-- 관리자 관련 테이블
--------------------------------------------------------------------------------
-- 관리자
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email, admin_regdate, admin_authority)
VALUES (admin_seq.NEXTVAL, 'qwer', 'qwer', 'Super Admin', '123-456-7890', 'admin1@example.com', SYSDATE, 'S');

INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name, admin_phone, admin_email, admin_regdate, admin_authority)
VALUES (admin_seq.NEXTVAL, 'admin1', 'admin2', 'Admin Two', '987-654-3210', 'admin2@example.com', SYSDATE, 'A');

-- 관리자 고유키(무슨일이 있어도 한개만 존재해야 됨)
INSERT INTO admin_key (admin_key)
VALUES ('111111111111');

-- 공지사항 게시판
INSERT INTO notice (notice_no, notice_title, notice_content, notice_readcnt, notice_regdate, notice_img, admin_id)
VALUES (notice_seq.NEXTVAL, 'Important Notice 1', 'This is an important notice.', 0, SYSDATE, 'NULL', 'qwer');

INSERT INTO notice (notice_no, notice_title, notice_content, notice_readcnt, notice_regdate, notice_img, admin_id)
VALUES (notice_seq.NEXTVAL, 'Notice 2', 'This is another notice.', 0, SYSDATE, NULL, 'admin1');

-- 이벤트 게시판

INSERT INTO event (event_no, event_title, event_content, event_readcnt, event_regdate, event_img, admin_id)
VALUES (event_seq.NEXTVAL, 'Summer Sale Event', 'Dont miss our summer sale event', 0, SYSDATE, NULL, 'admin1');

-- 개인 회원 상담/문의 게시판

INSERT INTO member_qna (member_qna_no, member_qna_title, member_qna_content, member_qna_secret, member_qna_img, member_qna_regdate, member_qna_reply_status, member_id)
VALUES (member_qna_seq.NEXTVAL, 'Question 1', 'I have a question about your service.', 'N', NULL, SYSDATE, 'N', 'mem123');

INSERT INTO member_qna (member_qna_no, member_qna_title, member_qna_content, member_qna_secret, member_qna_img, member_qna_regdate, member_qna_reply_status, member_id)
VALUES (member_qna_seq.NEXTVAL, 'Feedback', 'I would like to provide some feedback.', 'Y', 'qna1.jpg', SYSDATE, 'N', 'mem234');

-- 개인 회원 상담/문의 답글


-- 기업 회원 상담/문의 게시판
INSERT INTO corp_qna (corp_qna_no, corp_qna_title, corp_qna_content, corp_qna_secret, corp_qna_img, corp_qna_regdate, corp_qna_reply_status, corp_id)
VALUES (corp_qna_seq.NEXTVAL, 'Question 1', 'I have a question about your products.', 'N', NULL, SYSDATE, 'N', 'corp1');

INSERT INTO corp_qna (corp_qna_no, corp_qna_title, corp_qna_content, corp_qna_secret, corp_qna_img, corp_qna_regdate, corp_qna_reply_status, corp_id)
VALUES (corp_qna_seq.NEXTVAL, 'Feedback', 'I would like to provide some feedback.', 'Y', 'qna1.jpg', SYSDATE, 'N', 'corp2');


-- 기업 회원 상담/문의 답글