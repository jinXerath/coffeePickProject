package com.cp.user.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.user.store.service.StoreService;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/store/*")
@Slf4j

public class StoreController {
	
	@Setter(onMethod_= @Autowired)
	private StoreService storeService;
	
	
	@GetMapping(value = "/storeInfoRead") // 세션에서 현재 로그인한 기업회원의 corp_id를 가져옵니다.
	public String storeInfoRead(Model model, HttpSession session) { // if(corp_id== null) { // ModelAttribute("msg", "매장정보가 없습니다. 매장을 등록해 주세요."); //
		log.info("StoreInfoRead 메소드 호출 성공"); // String corp_id = "corp1"; // 임시로
     
		
		StoreVO storeVO = new StoreVO(); 
		storeVO.setCorp_id("corp3");
		storeVO = storeService.storeInfoRead(storeVO);
		model.addAttribute("storeVO", storeVO);
     
		return "corpService/store/storeInfoRead"; 
	}
	
	
	@GetMapping(value="/registForm")
	public String registForm() {
		log.info("registForm 호출 성공");
		
		return "corpService/store/storeInfoRegistForm";
	}
	
	@PostMapping("/storeInfoRegist")
	public String storeInfoRegist(StoreVO svo, Model model) throws Exception{
		log.info("infoRegist 성공");
		
		int result = 0;
		String url = "";
		
		result = storeService.storeInfoRegist(svo);
		
		if(result == 1) {
			url = "corpService/store/storeInfoRead";
		} else {
			url = "corpService/store/storeInfoRegistForm";
		}
		return url;
		
	}	
	
	@GetMapping(value="/updateForm")
	public String updateForm() {
		log.info("updateForm 호출 성공");
		
		return "corpService/store/storeInfoUpdateForm";
	}	
	    
	
	@PostMapping(value="/storeInfoUpdate")
	public String storeInfoUpdate(StoreVO svo, Model model) throws Exception {
		log.info("updateForm 수정 성공");
		StoreVO storeVO = new StoreVO();
		storeVO.setCorp_id("corp2");
		storeVO.setStore_id("corp2_store");
		int result = 0;
		String url = "";
		result = storeService.storeInfoUpdate(storeVO);
		
		if(result == 1) {
			url = "corpService/store/storeinfoRead";
		} else {
			url = "corpService/store/storeUpdateForm";
		}
		
		return "redirect:" + url;
	}
	
	@GetMapping(value="/storeReview")
	public String storeReview(@ModelAttribute StoreVO svo, Model model) {
		
		return "corpService/store/storeReview";
	}
}
