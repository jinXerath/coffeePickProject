package com.cp.admin.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.admin.qna.vo.QnaVO;

@Mapper
public interface QnaDAO {
	// qna 리스트
	public List<QnaVO> memberQnaList(QnaVO qvo);
	// qna의 수
	public int memberQnaCnt(QnaVO qvo);
	
	public QnaVO memberQnaDetail(QnaVO qvo);
	
	public int memberQnaInsert(QnaVO qvo);
	public int memberQnaUpdate(QnaVO qvo);
	public int memberQnaDelete(QnaVO qvo);
	
	public int memberQnaReplyStatusUpdate(QnaVO qvo);
	
	
	public List<QnaVO> corpQnaList(QnaVO qvo);
	// qna의 수
	public int corpQnaCnt(QnaVO qvo);
	
	public QnaVO corpQnaDetail(QnaVO qvo);
	
	public int corpQnaInsert(QnaVO qvo);
	public int corpQnaUpdate(QnaVO qvo);
	public int corpQnaDelete(QnaVO qvo);
	
	public int corpQnaReplyStatusUpdate(QnaVO qvo);
}
