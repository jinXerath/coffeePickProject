package com.cp.user.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.user.corp.vo.CorpVO;
import com.cp.user.store.service.StoreService;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/store/*")
@Slf4j
@SessionAttributes("corp")
public class corpStoreController {
	
	@Setter(onMethod_ = @Autowired)
	private StoreService storeService;

	@GetMapping("/storeInfoRead") // 세션에서 현재 로그인한 기업회원의 corp_id를 가져옵니다.
	public String storeInfoRead(Model model, HttpSession session) {
		log.info("StoreInfoRead 메소드 호출 성공");
		CorpVO corp = (CorpVO)session.getAttribute("corp");
	      String corp_id = corp.getCorp_id();
		StoreVO svo = new StoreVO();
		svo.setCorp_id(corp_id);
		StoreVO store = storeService.storeInfoRead(svo);
		model.addAttribute("store", store);
		return "corpService/store/storeInfoRead";

	}
	
	// 매장 정보 등록 폼
//	@GetMapping("/storeInforegistForm")
//	public String registForm(HttpSession httpSession, RedirectAttributes ras) {
//		log.info("registForm 호출 성공");
//		CorpVO corpVO = (CorpVO)httpSession.getAttribute("corp");
//		StoreVO svo = new StoreVO();
//		svo.setCorp_id(corpVO.getCorp_id());
//		svo =storeService.storeInfoRead(svo);
//		String url = "";
//		if(svo.getStore_id() == null) {
//			ras.addAttribute(url);
//		}
//		return "corpService/store/storeInfoRegistForm";
//	}

	// 매장 정보 등록 폼
	@GetMapping("/storeInfoRegistForm")
	public String storeInfoRegistForm(HttpSession session, Model model, RedirectAttributes ras) {
		log.info("registForm 호출 성공");
		
		CorpVO corp = (CorpVO)session.getAttribute("corp");
		log.info(corp.getCorp_id());
		model.addAttribute("corp", corp);
	      String corp_id = corp.getCorp_id();
		StoreVO svo = new StoreVO();
		svo.setCorp_id(corp_id);
		StoreVO store = storeService.storeInfoRead(svo);
		model.addAttribute("store",store);
		return "corpService/store/storeInfoRegistForm";
	}

	
	// 매장 정보등록 controller
	@PostMapping("/storeInfoRegist")
	public String storeInfoRegist(StoreVO svo, Model model, HttpSession session, RedirectAttributes ras) throws Exception {
		log.info("infoRegist 메소드 호출");
		CorpVO corp = (CorpVO)session.getAttribute("corp");
		svo.setCorp_id(corp.getCorp_id());
		log.info(corp.getCorp_id());
		int result = 0;
		String url = "";

		result = storeService.storeInfoRegist(svo);
		log.info("" + result);
		if (result == 1) {
			ras.addFlashAttribute("successMsg", corp.getCorp_id()+"님의 매장등록이 완료되었습니다.");
			url = "/store/storeInfoRead"; // 성공
		} else {
			ras.addFlashAttribute("errorMsg", corp.getCorp_id()+"님의 매장등록이 실패하었습니다.");
			url = "/store/storeInfoRegistForm"; // 실패
		}
		return "redirect:" + url;

	}

/*	@GetMapping("/storeInfoUpdateForm")
	public String updateForm(@ModelAttribute StoreVO svo, Model model, HttpSession session) {
		log.info("updateForm 호출 성공");
		CorpVO corp = (CorpVO)session.getAttribute("corp");
		svo.setCorp_id(corp.getCorp_id());
		log.info(svo.getStore_id());
		StoreVO updateData = storeService.storeUpdateForm(svo);
		model.addAttribute("updateData", updateData);
		
		return "corpService/store/storeInfoUpdateForm";
	}*/
	/**
	 * @param corp
	 * @param model
	 * @return
	 * */	
	@GetMapping("/storeInfoUpdateForm")
	public String updateForm(@RequestParam("store_id") String storeId, Model model, HttpSession session) throws Exception {
	    log.info("updateForm 호출 성공");
	    CorpVO corp = (CorpVO) session.getAttribute("corp");
	    log.info(storeId);
	    // store_id를 이용하여 store 데이터를 가져옵니다.
	    StoreVO svo = new StoreVO();
	    svo.setCorp_id(corp.getCorp_id());
	    svo.setStore_id(storeId);
	    StoreVO updateData = storeService.storeUpdateForm(svo);
	    
	    model.addAttribute("updateData", updateData);
	    
	    return "corpService/store/storeInfoUpdateForm";
	}	

	@PostMapping("/storeInfoUpdate")
	public String storeInfoUpdate(@ModelAttribute StoreVO svo, Model model, HttpSession session, RedirectAttributes ras) throws Exception {
		log.info("update 메소드 출력");
		CorpVO corp = (CorpVO)session.getAttribute("corp");
//		StoreVO store = new StoreVO();
//		store.setCorp_id(corp.getCorp_id());
//		store.setStore_id(svo.getStore_id());
//		log.info(store.getStore_id());
		log.info(svo.getStore_id());
		int result = 0;
		String url = "";
		result = storeService.storeInfoUpdate(svo);
		log.info("" + result);
		if (result == 1) {
			ras.addFlashAttribute("successMsg", corp.getCorp_id() + " 님의 매장수정이 완료되었습니다.");
			url = "/store/storeInfoRead?store_id=" + svo.getStore_id();
		} else {
			ras.addFlashAttribute("errorMsg", corp.getCorp_id() + " 님의 매장수정이 실패하었습니다.");
			url = "/store/storeInfoUpdateForm?store_id=" + svo.getStore_id();
		}

		return "redirect:" + url;
	}
	
	@PostMapping("/storeInfoDelete")
	public String storeInfoDelete(@ModelAttribute StoreVO svo, Model model, RedirectAttributes ras) throws Exception {
		log.info("storeDelete 메소드 호출");
		
		int result = 0;
		String url = "";
		
		svo.getStore_id();
		StoreVO store = new StoreVO();
		store.setStore_id(svo.getStore_id());
		
		result = storeService.storeInfoDelete(store);
		log.info("" + store.getCorp_id());
		if(result == 1) {
			ras.addFlashAttribute("successMsg", store.getCorp_id()+"님의 매장정보 삭제가 완료되었습니다.");
			url = "/store/storeInfoRead";
		} else {
			ras.addFlashAttribute("errorMsg", "매장정보 삭제에 문제가 발생하였습니다.");
			url = "/store/storeInfoRead";
		}
		return "redirect:" + url;
	}
}
