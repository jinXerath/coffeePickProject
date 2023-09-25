package com.cp.user.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.admin.board.service.BoardService;
import com.cp.admin.board.vo.BoardVO;
import com.cp.common.vo.PageDTO;

import lombok.Setter;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {
	
	@Setter(onMethod_=@Autowired)
	private BoardService boardService;
	
	@GetMapping("/noticeList")
	public String noticeList(BoardVO bvo, Model model) {
		if(bvo.getSearchRadio()=="") {
			bvo.setSearchRadio("m_all");
		}

		List<BoardVO> noticeList = boardService.boardList(bvo);
		model.addAttribute("noticeList", noticeList);

		int total = boardService.boardListCnt(bvo);

		model.addAttribute("pageMaker", new PageDTO(bvo, total));
		
		
		return "board/notice/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String boardDetail(@ModelAttribute BoardVO vo,Model model) {
		
		BoardVO detail=boardService.boardDetail(vo);
		
		model.addAttribute("detail",detail);
		
		return "board/notice/noticeDetail";
	}
	

}
