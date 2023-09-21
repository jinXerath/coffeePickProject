package com.cp.user.corp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.corp.dao.CorpDAO;
import com.cp.user.corp.vo.CorpVO;

import lombok.Setter;

@Service
public class CorpServiceImpl implements CorpService{
	@Setter(onMethod_=@Autowired)
	private CorpDAO corpdao;
	
	@Override
	public List<CorpVO> corpList(CorpVO cvo){
		List<CorpVO> list = corpdao.corpList(cvo);
		
		return list;
	}
	
	@Override
	public int corpStatus(CorpVO cvo) {
		int result = 0;
		result = corpdao.corpStatus(cvo);
		return result;
	}
	/*
	@Override
	public int corpCount() {
		int result = corpdao.corpCount();
		return result;
	}*/
	
	@Override
	public int corpListCnt(CorpVO cvo) {
		return corpdao.corpListCnt(cvo);
	}
}
