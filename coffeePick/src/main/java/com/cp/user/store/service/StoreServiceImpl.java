package com.cp.user.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.common.file.FileUploadUtil;
import com.cp.user.store.dao.StoreDAO;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StoreServiceImpl implements StoreService {

	@Setter(onMethod_ = @Autowired)
	private StoreDAO storeDAO;

	@Override
	public StoreVO storeInfoRead(StoreVO svo) {
		StoreVO vo = null;
		vo = storeDAO.storeInfoRead(svo);
		return vo;
	}

	// 매장 수정폼에서 매장정보를 보여주게할 조회 메소드
	public StoreVO storeUpdateForm(StoreVO svo) {
		StoreVO updateData = null;
		updateData = storeDAO.corpStoreDetail(svo);
		return updateData;
	}

	// 매장 정보 등록 메소드
	@Override
	public int storeInfoRegist(StoreVO svo) throws Exception {
		log.info("service임플ㄷ");
		int result = 0;
		if (svo.getFile().getSize() > 0) {
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
		if (!svo.getFile().isEmpty()) {
			if (!svo.getStore_img().isEmpty()) {
				FileUploadUtil.fileDelete(svo.getStore_img());
			}
			String fileName = FileUploadUtil.fileUpload(svo.getFile(), "store");
			svo.setStore_img(fileName);
		}
		result = storeDAO.storeInfoUpdate(svo);

		return result;
	}

	// 매장 정보 삭제 메소드
	@Override
	public int storeInfoDelete(StoreVO svo) throws Exception {
		int result = 0;
		if (!svo.getStore_img().isEmpty()) { // b_file 필드의 값이 null 이거나 "" 아니면 (이미지 파일이 존재하면)
			FileUploadUtil.fileDelete(svo.getStore_img());
		}
		result = storeDAO.storeInfoDelete(svo);
		return result;
	}

	@Override
	public List<StoreVO> storeList(StoreVO svo) {
		List<StoreVO> list = null;
		list = storeDAO.storeList(svo);
		return list;
	}

	@Override
	public int storeListCnt(StoreVO svo) {
		int result = 0;

		result = storeDAO.storeListCnt(svo);

		return result;
	}

	@Override
	public StoreVO storeDetail(String store_id) {

		return storeDAO.storeDetail(store_id);
	}

}
