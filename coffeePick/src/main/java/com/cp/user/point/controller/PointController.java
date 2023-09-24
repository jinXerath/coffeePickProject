package com.cp.user.point.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.common.vo.PageDTO;
import com.cp.user.member.vo.MemberVO;
import com.cp.user.point.service.PointService;
import com.cp.user.point.vo.PointHistoryVO;
import com.cp.user.point.vo.PointVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/point/*")
@Slf4j
public class PointController {

	@Setter(onMethod_ = @Autowired)
	private PointService pointService;

	/********************************************
	 * 주문화면 구현
	 * 
	 *******************************************/

	@GetMapping("/history")
	public String pointHistory(@ModelAttribute PointHistoryVO phvo, Model model, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String member_id = member.getMember_id();

		phvo.setMember_id(member_id);
		List<PointHistoryVO> pointHistoryInfo = pointService.pointHistoryList(phvo);
		model.addAttribute("pointHistoryInfo", pointHistoryInfo);

		int total = pointService.pointListCnt(phvo);
		model.addAttribute("pageMaker", new PageDTO(phvo, total));

		PointVO pvo = new PointVO();
		pvo.setMember_id(member_id);
		PointVO pointInfo = pointService.pointInfo(pvo);
		model.addAttribute("pointInfo", pointInfo);
		return "mypage/pointHistory";
	}

}
