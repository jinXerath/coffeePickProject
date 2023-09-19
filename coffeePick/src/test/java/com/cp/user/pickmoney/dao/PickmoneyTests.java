package com.cp.user.pickmoney.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.pickmoney.vo.PickmoneyHistoryVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class PickmoneyTests {
	@Setter(onMethod_ = @Autowired)
	private PickmoneyDAO pickmoneyDAO;
	/*
	 * @Test public void pickmoneyInfoTest() { PickmoneyVO pvo = new PickmoneyVO();
	 * pvo.setMember_id("user1");
	 * 
	 * PickmoneyVO pointInfo = pickmoneyDAO.pickmoneyInfo(pvo);
	 * 
	 * log.info(toString().valueOf(pointInfo)); }
	 */

	@Test
	public void pickmoneyHistoryInsertTest() {
		PickmoneyHistoryVO phvo = new PickmoneyHistoryVO();
		phvo.setMember_id("user1");
		phvo.setPickmoney_history_amount(3000);
		phvo.setPickmoney_history_reason("I");

		int pointInfo = pickmoneyDAO.pickmoneyHistoryInsert(phvo);

		log.info(toString().valueOf(pointInfo));
	}

}
