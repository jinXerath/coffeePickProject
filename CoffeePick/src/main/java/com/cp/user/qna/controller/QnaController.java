package com.cp.user.qna.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.admin.qna.service.QnaService;
import com.cp.admin.qna.vo.QnaVO;
import com.cp.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Setter(onMethod_= @Autowired)
	private QnaService qnaService;
	
	@GetMapping("/memberQnaList")
	public String MemberQnaList(@ModelAttribute QnaVO qvo, Model model) throws IOException {
		List<QnaVO> memberQnaList = qnaService.memberQnaList(qvo);
		model.addAttribute("memberQnaList", memberQnaList);
		
		//log.info("total"+ total);
		model.addAttribute("pageMaker",new PageDTO(qvo, 3));
		
		return "qna/memberQnaList";
	}
}
