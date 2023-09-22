package com.cp.admin.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cp.admin.qna.service.QnaReplyService;
import com.cp.admin.qna.service.QnaService;
import com.cp.admin.qna.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/memberQna/*")
public class MemberQnaReplyController {
	
	@Setter(onMethod_= @Autowired)
	private QnaReplyService qnaReplyService;
	
	@ResponseBody
	@PostMapping(value = "/memberQnaReplyDetail", produces = MediaType.APPLICATION_JSON_VALUE)
	public QnaReplyVO memberQnaReplyDetail(QnaReplyVO qrvo) {
		QnaReplyVO memberQnaReplyDetail = qnaReplyService.memberQnaReplyDetail(qrvo);
		
		return memberQnaReplyDetail;
	}
	
	@ResponseBody
	@PostMapping("/memberQnaReplyInsert")
	public String memberQnaReplyInsert(QnaReplyVO qrvo) throws Exception {
		int result = qnaReplyService.memberQnaReplyInsert(qrvo);
		String value = "";
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
	
	@ResponseBody
	@PostMapping("/memberQnaReplyUpdate")
	public String memberQnaReplyUpdate(QnaReplyVO qrvo, @RequestParam String qna_reply_img_delete) throws Exception {
		log.info(qna_reply_img_delete);
		int result = qnaReplyService.memberQnaReplyUpdate(qrvo, qna_reply_img_delete);
		String value = "";
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
	
	@ResponseBody
	@PostMapping("/memberQnaReplyDelete")
	public String memberQnaReplyDelete(QnaReplyVO qrvo) throws Exception {
		int result = qnaReplyService.memberQnaReplyDelete(qrvo);
		String value = "";
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
}
