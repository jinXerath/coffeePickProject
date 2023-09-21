package com.cp.user.corp.service;

import java.util.List;

import com.cp.user.corp.vo.CorpVO;


public interface CorpService {
	public List<CorpVO> corpList(CorpVO cvo);
	public int corpStatus(CorpVO cvo);
//	public int corpCount();
	public int corpListCnt(CorpVO cvo);
}
