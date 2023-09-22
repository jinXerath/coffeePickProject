package com.cp.user.pickmoney.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.pickmoney.vo.PickmoneyHistoryVO;
import com.cp.user.pickmoney.vo.PickmoneyVO;

@Mapper
public interface PickmoneyDAO {
	public PickmoneyVO pickmoneyInfo(PickmoneyVO pvo);

	public int pickmoneyUpdate(PickmoneyVO pvo);

	public int pickmoneyHistoryInsert(PickmoneyHistoryVO phvo);
}
