package com.cp.user.store.dao;

import java.util.List;

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
	
	
	//전체 매장 리스트 조회
	@Test
	public void storeListTest() {
	
		log.info("storeList() 메서드 호출");
		List<StoreVO> list = storeDAO.storeList(null);
		for(StoreVO vo : list) {
			log.info(vo.toString());	
		}
	}
}
