--------------------------------------------------------------------------------
/*
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 꼭 봐주세요 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 꼭 봐주세요 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 꼭 봐주세요 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


*/
--------------------------------------------------------------------------------
-- 사용자 연관 테이블
--------------------------------------------------------------------------------
-- 개인 회원
DROP TABLE member PURGE;
DROP SEQUENCE member_seq;

-- 포인트
DROP TABLE point PURGE;



-- 포인트 내역
DROP TABLE point_history PURGE;
DROP INDEX idx_point_history_point_history_date_desc;
DROP SEQUENCE point_history_seq;

-- 픽머니(캐시)
DROP TABLE pickmoney PURGE;

-- 픽머니(캐시) 내역
DROP TABLE pickmoney_history PURGE;
DROP INDEX idx_pickmoney_history_pickmoney_history_date_desc;
DROP SEQUENCE pickmoney_history_seq;

-- 기업 회원
DROP TABLE corperation PURGE;
DROP SEQUENCE corp_seq;

-- 매장
DROP TABLE store PURGE;
DROP INDEX store_store_regdate_nl;

-- 메뉴
DROP TABLE menu PURGE;
DROP SEQUENCE menu_seq;

-- 장바구니
DROP TABLE cart PURGE;

-- 장바구니 상세
DROP TABLE cart_detail PURGE;
DROP SEQUENCE cart_detail_seq;

-- 주문
DROP TABLE order_history PURGE;
DROP INDEX idx_order_history_order_regdate_desc;

-- 주문 상세
DROP TABLE order_detail PURGE;
DROP SEQUENCE order_detail_seq;

-- 리뷰
DROP TABLE review PURGE;
DROP SEQUENCE review_seq;

-- 리뷰 답글
DROP TABLE review_reply PURGE;

-- 리뷰 신고
DROP TABLE review_report PURGE;

--------------------------------------------------------------------------------
-- 관리자 관련 테이블
--------------------------------------------------------------------------------
-- 관리자
DROP TABLE admin PURGE;
DROP SEQUENCE admin_seq;

-- 관리자 고유키
DROP TABLE admin_key PURGE;

-- 공지사항 게시판
DROP TABLE notice PURGE;
DROP SEQUENCE notice_seq;

-- 이벤트 게시판
DROP TABLE event PURGE;
DROP SEQUENCE event_seq;

-- 개인 회원 상담/문의 게시판
DROP TABLE member_qna PURGE;
DROP SEQUENCE member_qna_seq;

-- 개인 회원 상담/문의 답글
DROP TABLE member_qna_reply PURGE;

-- 기업 회원 상담/문의 게시판
DROP TABLE corp_qna PURGE;
DROP SEQUENCE corp_qna_seq;
DROP VIEW corp_qna_view;

-- 기업 회원 상담/문의 답글
DROP TABLE corp_qna_reply PURGE;

