package com.cp.user.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.store.vo.StoreVO;

@Mapper
public interface StoreDAO {
	
    public List<StoreVO> storeList(StoreVO svo); // 매장 검색

	//public List<StoreVO> storeList(); //매장 검색

	
}
