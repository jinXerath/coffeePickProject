package com.cp.admin.notice.controller;

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
@RequestMapping("/admin/notice/*")
public class AdminNoticeController {
	
	@Setter(onMethod_=@Autowired)
	private BoardService boardService;
	
	@GetMapping("/noticeList")
	public String boardList(BoardVO bvo, Model model) {
		// radio검색 기본값 설정
		if(bvo.getSearchRadio()=="") {
			bvo.setSearchRadio("m_all");
		}

		// 전체 레코드 조회
		List<BoardVO> noticeList = boardService.boardList(bvo);
		model.addAttribute("noticeList", noticeList);

		// 전체 레코드수 반환
		int total = boardService.boardListCnt(bvo);

		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(bvo, total));

		return "admin/notice/noticeList";
	}
	
	@GetMapping("/writeForm")
	public String writeForm(@SessionAttribute("adminLogin") AdminVO adminLogin, Model model) {
		//임시데이터 세션에서 id값 받아올 자리
//		String admin_id = adminLogin.getAdmin_id();
//		BoardVO bvo = new BoardVO();
//		bvo.setAdmin_id(admin_id);
		
//		model.addAttribute("session", bvo);
		return "admin/notice/writeForm";
	}
	
	
	/**
	 * 글쓰기 구현하기 
	 */
	@PostMapping("/noticeInsert")
	public String boardInsert(BoardVO bvo, Model model) throws Exception {
		int result = 0;
		String url = "";
		
		result = boardService.boardInsert(bvo);
		
		if(result == 1) {
			url = "/admin/notice/noticeList";
		} else {
			url = "/admin/notice/writeForm";
		}
		
		return "redirect:"+url;
	}
	
	//글 상세보기 구현
	@GetMapping("/noticeDetail")
	public String boardDetail(@ModelAttribute BoardVO vo,Model model) {
		
		BoardVO detail=boardService.boardDetail(vo);
		model.addAttribute("detail",detail);
		
		return "admin/notice/noticeDetail";
	}
	
	// 삭제
	@PostMapping("/noticeDelete")
	public String boardDelete(BoardVO bvo, RedirectAttributes ras) throws Exception {
		
		//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";

		result = boardService.boardDelete(bvo);
		ras.addFlashAttribute("boardVO", bvo);

		if (result == 1) {
			url = "/admin/notice/noticeList";
		} else {
			url = "/admin/notice/noitceDetail";
		}

		return "redirect:" + url;
	}
	
	@GetMapping(value="/updateForm")
	public String updateForm(@ModelAttribute BoardVO bvo, Model model) throws Exception{
		
		BoardVO updateData = boardService.updateForm(bvo);
		
		model.addAttribute("updateData",updateData);
		return "admin/notice/updateForm"; //WEB-INF/views/board/updateForm.jsp를 의미
	}
	
	// 업데이트
	@PostMapping("/noticeUpdate")
	public String boardUpdate(@ModelAttribute BoardVO bvo, RedirectAttributes ras) throws Exception{
		
		int result=0;
		String url="";
		
		result=boardService.boardUpdate(bvo);
		ras.addFlashAttribute("boardVO",bvo);
		
		if(result==1) {
			url = "/admin/notice/noticeDetail";
		}else{
			url="/admin/notice/updateForm";
		}
		return "redirect:" +url;
	}
	
	@PostMapping("/checkDelete")
	public String checkDelete(@RequestParam String[] checkList) throws Exception{
		
		List<String> list = new ArrayList<String>();

		for(int i=0; i < checkList.length; i++){
			list.add(checkList[i]);
		}
		
		boardService.checkDelete(list);
		
		return "redirect:/admin/notice/noticeList";
	}
}
