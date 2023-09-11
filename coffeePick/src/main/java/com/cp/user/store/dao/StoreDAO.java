package com.cp.user.store.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.store.vo.StoreVO;

@Mapper
public interface StoreDAO {
	
	//매장 정보 조회 메소드
	public StoreVO storeInfo(StoreVO svo);
}
