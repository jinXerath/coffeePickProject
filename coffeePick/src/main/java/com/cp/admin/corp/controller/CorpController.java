package com.cp.admin.corp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/corp/*")
@Slf4j
public class CorpController {
	@GetMapping("corpinfo/writeForm")
	public String cartList() {
		
		return "corpService/corpInfoWriteForm";
	}
}
