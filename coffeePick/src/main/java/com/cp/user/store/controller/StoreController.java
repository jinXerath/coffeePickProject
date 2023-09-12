package com.cp.user.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.user.cart.service.CartService;
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

	@Setter(onMethod_ = @Autowired)
	private CartService cartService;

	/*
	 * @GetMapping(value = "/storeInfoRead") // 세션에서 현재 로그인한 기업회원의 corp_id를 가져옵니다.
	 * public String storeInfoRead(Model model, HttpSession session) { // if(corp_id
	 * == null) { // ModelAttribute("msg", "매장정보가 없습니다. 매장을 등록해 주세요."); //
	 * log.info("StoreInfoRead 메소드 호출 성공"); // String corp_id = "corp1"; // 임시로
	 * corp1을 사용.
	 * 
	 * // store_id를 사용하여 매장정보를 검색
	 * 
	 * StoreVO storeVO = new StoreVO(); storeVO.setStore_id("store1");
	 * 
	 * storeVO = storeService.storeInfoRead(storeVO);
	 * 
	 * model.addAttribute("storeVO", storeVO);
	 * 
	 * return "corpService/store/storeInfoRead"; }
	 */
	@GetMapping(value = "/storeInfoRead") // 세션에서 현재 로그인한 기업회원의 corp_id를 가져옵니다.
	public String storeInfoRead(@ModelAttribute StoreVO svo, Model model, HttpSession session) {
		// if(corp_id == null) {
//	      ModelAttribute("msg", "매장정보가 없습니다. 매장을 등록해 주세요.");
//	      log.info("StoreInfoRead 메소드 호출 성공");
		// String corp_id = "corp1"; // 임시로 corp1을 사용.
		StoreVO storeVO = new StoreVO();

		svo.setStore_id("store1");
		storeVO = storeService.storeInfoRead(svo);
		model.addAttribute("storeVO", storeVO);
		return "corpService/store/storeInfoRead";
	}

	/*
	 * @GetMapping(value="/storeInfoUpdate") public String
	 * storeInfoUpdate(@ModelAttribute StoreVO svo, Model model) {
	 * 
	 * return "corpService/store/storeInfoUpdateForm"; }
	 * 
	 * @GetMapping(value="/storeInfoWrite") public String
	 * storeInfoWrite(@ModelAttribute StoreVO svo, Model model) {
	 * 
	 * return "corpService/store/storeInfoWriteForm"; }
	 * 
	 * @GetMapping(value="/storeReview") public String storeReview(@ModelAttribute
	 * StoreVO svo, Model model) {
	 * 
	 * return "corpService/store/storeReview"; }
	 */
}
