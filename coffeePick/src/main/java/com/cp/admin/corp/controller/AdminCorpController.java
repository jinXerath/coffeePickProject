package com.cp.admin.corp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.common.vo.PageDTO;
import com.cp.user.corp.service.CorpService;
import com.cp.user.corp.vo.CorpVO;

import lombok.Setter;


@Controller
@RequestMapping("/admin/corp/*")
public class AdminCorpController {

	
	@Setter(onMethod_=@Autowired)
	private CorpService corpService;
	
	@GetMapping("/corpList")
	public String corpList(CorpVO cvo, Model model) {
		// radio검색 기본값 설정
		if(cvo.getSearchRadio()=="") {
			cvo.setSearchRadio("m_all");
		}
		// 전체 리스트
		List<CorpVO> corpList = corpService.corpList(cvo);
		model.addAttribute("corpList", corpList);
		
		// 전체 레코드수 반환
		int total = corpService.corpListCnt(cvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker",new PageDTO(cvo, total));
		
		return "admin/corp/corpList";
	}
	
	//탈퇴 버튼 맵핑
	@GetMapping("/corpStatus")
	public String memberStatus(@ModelAttribute CorpVO cvo, RedirectAttributes ras) {
		
		corpService.corpStatus(cvo);
		
		return "redirect:/admin/corp/corpList";
	}
	
	/*//가입한 회원 수
	@GetMapping("/corpCount")
	@ResponseBody
	public String memberCount() {
		int result = corpService.corpCount();
		
		return String.valueOf(result);
	}*/
	
	
}
