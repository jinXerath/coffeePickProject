package com.cp.user.store.controller;

import java.util.List;

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


/*
 * @RestController
 * GET - 읽기(read)
 * POST - 생성(create)
 * PUT/PATCH - 수정(update)
 * DELETE - 삭제(delete)
 * */
@Controller
@RequestMapping("/store/*")
@Slf4j

public class StoreController {

	@Setter(onMethod_ = @Autowired)
	private StoreService storeService;

	@GetMapping("/corpService/storeInfoRead") // 세션에서 현재 로그인한 기업회원의 corp_id를 가져옵니다.
	public String storeInfoRead(Model model, HttpSession session) { 
		log.info("StoreInfoRead 메소드 호출 성공");
//		CorpVO cvo = (CorpVO)session.getAttribute("corpLogin");
		StoreVO svo = new StoreVO();
//		svo.setCorp_id(cvo.getCorp_id());
		svo.setCorp_id("corp1");
		StoreVO storeVO = storeService.storeInfoRead(svo);
		log.info("읽어줘");
		model.addAttribute("storeVO", storeVO);

		return "corpService/store/storeInfoRead";
	}

	//매장 정보 등록 폼 출력.
	@GetMapping("/corpService/registForm")
	public String registForm() {
		log.info("registForm 호출 성공");

		return "corpService/store/storeInfoRegistForm";
	}

	@PostMapping("/corpService/storeInfoRegist")
	public String storeInfoRegist(StoreVO svo, Model model) throws Exception {
		log.info("infoRegist 메소드 호출");

		int result = 0;
		String url = "";

		result = storeService.storeInfoRegist(svo);
		log.info("" + result);
		if (result == 1) {
			url = "/store/corpService/storeInfoRead"; // 성공
		} else {
			url = "/store/corpService/registForm";	// 실패
		}
		return "redirect:" + url;

	}

	@GetMapping("/corpService/updateForm")
	public String updateForm(@ModelAttribute StoreVO svo, Model model) {
		log.info("updateForm 호출 성공");
		svo.setStore_id("corp1_store");
		StoreVO updateData = storeService.storeUpdateForm(svo);
		model.addAttribute("updateData",updateData);
		return "corpService/store/storeInfoUpdateForm";
	}

	@PostMapping("/corpService/storeInfoUpdate")
	public String storeInfoUpdate(StoreVO svo, Model model) throws Exception {
		log.info("update 메소드 출력");
		StoreVO storeVO = new StoreVO();
		storeVO.setCorp_id("corp1");
		storeVO.setStore_id("corp1_store");
		int result = 0;
		String url = "";
		result = storeService.storeInfoUpdate(storeVO);
		log.info("" + result);
		if (result == 1) {
			url = "/store/corpService/storeinfoRead";
		} else {
			url = "/store/corpService/storeUpdateForm";
		}

		return "redirect:" + url;
	}

	@GetMapping("/memberService/storeReview")
	public String storeReview(@ModelAttribute StoreVO svo, Model model) {

		return "corpService/store/storeReview";
	}
	


	/***************************************************
	 * 매장 리스트 구현하기(페이징 처리부분과 검색 제외 목록 조회) 요청 URL:
	 * http://localhost:8080/store/storeList
	 *************************************************/

	@GetMapping("/memberService/storeList")
	public String storeList(@ModelAttribute StoreVO svo, Model model) {
		log.info("storeList호출 성공");
		// 전체 레코드 조회
		List<StoreVO> storeList = storeService.storeList(svo);
		model.addAttribute("storeList", storeList);

		return "memberService/order/storeList"; // WEB-INF/views/memberService/order/storeList
	}

	@GetMapping("/memberService/storeMenu")
	public String storeMenu() {
		log.info("storeMenu 호출 성공");

		return "memberService/order/storeMenu";
	}

	@GetMapping("/memberService/storeInfo")
	public String storeInfo() {
		log.info("storeInfo 호출 성공");

		return "memberService/order/storeInfo";
	}

}
