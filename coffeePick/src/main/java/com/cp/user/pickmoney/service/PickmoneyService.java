package com.cp.user.pickmoney.service;

import com.cp.user.pickmoney.vo.PickmoneyHistoryVO;
import com.cp.user.pickmoney.vo.PickmoneyVO;

public interface PickmoneyService {
	public PickmoneyVO pickmoneyInfo(PickmoneyVO pvo);

	public int pickmoneyUpdate(PickmoneyVO pvo);

	public int pickmoneyHistoryInsert(PickmoneyHistoryVO phvo);
}
