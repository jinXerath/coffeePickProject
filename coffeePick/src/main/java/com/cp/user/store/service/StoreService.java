package com.cp.user.store.service;

import java.util.List;

import com.cp.user.store.vo.StoreVO;

public interface StoreService {
	// 매장 정보 조회
	public StoreVO storeInfoRead(StoreVO svo);
	
	
	public int storeInfoRegist(StoreVO svo) throws Exception;
	
	
	public StoreVO storeUpdateForm(StoreVO svo);
	
	
	public int storeInfoUpdate(StoreVO svo) throws Exception;

	public int storeInfoDelete(StoreVO svo) throws Exception;
	public List<StoreVO> storeList(StoreVO svo);
	// public List<StoreVO> storeList(); //매장 리스트 조회
}