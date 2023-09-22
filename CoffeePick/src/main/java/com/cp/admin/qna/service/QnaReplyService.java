package com.cp.admin.qna.service;

import com.cp.admin.qna.vo.QnaReplyVO;

public interface QnaReplyService {
	public QnaReplyVO memberQnaReplyDetail(QnaReplyVO qrvo);
	public int memberQnaReplyInsert(QnaReplyVO qrvo) throws Exception;
	public int memberQnaReplyUpdate(QnaReplyVO qrvo, String qna_reply_img_delete) throws Exception;
	public int memberQnaReplyDelete(QnaReplyVO qrvo) throws Exception;
	
	
	public QnaReplyVO corpQnaReplyDetail(QnaReplyVO qrvo);
	public int corpQnaReplyInsert(QnaReplyVO qrvo) throws Exception;
	public int corpQnaReplyUpdate(QnaReplyVO qrvo, String qna_reply_img_delete) throws Exception;
	public int corpQnaReplyDelete(QnaReplyVO qrvo) throws Exception;
}
