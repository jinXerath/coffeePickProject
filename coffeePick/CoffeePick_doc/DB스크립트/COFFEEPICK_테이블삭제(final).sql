--------------------------------------------------------------------------------
/*
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! �� ���ּ��� !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! �� ���ּ��� !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! �� ���ּ��� !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


*/
--------------------------------------------------------------------------------
-- ����� ���� ���̺�
--------------------------------------------------------------------------------
-- ���� ȸ��
DROP TABLE member PURGE;
DROP SEQUENCE member_seq;

-- ����Ʈ
DROP TABLE point PURGE;



-- ����Ʈ ����
DROP TABLE point_history PURGE;
DROP INDEX idx_point_history_point_history_date_desc;
DROP SEQUENCE point_history_seq;

-- �ȸӴ�(ĳ��)
DROP TABLE pickmoney PURGE;

-- �ȸӴ�(ĳ��) ����
DROP TABLE pickmoney_history PURGE;
DROP INDEX idx_pickmoney_history_pickmoney_history_date_desc;
DROP SEQUENCE pickmoney_history_seq;

-- ��� ȸ��
DROP TABLE corperation PURGE;
DROP SEQUENCE corp_seq;

-- ����
DROP TABLE store PURGE;
DROP INDEX store_store_regdate_nl;

-- �޴�
DROP TABLE menu PURGE;
DROP SEQUENCE menu_seq;

-- ��ٱ���
DROP TABLE cart PURGE;

-- ��ٱ��� ��
DROP TABLE cart_detail PURGE;
DROP SEQUENCE cart_detail_seq;

-- �ֹ�
DROP TABLE order_history PURGE;
DROP INDEX idx_order_history_order_regdate_desc;

-- �ֹ� ��
DROP TABLE order_detail PURGE;
DROP SEQUENCE order_detail_seq;

-- ����
DROP TABLE review PURGE;
DROP SEQUENCE review_seq;

-- ���� ���
DROP TABLE review_reply PURGE;

-- ���� �Ű�
DROP TABLE review_report PURGE;

--------------------------------------------------------------------------------
-- ������ ���� ���̺�
--------------------------------------------------------------------------------
-- ������
DROP TABLE admin PURGE;
DROP SEQUENCE admin_seq;

-- ������ ����Ű
DROP TABLE admin_key PURGE;

-- �������� �Խ���
DROP TABLE notice PURGE;
DROP SEQUENCE notice_seq;

-- �̺�Ʈ �Խ���
DROP TABLE event PURGE;
DROP SEQUENCE event_seq;

-- ���� ȸ�� ���/���� �Խ���
DROP TABLE member_qna PURGE;
DROP SEQUENCE member_qna_seq;

-- ���� ȸ�� ���/���� ���
DROP TABLE member_qna_reply PURGE;

-- ��� ȸ�� ���/���� �Խ���
DROP TABLE corp_qna PURGE;
DROP SEQUENCE corp_qna_seq;
DROP VIEW corp_qna_view;

-- ��� ȸ�� ���/���� ���
DROP TABLE corp_qna_reply PURGE;

