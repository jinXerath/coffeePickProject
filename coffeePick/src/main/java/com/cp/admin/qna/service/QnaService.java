package com.cp.admin.qna.service;

import java.util.List;

import com.cp.admin.qna.vo.QnaVO;

public interface QnaService {
	// qna 리스트
	public List<QnaVO> memberQnaList(QnaVO qvo);
	
	// qna의 수
	public int memberQnaCnt(QnaVO qvo);
	
	public QnaVO memberQnaDetail(QnaVO qvo);
	
	public int memberQnaInsert(QnaVO qvo) throws Exception;
	
	public QnaVO memberQnaUpdateForm(QnaVO qvo);
	public int memberQnaUpdate(QnaVO qvo, String qna_img_delete) throws Exception;
	public int memberQnaDelete(QnaVO qvo) throws Exception;
	
	
	// 기업 회원
	public List<QnaVO> corpQnaList(QnaVO qvo);
	
	// qna의 수
	public int corpQnaCnt(QnaVO qvo);
	
	public QnaVO corpQnaDetail(QnaVO qvo);
	
	public int corpQnaInsert(QnaVO qvo) throws Exception;
	
	public QnaVO corpQnaUpdateForm(QnaVO qvo);
	public int corpQnaUpdate(QnaVO qvo, String qna_img_delete) throws Exception;
	public int corpQnaDelete(QnaVO qvo) throws Exception;
	
	
	
	// 관리자
}
