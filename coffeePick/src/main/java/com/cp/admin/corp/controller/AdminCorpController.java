package com.cp.admin.corp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/corp/*")
public class AdminCorpController {
	
	@GetMapping("/corpList")
	public String corpList() {
		return "admin/corp/corpList";
	}
	
	
}
