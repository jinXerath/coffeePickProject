package com.cp.user.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.admin.qna.service.QnaReplyService;
import com.cp.admin.qna.service.QnaService;
import com.cp.admin.qna.vo.QnaReplyVO;
import com.cp.admin.qna.vo.QnaVO;
import com.cp.common.vo.PageDTO;
import com.cp.user.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/memberQna/*")
public class MemberQnaController {
	
	@Setter(onMethod_= @Autowired)
	private QnaService qnaService;
	
	@Setter(onMethod_= @Autowired)
	private QnaReplyService qnaReplyService;
	
	@GetMapping("/memberQnaList")
	public String memberQnaList(@ModelAttribute QnaVO qvo, Model model) {
		qvo.setAmount(10);
		List<QnaVO> memberQnaList = qnaService.memberQnaList(qvo);
		model.addAttribute("memberQnaList", memberQnaList);
		
		int total = qnaService.memberQnaCnt(qvo);
		model.addAttribute("pageMaker",new PageDTO(qvo, total));
		
		return "board/memberQna/memberQnaList";
	}
	
	@GetMapping("/memberQnaForm")
	public String memberQnaForm(Model model) {
		// 세션 값 받아오기
		//@SessionAttribute("memberLogin") memberVO memberLogin;
		MemberVO member = new MemberVO();
		member.setMember_id("member1"); // 임시 값
		member.setMember_nickname("Nickname11");
		model.addAttribute("member", member);
		
		return "board/memberQna/memberQnaForm";
	}
	
	@PostMapping("/memberQnaInsert")
	public String memberQnaInsert(QnaVO qvo, Model model, RedirectAttributes ras) throws Exception {
		String url = "";
		int result = 0;
		log.info(qvo.toString());
		result = qnaService.memberQnaInsert(qvo);
		if(result == 1) {
			url = "/board/memberQna/memberQnaList";
		} else {
			url = "/board/memberQna/memberQnaForm";
			ras.addFlashAttribute("errorMsg", "오류가 발생했습니다.");
		}
			
		return "redirect:" + url;
	}
	
	@GetMapping("/memberQnaDetail")
	public String memberQnaDetail(QnaVO qvo, Model model) {
		QnaVO qnaDetail = qnaService.memberQnaDetail(qvo);
		
		QnaReplyVO qrvo = new QnaReplyVO();
		qrvo.setQna_no(qvo.getQna_no());
		QnaReplyVO qnaReplyDetail = qnaReplyService.memberQnaReplyDetail(qrvo);
		
		model.addAttribute("qnaDetail",qnaDetail);
		model.addAttribute("qnaReplyDetail",qnaReplyDetail);
		
		return "board/memberQna/memberQnaDetail";
	}
	
	@GetMapping("/memberQnaUpdateForm")
	public String memberQnaUpdateForm(@ModelAttribute QnaVO qvo , Model model) {
		QnaVO updateData = qnaService.memberQnaUpdateForm(qvo);
		
		model.addAttribute("updateData",updateData);
		return "board/memberQna/memberQnaUpdateForm";
	}
	
	@PostMapping("/memberQnaUpdate")
	public String memberQnaUpdate(@ModelAttribute QnaVO qvo, @RequestParam String qna_img_delete) throws Exception {
		int result = 0;
		String url ="";
		log.info(qna_img_delete);
		result = qnaService.memberQnaUpdate(qvo, qna_img_delete);
		
		if(result == 1) {
			url = "/board/memberQna/memberQnaDetail?qna_no="+qvo.getQna_no();
		} else {
			url = "/board/memberQna/memberQnaUpdateForm?qna_no="+qvo.getQna_no();
		}
		
		return "redirect:" + url;
	}
	
	@PostMapping("/memberQnaDelete")
	public String memberQnaDelete(@ModelAttribute QnaVO qvo) throws Exception {
		int result = 0;
		String url ="";
		result = qnaService.memberQnaDelete(qvo);
		
		if(result == 1) {
			url = "/board/memberQna/memberQnaList";
		} else {
			url = "/board/memberQna/memberQnaDetail?qna_no="+qvo.getQna_no();
		}
		return "redirect:" + url;
	}
	
}