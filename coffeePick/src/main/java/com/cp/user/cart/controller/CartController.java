package com.cp.user.cart.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cart/*")
@Slf4j
public class CartController {
	/*@Setter(onMethod_ = @Autowired)
	private MemberService memberService;*/
	
	/********************************************
	 * 장바구니 구현 
	 * 
	 *******************************************/
	@GetMapping("/list")
	public String cartList() {
		log.info("cart 호출 성공");
		
		return "memberService/cart";
	}
	
	
	
	
}
