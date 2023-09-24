package com.cp.user.pickmoney.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.service.OrderService;
import com.cp.user.pickmoney.service.PickmoneyService;
import com.cp.user.pickmoney.vo.PickmoneyHistoryVO;
import com.cp.user.pickmoney.vo.PickmoneyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/pickmoney/*")
@Slf4j
public class PickmoneyController {

	@Setter(onMethod_ = @Autowired)
	private PickmoneyService pickmoneyService;

	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;

	/*******************
	 * 픽머니 충전
	 *********************/
	@GetMapping("/charge")
	public String pickmoneyCharge(Model model, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String member_id = member.getMember_id();
		MemberVO mvo = new MemberVO();
		mvo.setMember_id(member_id);
		MemberVO memberInfo = orderService.memberInfo(mvo);

		model.addAttribute("memberInfo", memberInfo);

		PickmoneyVO pvo = new PickmoneyVO();
		pvo.setMember_id(member_id);
		PickmoneyVO pickmoneyInfo = pickmoneyService.pickmoneyInfo(pvo);

		model.addAttribute("pickmoneyInfo", pickmoneyInfo);

		return "mypage/pickmoneyCharge";
	}

	/**********************
	 * 결제
	 ***********************/
	@PostMapping("/payMent")
	public String payMent(@RequestBody PaymentPickmoney paymentPickmoney, Model model, HttpSession session)
			throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String member_id = member.getMember_id();
		int amount = paymentPickmoney.getAmount();

		PickmoneyVO pvo = new PickmoneyVO();
		PickmoneyHistoryVO phvo = new PickmoneyHistoryVO();

		pvo.setMember_id(member_id);
		pvo.setPickmoney_total(amount);

		phvo.setPickmoney_history_amount(amount);
		phvo.setPickmoney_history_reason("I");
		phvo.setMember_id(member_id);
		pickmoneyService.pickmoneyUpdate(pvo);
		pickmoneyService.pickmoneyHistoryInsert(phvo);

		return "충전이 완료되었습니다.";
	}

}
