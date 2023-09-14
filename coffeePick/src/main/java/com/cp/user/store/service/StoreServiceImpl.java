package com.cp.user.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.common.file.FileUploadUtil;
import com.cp.user.store.dao.StoreDAO;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StoreServiceImpl implements StoreService {
	
	@Setter(onMethod_= @Autowired)
	private StoreDAO storeDAO;
	
	
	// 매장 정보 조회 메소드
	@Override
	public StoreVO storeInfoRead(StoreVO svo) {
		StoreVO vo = null;
		vo = storeDAO.storeInfoRead(svo);
		return vo;
	}
	
	// 매장 정보 등록 메소드
	@Override
	public int storeInfoRegist(StoreVO svo) throws Exception {
		log.info("service임플ㄷ");
		int result = 0;
		if(svo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(svo.getFile(), "store"); // board_1658205347977_cat.jpg
			svo.setStore_img(fileName);
		}
		log.info("service임플2");
		result = storeDAO.storeInfoRegist(svo);
		log.info("service임플" + result);
		return result;
	}
	
	// 매장 정보 수정 메소드
	@Override
	public int storeInfoUpdate(StoreVO svo) throws Exception {
		int result = 0;
		if(!svo.getFile().isEmpty()) {
			if(!svo.getStore_img().isEmpty()) {
				FileUploadUtil.fileDelete(svo.getStore_img());
			}
			String fileName = FileUploadUtil.fileUpload(svo.getFile(), "store");
			svo.setStore_img(fileName);
		}		
		result = storeDAO.storeInfoUpdate(svo);
		
		return result;
	}
}
