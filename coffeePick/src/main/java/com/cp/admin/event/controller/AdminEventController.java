package com.cp.admin.event.controller;

import java.util.ArrayList;
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

import com.cp.admin.administrator.vo.AdminVO;
import com.cp.admin.board.service.BoardService;
import com.cp.admin.board.vo.BoardVO;
import com.cp.common.vo.PageDTO;

import lombok.Setter;

@Controller
@RequestMapping("/admin/event/*")
public class AdminEventController {
	
	@Setter(onMethod_=@Autowired)
	private BoardService boardService;
	
	@GetMapping("/eventList")
	public String boardList(BoardVO bvo, Model model) {
		// radio검색 기본값 설정
		if(bvo.getSearchRadio()=="") {
			bvo.setSearchRadio("m_all");
		}

		// 전체 레코드 조회
		List<BoardVO> eventList = boardService.eventList(bvo);
		model.addAttribute("eventList", eventList);

		// 전체 레코드수 반환
		int total = boardService.eventListCnt(bvo);

		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(bvo, total));

		return "admin/event/eventList";
	}
	
	@GetMapping("/writeForm")
	public String writeForm(@SessionAttribute("adminLogin") AdminVO adminLogin, Model model) {
		//임시데이터 세션에서 id값 받아올 자리
//		String admin_id = adminLogin.getAdmin_id();
//		BoardVO bvo = new BoardVO();
//		bvo.setAdmin_id(admin_id);
		
//		model.addAttribute("session", bvo);
		return "admin/event/writeForm";
	}
	
	
	/**
	 * 글쓰기 구현하기 
	 */
	@PostMapping("/eventInsert")
	public String boardInsert(BoardVO bvo, Model model) throws Exception {
		int result = 0;
		String url = "";
		
		result = boardService.eventInsert(bvo);
		
		if(result == 1) {
			url = "/admin/event/eventList";
		} else {
			url = "/admin/event/writeForm";
		}
		
		return "redirect:"+url;
	}
	
	//글 상세보기 구현
	@GetMapping("/eventDetail")
	public String boardDetail(@ModelAttribute BoardVO vo,Model model) {
		
		BoardVO detail=boardService.eventDetail(vo);
		model.addAttribute("detail",detail);
		
		return "admin/event/eventDetail";
	}
	
	// 삭제
	@PostMapping("/eventDelete")
	public String boardDelete(BoardVO bvo, RedirectAttributes ras) throws Exception {
		
		int result = 0;
		String url = "";

		result = boardService.eventDelete(bvo);
		ras.addFlashAttribute("boardVO", bvo);

		if (result == 1) {
			url = "/admin/event/eventList";
		} else {
			url = "/admin/event/noitceDetail";
		}

		return "redirect:" + url;
	}
	
	@GetMapping(value="/updateForm")
	public String updateForm(@ModelAttribute BoardVO bvo, Model model) throws Exception{
		
		BoardVO updateData = boardService.eventUpdateForm(bvo);
		
		model.addAttribute("updateData",updateData);
		return "admin/event/updateForm"; 
	}
	
	// 업데이트
	@PostMapping("/eventUpdate")
	public String boardUpdate(@ModelAttribute BoardVO bvo, RedirectAttributes ras) throws Exception{
		
		int result=0;
		String url="";
		
		result=boardService.eventUpdate(bvo);
		ras.addFlashAttribute("boardVO",bvo);
		
		if(result==1) {
			url = "/admin/event/eventDetail";
		}else{
			url="/admin/event/updateForm";
		}
		return "redirect:" +url;
	}
	
	@PostMapping("/checkDelete")
	public String checkDelete(@RequestParam Integer[] checkNoList) throws Exception{
		
		List<Integer> list = new ArrayList<Integer>();

		for(int i=0; i < checkNoList.length; i++){
			list.add(checkNoList[i]);
		}
		
		boardService.eventCheckDelete(list);
		
		return "redirect:/admin/event/eventList";
	}
}
