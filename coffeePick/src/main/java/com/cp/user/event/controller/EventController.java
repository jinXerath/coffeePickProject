package com.cp.user.event.controller;

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
@RequestMapping("/board/event/*")
public class EventController {
	
	@Setter(onMethod_=@Autowired)
	private BoardService boardService;
	
	@GetMapping("/eventList")
	public String boardList(BoardVO bvo, Model model) {
		if(bvo.getSearchRadio()=="") {
			bvo.setSearchRadio("m_all");
		}

		List<BoardVO> eventList = boardService.eventList(bvo);
		model.addAttribute("eventList", eventList);

		int total = boardService.eventListCnt(bvo);

		model.addAttribute("pageMaker", new PageDTO(bvo, total));

		return "board/event/eventList";
	}
	
	@GetMapping("/eventDetail")
	public String boardDetail(@ModelAttribute BoardVO vo,Model model) {
		
		BoardVO detail=boardService.eventDetail(vo);
		model.addAttribute("detail",detail);
		
		return "board/event/eventDetail";
	}
	

}
