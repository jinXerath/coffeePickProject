package com.cp.user.pickmoney.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.pickmoney.dao.PickmoneyDAO;
import com.cp.user.pickmoney.vo.PickmoneyHistoryVO;
import com.cp.user.pickmoney.vo.PickmoneyVO;

import lombok.Setter;

@Service
public class PickmoneyServiceImpl implements PickmoneyService {

	@Setter(onMethod_ = @Autowired)
	private PickmoneyDAO pickmoneyDAO;

	public PickmoneyVO pickmoneyInfo(PickmoneyVO pvo) {

		return pickmoneyDAO.pickmoneyInfo(pvo);
	}

	@Override
	public int pickmoneyUpdate(PickmoneyVO pvo) {
		int result = 0;
		result = pickmoneyDAO.pickmoneyUpdate(pvo);
		return result;
	}

	@Override
	public int pickmoneyHistoryInsert(PickmoneyHistoryVO phvo) {
		int result = 0;
		result = pickmoneyDAO.pickmoneyHistoryInsert(phvo);
		return result;
	}

}
