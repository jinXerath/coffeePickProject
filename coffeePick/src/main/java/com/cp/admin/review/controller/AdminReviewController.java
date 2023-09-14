package com.cp.admin.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/review/*")
public class AdminReviewController {
	
	@GetMapping("/reviewList")
	public String adminIndex() {
		return "admin/review/reviewList";
	}
}
