package com.cp.user.corp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.user.corp.service.CorpService;
import com.cp.user.corp.vo.CorpVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("corp")
@RequestMapping("/corp/*")
public class JinhwanCorpController {
	@Setter(onMethod_= @Autowired)
	public CorpService corpService;
	
	/**
	 * 관리자 로그인폼으로 이동
	 */
	@GetMapping("/loginForm")
	public String corpLoginForm() {
		log.info("기업회원 로그인폼 호출");
		return "corp/sign/login";
	}
	
	@PostMapping("/login")
	public String adminLogin(CorpVO svo, Model model, RedirectAttributes ras) {
		String url = "";
		CorpVO corp = corpService.loginJinhwan(svo);
		
		if(corp != null) {
			if(corp.getCorp_status().equals("N")) {
				ras.addFlashAttribute("errorMsg","탈퇴한 회원입니다.");
				url = "corp/loginForm";
			} else {
			model.addAttribute("corp", corp);
			url = "";
			}
		}else {
			ras.addFlashAttribute("errorMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			url = "/corp/loginForm";
		}
		return "redirect:"+url;
	}
	
	
}
