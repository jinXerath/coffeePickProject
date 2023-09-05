package com.cp.user.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	/**
	 * 요청하면 index.jsp로 이동
	 * @return "index"
	 */
	@GetMapping
	public String index() {
		return "index";
	}
}
