package com.cp.user.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.user.store.service.StoreService;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/store/*")
@Slf4j
public class StoreController {
	
	@Setter(onMethod_ = @Autowired)
	private StoreService storeService;
	
	
	/***************************************************
	 * 매장 리스트 구현하기(페이징 처리부분과 검색 제외 목록 조회)
	 * 요청 URL: http://localhost:8080/store/storeList
	 * *************************************************/

	@GetMapping("/storeList")
	public String storeList(@ModelAttribute StoreVO svo,Model model) {
		log.info("storeList호출 성공");
		//전체 레코드 조회
		List<StoreVO> storeList = storeService.storeList(svo);
		model.addAttribute("storeList",storeList);
		
		return "memberService/order/storeList";  //WEB-INF/views/memberService/order/storeList
	}
	@GetMapping("/storeMenu")
	public String storeMenu() {
		log.info("storeMenu 호출 성공");
		
		return "memberService/order/storeMenu";
	}
	@GetMapping("/storeInfo")
	public String storeInfo() {
		log.info("storeInfo 호출 성공");
		
		return "memberService/order/storeInfo";
	}
	
}
