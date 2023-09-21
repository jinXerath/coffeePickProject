package com.cp.admin.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cp.admin.qna.service.QnaReplyService;
import com.cp.admin.qna.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/corpQna/*")
public class CorpQnaReplyController {
	@Setter(onMethod_= @Autowired)
	private QnaReplyService qnaReplyService;
	
	@ResponseBody
	@PostMapping(value = "/corpQnaReplyDetail", produces = MediaType.APPLICATION_JSON_VALUE)
	public QnaReplyVO corpQnaReplyDetail(QnaReplyVO qrvo) {
		QnaReplyVO corpQnaReplyDetail = qnaReplyService.corpQnaReplyDetail(qrvo);
		
		return corpQnaReplyDetail;
	}
	
	@ResponseBody
	@PostMapping("/corpQnaReplyInsert")
	public String corpQnaReplyInsert(QnaReplyVO qrvo) throws Exception {
		int result = qnaReplyService.corpQnaReplyInsert(qrvo);
		String value = "";
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
	
	@ResponseBody
	@PostMapping("/corpQnaReplyUpdate")
	public String corpQnaReplyUpdate(QnaReplyVO qrvo, @RequestParam String qna_reply_img_delete) throws Exception {
		log.info(qna_reply_img_delete);
		int result = qnaReplyService.corpQnaReplyUpdate(qrvo, qna_reply_img_delete);
		String value = "";
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
	
	@ResponseBody
	@PostMapping("/corpQnaReplyDelete")
	public String corpQnaReplyDelete(QnaReplyVO qrvo) throws Exception {
		int result = qnaReplyService.corpQnaReplyDelete(qrvo);
		String value = "";
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
}
