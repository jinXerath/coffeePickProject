package com.cp.admin.administrator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.admin.administrator.service.AdminService;
import com.cp.admin.administrator.vo.AdminKeyVO;
import com.cp.admin.administrator.vo.AdminVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
public class AdminController {
	
	@Setter(onMethod_= @Autowired)
	public AdminService adminService;
	
	/**
	 * 관리자 로그인폼으로 이동
	 */
	@GetMapping("/sign/login")
	public String adminLoginForm() {
		return "admin/sign/login";
	}
	
	/**
	 * 관리자 로그인 처리
	 */
	@PostMapping("/sign/login")
	public String adminLogin(AdminVO avo, Model model, RedirectAttributes ras) {
		String url = "";
		AdminVO adminLogin = adminService.adminLogin(avo);
		
		if(adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);
			url = "/admin";
		}else {
			ras.addFlashAttribute("errorMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			url = "/admin/sign/login";
		}
		return "redirect:"+url;
	}
	
	/**
	 * 로그아웃 처리
	 */
	@GetMapping("/sign/logout")
	public String adminLogout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/admin/sign/login";
	}
	
	/**
	 * 관리자 회원가입을 하는 폼으로 이동
	 */
	@GetMapping("/sign/signUp")
	public String adminSignUpForm() {
		return "admin/sign/signUp";
	}
	
	/**
	 * 관리자 회원가입 처리
	 */
	@PostMapping("/sign/signUp")
	public String adminSignUp(AdminVO avo, RedirectAttributes ras) {
		String url = "";
		int result = adminService.adminInsert(avo);
		
		if(result == 1) {
			ras.addFlashAttribute("successMsg", avo.getAdmin_name()+"님의 회원가입이 완료되었습니다.");
			url = "/admin/sign/login";
		}else {
			ras.addFlashAttribute("errorMsg", "회원가입에 실패하였습니다.");
			url = "/admin/sign/signUp";
		}
		return "redirect:"+ url;
	}
	/**
	 * 관리자 아이디 중복 체크 중복 시 "실패" 반환, 중복되지 않으면 "성공" 반환
	 */
	@ResponseBody
	@PostMapping(value="/adminIdConfirm", produces = "text/plain; charset=UTF-8")
	public String adminIdConfirm(AdminVO avo) {
		String value = "";
		int result = adminService.adminIdConfirm(avo);
		if(result == 1) {
			value = "실패";
		} else {
			value = "성공";
		}
		return value;
	}
	
	@ResponseBody
	@PostMapping(value="/adminPwConfirm", produces = "text/plain; charset=UTF-8")
	public String adminPwConfirm(AdminVO avo) {
		String value = "";
		int result = adminService.adminPwConfirm(avo);
		if(result == 1) {
			value = "성공";
		} else {
			value = "실패";
		}
		return value;
	}
	
	/**
	 * 관리자 키가 올바른지 확인 후 일치하면 "성공" 반환, 일치하지 않으면 "실패" 반환
	 * @param akvo
	 * @return value
	 */
	@ResponseBody
	@PostMapping(value="/adminKeyConfirm", produces = "text/plain; charset=UTF-8")
	public String adminKeyConfirm(AdminKeyVO akvo) {
		String value = "";
		int result = adminService.adminKeyConfirm(akvo);
		if(result == 1) {
			value = "성공";
		} else {
			value = "실패";
		}
		return value;
	}
	
	/**
	 * 관리자 정보 수정 폼으로 이동
	 * @param adminLogin
	 * @param model
	 * @return
	 */
	@GetMapping("/update")
	public String adminUpdateForm(@SessionAttribute("adminLogin") AdminVO adminLogin, Model model) {
		AdminVO admin = adminService.adminInfo(adminLogin);
		model.addAttribute("admin", admin);
		return "admin/adminUpdate";
	}
	
	@PostMapping("/update")
	public String adminUpdate(AdminVO avo, RedirectAttributes ras) {
		int result = adminService.adminUpdate(avo);
		avo = adminService.adminInfo(avo);
		if(result == 1) {
			ras.addFlashAttribute("successMsg", avo.getAdmin_name()+"님의 정보가 수정되었습니다.");
		}else {
			ras.addFlashAttribute("errorMsg", "정보 수정에 실패하였습니다.");
		}
		return "redirect:/admin/update";
	}
	
	@PostMapping("/pwUpdate")
	public String adminPwUpdate(AdminVO avo, RedirectAttributes ras) {
		int result = adminService.adminPwUpdate(avo);
		avo = adminService.adminInfo(avo);
		if(result == 1) {
			ras.addFlashAttribute("successMsg", avo.getAdmin_name()+"님의 비밀번호가 변경되었습니다.");
		}else {
			ras.addFlashAttribute("errorMsg", "비밀번호 변경에 실패하였습니다.");
		}
		return "redirect:/admin/update";
	}
	
	@PostMapping("/delete")
	public String adminDelete(AdminVO avo, RedirectAttributes ras) {
		String url = "";
		int result = adminService.adminDelete(avo);
		if(result == 1) {
			ras.addFlashAttribute("successMsg", "회원탈퇴가 완료되었습니다.");
			url = "/admin/sign/login";
		}else {
			ras.addFlashAttribute("errorMsg", "회원탈퇴에 실패하였습니다.");
			url = "/admin/update";
		}
		
		return "redirect:"+ url;
	}
	
	@GetMapping("/supervisor")
	public String adminSupervisor(@SessionAttribute("adminLogin") AdminVO adminLogin, Model model) {
		if(!adminLogin.getAdmin_authority().equals("S")) {
			return "redirect:/admin";
		}
		AdminKeyVO adminKey = adminService.adminKeyInfo();
		model.addAttribute("adminKey", adminKey);
		
		return "admin/adminSupervisor";
	}
	
	@PostMapping("/keyUpdate")
	public String adminKeyUpdate(AdminKeyVO akvo, RedirectAttributes ras) {
		int result = adminService.adminKeyUpdate(akvo);
		if(result == 1) {
			ras.addFlashAttribute("successMsg", "관리자 키 변경에 성공했습니다.");
		}else {
			ras.addFlashAttribute("errorMsg", "관리자 키 변경에 실패하였습니다.");
		}
		return "redirect:/admin/supervisor";
	}
}