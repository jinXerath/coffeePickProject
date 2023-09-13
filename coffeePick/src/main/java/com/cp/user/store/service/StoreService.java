package com.cp.user.store.service;

import com.cp.user.store.vo.StoreVO;

public interface StoreService {
	public StoreVO storeInfoRead(StoreVO svo);
	public int storeInfoRegist(StoreVO svo) throws Exception;
	public int storeInfoUpdate(StoreVO svo) throws Exception;	
}
