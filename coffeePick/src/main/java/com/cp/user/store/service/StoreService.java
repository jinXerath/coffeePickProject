package com.cp.user.store.service;

import java.util.List;

import com.cp.user.store.vo.StoreVO;

public interface StoreService {
	// 매장 정보 조회
	public StoreVO storeInfoRead(StoreVO svo);
	
	
	public int storeInfoRegist(StoreVO svo) throws Exception;

	public StoreVO storeUpdateForm(StoreVO svo) throws Exception;

	public int storeInfoUpdate(StoreVO svo) throws Exception;

	public int storeInfoDelete(StoreVO svo) throws Exception;

	public List<StoreVO> storeList(StoreVO svo);

	public int storeListCnt(StoreVO svo);

	public StoreVO storeDetail(String store_id);
	
	public int storeStatusY(StoreVO svo); // 영업하기 버튼 클릭시 Y로 업덷이트
	
	public int storeStatusN(StoreVO svo); // 영업종료 버튼 클릭시 N으로 업데이트

}
