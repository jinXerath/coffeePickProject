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
		/*
		 * // 세션에서 사용자 ID 가져오기 String memberId = (String)
		 * session.getAttribute("userId"); // 세션에 저장된 사용자 ID의 속성 이름을 적절히 변경하세요
		 */

		phvo.setMember_id("user1");
		List<PointHistoryVO> pointHistoryInfo = pointService.pointHistoryList(phvo);
		model.addAttribute("pointHistoryInfo", pointHistoryInfo);

		int total = pointService.pointListCnt(phvo);
		model.addAttribute("pageMaker", new PageDTO(phvo, total));

		PointVO pvo = new PointVO();
		pvo.setMember_id("user1");
		PointVO pointInfo = pointService.pointInfo(pvo);
		model.addAttribute("pointInfo", pointInfo);
		return "mypage/pointHistory";
	}

}
