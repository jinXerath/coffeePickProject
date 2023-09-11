package com.cp.user.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.user.store.vo.StoreVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/store/*")
@Slf4j
public class StoreController {

		
	
	@GetMapping("/storeInfo")
	public String storeInfo(StoreVO svo) {
		log.info("storeInfo 메소드 호출 성공");
		
		StoreVO svo = new StoreVO();
		ModelAttributede
		return "store/storeInfo";
	}
		


}
