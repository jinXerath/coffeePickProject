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

import com.cp.common.vo.PageDTO;
import com.cp.user.member.service.MemberService;
import com.cp.user.member.vo.MemberVO;

import lombok.Setter;

@Controller
@RequestMapping("/admin/member/*")
public class AdminMemberController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService memberService;
	
	//회원 리스트
	@GetMapping("/memberList")
	public String memberList(MemberVO mvo, Model model) {
		// radio검색 기본값 설정
		if(mvo.getSearchRadio()=="") {
			mvo.setSearchRadio("m_all");
		}
		// 전체 리스트
		List<MemberVO> memberList = memberService.memberList(mvo);
		model.addAttribute("memberList", memberList);
		
		// 전체 레코드수 반환
		int total = memberService.memberListCnt(mvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker",new PageDTO(mvo, total));
		
		return "admin/member/memberList";
	}
	
	//탈퇴 버튼 맵핑
	@GetMapping("/memberStatus")
	public String memberStatus(@ModelAttribute MemberVO mvo, RedirectAttributes ras) {
		
		memberService.memberStatus(mvo);
		
		return "redirect:/admin/member/memberList";
	}
	
	
	//가입한 회원 수
	@GetMapping("/memberCount")
	@ResponseBody
	public String memberCount() {
		int result = memberService.memberCount();
		
		return String.valueOf(result);
	}
}
