package com.cp.user.point.service;

import java.util.List;

import com.cp.user.point.vo.PointHistoryVO;
import com.cp.user.point.vo.PointVO;

public interface PointService {
	public PointVO pointInfo(PointVO pvo);

	public int updatePoint(PointVO pvo);

	public int pointHistoryInsert(PointHistoryVO phvo);

	public List<PointHistoryVO> pointHistoryList(PointHistoryVO phvo);

	public int pointListCnt(PointHistoryVO phvo);

}
