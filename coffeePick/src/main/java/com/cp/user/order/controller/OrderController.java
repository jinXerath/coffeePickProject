package com.cp.user.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.user.cart.controller.CartController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/order/*")
@Slf4j
public class OrderController {
	
	
	/********************************************
	 * 주문화면 구현 
	 * 
	 *******************************************/
	@GetMapping("/main")
	public String orderList() {
		log.info("order-main 호출 성공");
		
		return "memberService/order";
	}
	
	/********************************************
	 * 주문화면 구현 
	 * 
	 *******************************************/
	@GetMapping("/menu")
	public String orderMenuList() {
		log.info("order-main 호출 성공");
		
		return "memberService/order-store-menu";
	}
	
}
