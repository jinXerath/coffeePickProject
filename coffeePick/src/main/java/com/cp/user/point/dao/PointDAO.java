package com.cp.user.point.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.point.vo.PointHistoryVO;
import com.cp.user.point.vo.PointVO;

@Mapper
public interface PointDAO {
	public PointVO pointInfo(PointVO pvo);

	public int updatePoint(PointVO pvo);

	public int pointHistoryInsert(PointHistoryVO phvo);

	public List<PointHistoryVO> pointHistoryList(PointHistoryVO phvo);

	public int pointListCnt(PointHistoryVO phvo);

}
