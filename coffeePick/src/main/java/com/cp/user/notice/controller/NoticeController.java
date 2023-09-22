package com.cp.user.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {
	
	@GetMapping("/notice")
	public String noticeList() {
		return "/board/notice/notice";
	}
	

}
