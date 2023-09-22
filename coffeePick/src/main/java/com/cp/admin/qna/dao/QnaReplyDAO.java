package com.cp.admin.qna.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cp.admin.qna.vo.QnaReplyVO;

@Mapper
public interface QnaReplyDAO {
	public QnaReplyVO memberQnaReplyDetail(QnaReplyVO qrvo);
	public int memberQnaReplyInsert(QnaReplyVO qrvo);
	public int memberQnaReplyUpdate(QnaReplyVO qrvo);
	public int memberQnaReplyDelete(QnaReplyVO qrvo);
	
	
	public QnaReplyVO corpQnaReplyDetail(QnaReplyVO qrvo);
	public int corpQnaReplyInsert(QnaReplyVO qrvo);
	public int corpQnaReplyUpdate(QnaReplyVO qrvo);
	public int corpQnaReplyDelete(QnaReplyVO qrvo);
}
