package com.cp.user.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.user.corp.vo.CorpVO;
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

	@GetMapping("/corpService/storeInfoRead") // 세션에서 현재 로그인한 기업회원의 corp_id를 가져옵니다.
	public String storeInfoRead(Model model, HttpSession httpSession) {
		log.info("StoreInfoRead 메소드 호출 성공");
		CorpVO cvo = (CorpVO) httpSession.getAttribute("corp");
	      String corp_id = cvo.getCorp_id();
		StoreVO svo = new StoreVO();
		svo.setCorp_id(corp_id);
		StoreVO storeVO = storeService.storeInfoRead(svo);
		log.info("읽어줘");
		model.addAttribute("storeVO", storeVO);
		return "corpService/store/storeInfoRead";

	}



	// 매장 정보 등록 폼
	@GetMapping("/corpService/registForm")
	public String registForm(HttpSession httpSession, RedirectAttributes ras) {
		log.info("registForm 호출 성공");
//		CorpVO cvo = (CorpVO)session.getAttribute("corpLogin");
//		StoreVO svo = new StoreVO();
//		svo.setCorp_id(cvo.getCorp_id());
//		svo =storeService.storeInfoRead(svo);
//		String url = "";
//		if(svo.getStore_id() == null) {
//			ras
//		}
		return "corpService/store/storeInfoRegistForm";
	}

	
	// 매장 정보등록 controller
	@PostMapping("/corpService/storeInfoRegist")
	public String storeInfoRegist(StoreVO svo, Model model, HttpSession httpSession) throws Exception {
		log.info("infoRegist 메소드 호출");

		int result = 0;
		String url = "";

		result = storeService.storeInfoRegist(svo);
		log.info("" + result);
		if (result == 1) {
			url = "/store/corpService/storeInfoRead"; // 성공
		} else {
			url = "/store/corpService/registForm"; // 실패
		}
		return "redirect:" + url;

	}

	@GetMapping("/corpService/updateForm")
	public String updateForm(@ModelAttribute StoreVO svo, Model model, HttpSession httpSession) {
		log.info("updateForm 호출 성공");
		svo.setStore_id("corp1_store");
		StoreVO updateData = storeService.storeUpdateForm(svo);
		model.addAttribute("updateData", updateData);
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

}
