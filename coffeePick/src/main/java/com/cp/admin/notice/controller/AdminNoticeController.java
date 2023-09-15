package com.cp.admin.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/notice/*")
public class AdminNoticeController {
	
	@GetMapping("/noticeList")
	public String noticeList() {
		return "admin/notice/noticeList";
	}
}
