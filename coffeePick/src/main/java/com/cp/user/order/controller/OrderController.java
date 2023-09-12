package com.cp.user.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.user.cart.controller.CartController;
import com.cp.user.cart.service.CartService;
import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.member.vo.MemberVO;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.order.service.OrderService;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/order/*")
@Slf4j
public class OrderController {
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	@Autowired
	private CartController cartController;

	/********************************************
	 * 주문화면 구현
	 * 
	 *******************************************/

	@GetMapping("/main")
	public String processOrder(Model model, HttpSession session) {
		String member_id = "user1"; // 임시로 사용자 ID 설정

		CartVO cartInfo = cartController.getCartInfo(member_id);
		List<CartDetailVO> cartDetailList = cartController.getCartDetailList(cartInfo);
		List<MenuVO> menuList = cartController.getMenuList(cartDetailList);
		List<StoreVO> storeList = cartController.getStoreList(menuList);

		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(member_id);
		MemberVO memberInfo = orderService.memberInfo(memberVO);

		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("cartInfo", cartInfo);
		model.addAttribute("cartDetailList", cartDetailList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("storeList", storeList);

		return "memberService/order";
	}

	@GetMapping("/orderEnd")
	public String orderEnd() {
		return "memberService/orderEnd";
	}

	@PostMapping("/paymentComplete")
	public String paymentComplete() {
		return "memberService/orderEnd";
	}
}
