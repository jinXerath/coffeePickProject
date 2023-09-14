package com.cp.admin.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/event/*")
public class AdminEventController {
	
	@GetMapping("/eventList")
	public String EventList() {
		return "admin/event/eventList";
	}
}
