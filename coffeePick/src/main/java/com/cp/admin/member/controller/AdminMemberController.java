package com.cp.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.user.member.service.MemberService;
import com.cp.user.member.vo.MemberVO;

import lombok.Setter;

@Controller
@RequestMapping("/admin/member/*")
public class AdminMemberController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService memberService;
	
	@GetMapping("/memberList")
	public String memberList(MemberVO mvo, Model model) {
		System.out.println("1======"+mvo.getSearchRadio());
		List<MemberVO> memberList = memberService.memberList(mvo);
		
		model.addAttribute("memberList", memberList);
		
		return "admin/member/memberList";
	}
	
	//탈퇴 버튼 맵핑
	@GetMapping("/memberStatus")
	public String memberStatus(@ModelAttribute MemberVO mvo, RedirectAttributes ras) {
		
		memberService.memberStatus(mvo);
		
		return "redirect:/admin/member/memberList";
	}
	
	
	
	@GetMapping("/memberCount")
	@ResponseBody
	public String memberCount() {
		int result = memberService.memberCount();
		
		return String.valueOf(result);
	}
}
