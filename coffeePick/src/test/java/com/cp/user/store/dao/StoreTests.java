package com.cp.user.store.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
/*
@Slf4j
@SpringBootTest
public class StoreTests {

	@Setter(onMethod_ = @Autowired)
	private StoreDAO storeDAO;

	@Test
	public void storeInfo() {
		StoreVO svo = new StoreVO();
		
		svo.setCorp_id("corp1");
		
		StoreVO vo = storeDAO.storeInfoRead(svo);
		log.info(vo.toString());
	}
	/*
	 * @Test public void storeInfoRegist() { StoreVO svo = new StoreVO();
	 * 
	 * svo.setCorp_id("corp1"); svo.setStore_name("1"); svo.setStore_content("1");
	 * svo.setStore_content_detail("11"); svo.setStore_id("1");
	 * svo.setStore_addr("서울시 중랑구"); svo.setStore_operate_hour("오전 11시 ~ 오후 12시");
	 * svo.setStore_phone("1111"); svo.setStore_img("11");
	 * 
	 * int result = storeDAO.storeInfoRegist(svo); log.info("입력된 행의 수 : " + result);
	 * 
	 * 
	 * }
	 */

//	@Test
//	public void storeUpdate(StoreVO svo) throws Exception {
//		StoreVO vo = new StoreVO();
//		String fileName = FileUploadUtil.fileUpload(svo.getFile(), "store");
//		vo.setCorp_id("corp1");
//		vo.setStore_id("corp1_store_1");
//		vo.setStore_name("수정커피");
//		vo.setStore_img(fileName);
//		vo.setStore_operate_hour("영업안함");
//		vo.setStore_content("응애");
//		vo.setStore_content_detail("하기시렁");
//		vo.setStore_addr("경기도 수원시");
//
//		int r = storeDAO.storeInfoUpdate(vo);
//		log.info("업데이트된 행의 수 : " + r);
//	}
	/*
	 * //전체 매장 리스트 조회
	 * 
	 * @Test public void storeListTest() {
	 * 
	 * log.info("storeList() 메서드 호출"); List<StoreVO> list =
	 * storeDAO.storeList(null); for(StoreVO vo : list) { log.info(vo.toString()); }
	 * }

}*/