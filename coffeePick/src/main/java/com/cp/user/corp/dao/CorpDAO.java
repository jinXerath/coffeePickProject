package com.cp.user.corp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.corp.vo.CorpVO;


@Mapper
public interface CorpDAO {
	public List<CorpVO> corpList(CorpVO cvo);
	public int corpStatus(CorpVO cvo);
//	public int corpCount();
	public int corpListCnt(CorpVO cvo);
}
