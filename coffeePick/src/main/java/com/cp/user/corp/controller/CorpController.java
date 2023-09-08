package com.cp.user.corp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/corp/*")
@Slf4j
public class CorpController {
	@GetMapping("/read")
	public String corpInfoRead() {
		log.info("매장정보조회");
		
		return "corpService/corpInfo/corpInfoRead";
	}
}
