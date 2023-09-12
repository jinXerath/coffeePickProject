package com.cp.user.store.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class StoreTests {
	@Setter(onMethod_ = @Autowired)
	private StoreDAO storeDAO;

	@Test
	public void storeListTest() {
		StoreVO svo = new StoreVO();
		svo.setStore_id("store1");

		StoreVO list = storeDAO.storeInfoRead(svo);

		log.info(list.toString());

	}
}