package com.cp.user.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.point.dao.PointDAO;
import com.cp.user.point.vo.PointHistoryVO;
import com.cp.user.point.vo.PointVO;

import lombok.Setter;

@Service
public class PointServiceImpl implements PointService {

	@Setter(onMethod_ = @Autowired)
	private PointDAO pointDAO;

	@Override
	public PointVO pointInfo(PointVO pvo) {

		return pointDAO.pointInfo(pvo);
	}

	@Override
	public int updatePoint(PointVO pvo) {
		int result = 0;
		result = pointDAO.updatePoint(pvo);
		return result;
	}

	@Override
	public int pointHistoryInsert(PointHistoryVO phvo) {
		int result = 0;
		result = pointDAO.pointHistoryInsert(phvo);
		return result;
	}

	@Override
	public List<PointHistoryVO> pointHistoryInfo(PointHistoryVO phvo) {
		return pointDAO.pointHistoryInfo(phvo);
	}

}
