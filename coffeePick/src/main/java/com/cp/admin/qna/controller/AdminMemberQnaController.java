package com.cp.admin.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cp.admin.administrator.vo.AdminVO;
import com.cp.admin.qna.service.QnaService;
import com.cp.admin.qna.vo.QnaVO;
import com.cp.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/memberQna/*")
public class AdminMemberQnaController {
	
	@Setter(onMethod_= @Autowired)
	private QnaService qnaService;
	
	@GetMapping("/memberQnaManage")
	public String memberQnaManage() {
		return "admin/memberQna/memberQnaManage";
	}
	
	@ResponseBody
	@PostMapping(value = "/memberQnaList", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> memberQnaListJSON(@ModelAttribute QnaVO qvo) { 
		// 관리자 리스트
		List<QnaVO> memberQnaList = qnaService.memberQnaList(qvo);
		// 전체 레코드수 반환
		int total = qnaService.memberQnaCnt(qvo);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("memberQnaList", memberQnaList);
		result.put("pageMaker", new PageDTO(qvo, total));
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/memberQnaDetail", produces = MediaType.APPLICATION_JSON_VALUE)
	public QnaVO memberQnaDetailJSON(@ModelAttribute QnaVO qvo) {
		QnaVO memberQnaDetail = qnaService.memberQnaDetail(qvo);
		
		return memberQnaDetail;
	}
	
	@ResponseBody
	@PostMapping("/memberQnaDelete")
	public String memberQnaDelete(QnaVO qvo) throws Exception {
		log.info(qvo.toString());
		int result = qnaService.memberQnaDelete(qvo);
		String value = "";
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
}
