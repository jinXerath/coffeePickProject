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
import com.cp.user.corp.vo.CorpVO;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/corpQna/*")
public class CorpQnaController {
	
	@Setter(onMethod_= @Autowired)
	private QnaService qnaService;
	
	@Setter(onMethod_= @Autowired)
	private QnaReplyService qnaReplyService;
	
	@GetMapping("/corpQnaList")
	public String corpQnaList(@ModelAttribute QnaVO qvo, Model model){
		qvo.setAmount(10);
		List<QnaVO> corpQnaList = qnaService.corpQnaList(qvo);
		model.addAttribute("corpQnaList", corpQnaList);
		
		int total = qnaService.corpQnaCnt(qvo);
		model.addAttribute("pageMaker",new PageDTO(qvo, total));
		
		return "board/corpQna/corpQnaList";
	}
	
	@GetMapping("corpQnaForm")
	public String corpQnaForm(Model model) {
		// 세션 값 받아오기
		//@SessionAttribute("memberLogin") memberVO memberLogin;
		CorpVO corp = new CorpVO();
		corp.setCorp_id("c123"); // 임시 값

		model.addAttribute("corp", corp);
		
		return "board/corpQna/corpQnaForm";
	}
	
	@PostMapping("/corpQnaInsert")
	public String corpQnaInsert(QnaVO qvo, Model model, RedirectAttributes ras) throws Exception {
		String url = "";
		int result = 0;
		log.info(qvo.toString());
		result = qnaService.corpQnaInsert(qvo);
		if(result == 1) {
			url = "/board/corpQna/corpQnaList";
		} else {
			url = "/board/corpQna/corpQnaForm";
			ras.addFlashAttribute("errorMsg", "오류가 발생했습니다.");
		}
			
		return "redirect:" + url;
	}
	
	@GetMapping("/corpQnaDetail")
	public String corpQnaDetail(QnaVO qvo, Model model) {
		QnaVO qnaDetail = qnaService.corpQnaDetail(qvo);
		
		QnaReplyVO qrvo = new QnaReplyVO();
		qrvo.setQna_no(qvo.getQna_no());
		QnaReplyVO qnaReplyDetail = qnaReplyService.corpQnaReplyDetail(qrvo);
		
		model.addAttribute("qnaDetail",qnaDetail);
		model.addAttribute("qnaReplyDetail",qnaReplyDetail);
		
		return "board/corpQna/corpQnaDetail";
	}
	
	@GetMapping("/corpQnaUpdateForm")
	public String corpQnaUpdateForm(@ModelAttribute QnaVO qvo , Model model) {
		QnaVO updateData = qnaService.corpQnaUpdateForm(qvo);
		
		model.addAttribute("updateData",updateData);
		return "board/corpQna/corpQnaUpdateForm";
	}
	
	@PostMapping("/corpQnaUpdate")
	public String corpQnaUpdate(@ModelAttribute QnaVO qvo, @RequestParam String qna_img_delete) throws Exception {
		int result = 0;
		String url ="";
		log.info(qna_img_delete);
		result = qnaService.corpQnaUpdate(qvo, qna_img_delete);
		
		if(result == 1) {
			url = "/board/corpQna/corpQnaDetail?qna_no="+qvo.getQna_no();
		} else {
			url = "/board/corpQna/corpQnaUpdateForm?qna_no="+qvo.getQna_no();
		}
		
		return "redirect:" + url;
	}
	
	@PostMapping("/corpQnaDelete")
	public String corpQnaDelete(@ModelAttribute QnaVO qvo) throws Exception {
		int result = 0;
		String url ="";
		result = qnaService.corpQnaDelete(qvo);
		
		if(result == 1) {
			url = "/board/corpQna/corpQnaList";
		} else {
			url = "/board/corpQna/corpQnaDetail?qna_no="+qvo.getQna_no();
		}
		return "redirect:" + url;
	}
	
}