package com.cp.user.store.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@SpringBootTest
public class storeTests {

	
	@Setter(onMethod_ = @Autowired)
	private StoreDAO storeDAO;
	
	@Test
	public void storeInfo() {
		StoreVO svo = new StoreVO();
		log.info("-----------------------------");
		log.info("corpInfo() 메서드 호출");
		svo.setCorp_id("corp1");
		StoreVO vo = storeDAO.storeInfo(svo);
		log.info(vo.toString());
	}
}
