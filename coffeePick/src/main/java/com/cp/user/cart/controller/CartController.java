package com.cp.user.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cp.user.cart.service.CartService;
import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;

import com.cp.user.menu.vo.MenuVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cart/*")
@Slf4j
public class CartController {
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	

	/********************************************
	 * 장바구니 이동
	 * 일단 한곳에 떄려박앗는데 각 불러오는것을 메서드형식으로 만들어서 
	 * 불러올수있게하는게목표 
	 *******************************************/
	@GetMapping("/list")
	public String viewCart(Model model, HttpSession session) {
		/*
		 * // 세션에서 현재 로그인한 사용자의 member_id를 가져옵니다. String member_id = (String)
		 * session.getAttribute("member_id"); if (member_id == null) { // 사용자가 로그인하지 않은
		 * 경우에 대한 처리 // 예: 로그인 페이지로 리다이렉트 또는 오류 메시지 표시 return "redirect:/"; // 로그인 페이지로
		 * 리다이렉트 }
		 */

		// 임시로 user1을 사용하도록 설정
		String member_id = "user1";

		// member_id를 사용하여 장바구니 정보를 검색합니다.
		CartVO cartVO = new CartVO();
		cartVO.setMember_id(member_id);
		CartVO cartInfo = cartService.cartIdSearch(cartVO);

		// 모델에 장바구니 정보와 cart_id를 추가하여 뷰로 전달합니다.
		model.addAttribute("cartInfo", cartInfo);

		// 장바구니 상세 리스트
		CartDetailVO cartDetailVO = new CartDetailVO();
		cartDetailVO.setCart_id(cartInfo.getCart_id());
		List<CartDetailVO> cartDetailList = cartService.cartDetailList(cartDetailVO);

		model.addAttribute("cartDetailList", cartDetailList);

		// 메뉴 정보를 저장할 리스트를 생성합니다.
		List<MenuVO> menuList = new ArrayList<>();

		// cartDetailList를 순회하면서 각각의 CartDetailVO에서 menu_no를 가져와서 메뉴 정보를 검색합니다.
		for (CartDetailVO cartDetail : cartDetailList) {
			// 메뉴 정보를 검색하기 위한 MenuVO 객체를 생성합니다.
			MenuVO menuVO = new MenuVO();
			menuVO.setMenu_no(cartDetail.getMenu_no());

			// menuService를 사용하여 메뉴 정보를 가져옵니다.
			MenuVO menuInfo = cartService.menuList(menuVO).get(0); // getMenuInfo()는 예시일 수 있으므로 실제 메서드명으로 대체해야 합니다.

			// 가져온 메뉴 정보를 menuList에 추가합니다.
			menuList.add(menuInfo);
		}

		// 모델에 메뉴 정보를 추가하여 뷰로 전달합니다.
		model.addAttribute("menuList", menuList);
		
		

		return "memberService/cart"; // 장바구니 페이지로 이동
	}

}
