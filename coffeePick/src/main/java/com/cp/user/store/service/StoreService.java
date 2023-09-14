package com.cp.user.store.service;

import java.util.List;

import com.cp.user.store.vo.StoreVO;

public interface StoreService {
	//public List<StoreVO> storeList(); //매장 리스트 조회

	public List<StoreVO> storeList(StoreVO svo);
}
