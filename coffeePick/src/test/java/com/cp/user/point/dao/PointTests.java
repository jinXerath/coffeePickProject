package com.cp.user.point.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.point.vo.PointHistoryVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class PointTests {
	@Setter(onMethod_ = @Autowired)
	private PointDAO pointDAO;

	/*
	 * @Test public void pointHistoryInsertTest() { PointHistoryVO phvo = new
	 * PointHistoryVO(); phvo.setMember_id("user1");
	 * phvo.setPoint_history_amount(3000); phvo.setPoint_history_reason("I");
	 * 
	 * int pointInfo = pointDAO.pointHistoryInsert(phvo);
	 * 
	 * log.info(toString().valueOf(pointInfo)); }
	 */
	/*
	 * @Test public void pointInfoTest() { PointVO pvo = new PointVO();
	 * pvo.setMember_id("user1");
	 * 
	 * PointVO pointInfo = pointDAO.pointInfo(pvo);
	 * 
	 * log.info(toString().valueOf(pointInfo)); }
	 */
	@Test
	public void pointHistoryInfoTest() {
		PointHistoryVO phvo = new PointHistoryVO();
		phvo.setMember_id("user1");

		List<PointHistoryVO> pointHistoryInfo = pointDAO.pointHistoryList(phvo);

		for (PointHistoryVO vo : pointHistoryInfo) {
			log.info(vo.toString());
		}
	}

}
