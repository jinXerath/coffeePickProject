package com.cp.admin.qna.service;

import java.util.List;

import com.cp.admin.qna.vo.QnaVO;

public interface QnaService {
	// qna 리스트
	public List<QnaVO> memberQnaList(QnaVO qvo);
	

}
