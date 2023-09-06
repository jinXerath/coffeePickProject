package com.cp.user.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/*")
@Slf4j
public class MemberController {
	/*@Setter(onMethod_ = @Autowired)
	private MemberService memberService;*/
	
	/********************************************
	 * 장바구니 구현 
	 * 
	 *******************************************/
	@GetMapping("/cart")
	public String cart() {
		log.info("cart 호출 성공");
		
		
		return "memberService/cart";
	}
}
