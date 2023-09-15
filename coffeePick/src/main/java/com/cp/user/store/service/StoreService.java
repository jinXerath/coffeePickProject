package com.cp.user.store.service;

import java.util.List;

import com.cp.user.store.vo.StoreVO;

public interface StoreService {
	public StoreVO storeInfoRead(StoreVO svo);

	public int storeInfoRegist(StoreVO svo) throws Exception;

	public int storeInfoUpdate(StoreVO svo) throws Exception;

	public List<StoreVO> storeList(StoreVO svo);
	// public List<StoreVO> storeList(); //매장 리스트 조회
}