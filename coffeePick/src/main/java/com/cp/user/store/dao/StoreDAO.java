package com.cp.user.store.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.store.vo.StoreVO;

@Mapper
public interface StoreDAO {
	public StoreVO storeInfoRead(StoreVO svo);
	public int storeInfoRegist(StoreVO svo);
	public int storeInfoUpdate(StoreVO svo);
}
