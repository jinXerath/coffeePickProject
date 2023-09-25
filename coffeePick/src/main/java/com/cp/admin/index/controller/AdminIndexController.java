package com.cp.admin.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class AdminIndexController {
	/**
	 * 요청하면 admin/adminIndex.jsp로 이동
	 * 
	 * @return "admin/adminIndex.jsp"
	 */
	@GetMapping("/admin")
	public String adminIndex() {
		return "admin/adminIndex";
	}
}