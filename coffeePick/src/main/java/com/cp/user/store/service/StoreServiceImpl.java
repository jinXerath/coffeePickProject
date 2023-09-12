package com.cp.user.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.store.dao.StoreDAO;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;

@Service
public class StoreServiceImpl implements StoreService {

	@Setter(onMethod_ = @Autowired)
	private StoreDAO storeDAO;

	@Override
	public StoreVO storeInfoRead(StoreVO svo) {
		StoreVO vo = storeDAO.storeInfoRead(svo);
		return vo;
	}
}