package com.cp.user.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.store.vo.StoreVO;

@Mapper
public interface StoreDAO {

	// 매장 정보 조회 메소드
	public StoreVO storeInfoRead(StoreVO svo);

	// 수정폼에서 매장정보 띄워줄 메소드
	public StoreVO corpStoreDetail(StoreVO svo);

	// 매장 정보 등록 메소드
	public int storeInfoRegist(StoreVO svo);

	// 매장 정보 수정 메소드
	public int storeInfoUpdate(StoreVO svo);

	// 매장 정보 삭제 메소드
	public int storeInfoDelete(StoreVO svo);

	public List<StoreVO> storeList(StoreVO svo); // 매장 검색

	public int storeListCnt(StoreVO svo);

	public StoreVO storeDetail(String store_id); // storeDetailMenu 구현

}
