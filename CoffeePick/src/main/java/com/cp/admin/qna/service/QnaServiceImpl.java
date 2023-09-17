package com.cp.admin.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.admin.qna.dao.QnaDAO;
import com.cp.admin.qna.vo.QnaVO;

import lombok.Setter;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Setter(onMethod_= @Autowired)
	private QnaDAO qnaDAO;

	@Override
	public List<QnaVO> memberQnaList(QnaVO qvo) {
		List<QnaVO> memberQnaList = qnaDAO.memberQnaList(qvo);
		return memberQnaList;
	}


}
