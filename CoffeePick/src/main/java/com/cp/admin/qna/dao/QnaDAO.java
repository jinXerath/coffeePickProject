package com.cp.admin.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.admin.qna.vo.QnaVO;

@Mapper
public interface QnaDAO {
	// qna 리스트
	public List<QnaVO> memberQnaList(QnaVO qvo);

	// qna의 수
	public int memberQnaListCnt(QnaVO qvo);

}
