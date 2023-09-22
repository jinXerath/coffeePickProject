package com.cp.user.cart.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cp.user.cart.service.CartService;
import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cart/*")
@Slf4j
public class CartController {
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;

	/********************************************
	 * 장바구니 이동후 member_id로 장바구니 화면 구현
	 *******************************************/
	@GetMapping("/list")
	public String viewCart(Model model, String member_id2) {
		/*
		 * // 세션에서 현재 로그인한 사용자의 member_id를 가져옵니다. String member_id = (String)
		 * session.getAttribute("member_id"); if (member_id == null) { // 사용자가 로그인하지 않은
		 * 경우에 대한 처리 // 예: 로그인 페이지로 리다이렉트 또는 오류 메시지 표시 return "redirect:/"; // 로그인 페이지로
		 * 리다이렉트 }
		 */

		String member_id = "user1"; // 임시로 사용자 ID 설정

		CartVO cartInfo = getCartInfo(member_id);
		List<CartDetailVO> cartDetailList = getCartDetailList(cartInfo);
		List<MenuVO> menuList = getMenuList(cartDetailList);
		List<StoreVO> storeList = getStoreList(menuList);

		model.addAttribute("cartInfo", cartInfo);
		model.addAttribute("cartDetailList", cartDetailList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("storeList", storeList);

		return "memberService/order/cart";
	}

	/********************************************
	 * 임시 메뉴리스트 이동
	 *******************************************/
	@GetMapping("/menuList")
	public String viewMenuList() {

		return "memberService/order-store-menu"; // 장바구니 페이지로 이동
	}

	/********************************************
	 * 메뉴 수량 업데이트
	 *******************************************/
	@GetMapping("/updateQuantity")
	@ResponseBody
	public String updateMenuQuantity(@RequestParam("cartDetailNo") int cartDetailNo,
			@RequestParam("cartDetailMenuQuantity") int cartDetailMenuQuantity) {
		CartDetailVO cvo = new CartDetailVO();
		cvo.setCart_detail_no(cartDetailNo);
		cvo.setCart_detail_menu_quantity(cartDetailMenuQuantity);

		cartService.updateMenuQuantity(cvo);

		// 리다이렉트 경로를 직접 지정해야 하므로, 클라이언트에게 리다이렉트 URL을 전달합니다.
		return "redirect:/memberService/cart";
	}

	/********************************************
	 * 장바구니 메뉴 삭제
	 *******************************************/
	@PostMapping("/deleteCartItem")
	public ResponseEntity<String> deleteCartItem(@RequestParam("cartDetailNo") int cartDetailNo) {
		try {
			// 삭제할 항목의 정보를 CartDetailVO 객체에 설정
			CartDetailVO cvo = new CartDetailVO();
			cvo.setCart_detail_no(cartDetailNo);

			// 서비스 메서드 호출
			cartService.deleteCartItem(cvo);

			// 삭제 성공 시 클라이언트에게 성공 응답을 보내고 삭제된 항목의 ID를 반환
			return ResponseEntity.ok(Integer.toString(cartDetailNo));
		} catch (Exception e) {
			// 삭제 실패 시 에러 응답 반환
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("항목 삭제 중 오류가 발생했습니다.");
		}
	}

	/*****************************************
	 * 데이터 SELECT문
	 ************************************/
	/* member_id로 장바구니 테이블 검색 */
	public CartVO getCartInfo(String member_id) {
		CartVO cartVO = new CartVO();
		cartVO.setMember_id(member_id);
		return cartService.cartIdSearch(cartVO);
	}

	/* cart_id 로 장바구니상세 테이블검색 */
	public List<CartDetailVO> getCartDetailList(CartVO cartInfo) {
		CartDetailVO cartDetailVO = new CartDetailVO();
		cartDetailVO.setCart_id(cartInfo.getCart_id());
		return cartService.cartDetailList(cartDetailVO);
	}

	/* menu_no로 메뉴 테이블 검색 */
	public List<MenuVO> getMenuList(List<CartDetailVO> cartDetailList) {
		List<MenuVO> menuList = new ArrayList<>();

		for (CartDetailVO cartDetail : cartDetailList) {
			MenuVO menuVO = new MenuVO();
			menuVO.setMenu_no(cartDetail.getMenu_no());

			MenuVO menuInfo = cartService.menuList(menuVO).get(0); // getMenuInfo()는 실제 메서드명으로 대체

			menuList.add(menuInfo);
		}

		return menuList;
	}

	/* store_id로 매장 테이블 검색 */
	public List<StoreVO> getStoreList(List<MenuVO> menuList) {
		List<StoreVO> storeList = new ArrayList<>();

		for (MenuVO menu : menuList) {
			StoreVO storeVO = new StoreVO();
			storeVO.setStore_id(menu.getStore_id());

			StoreVO storeInfo = cartService.storeListSearch(storeVO).get(0);

			storeList.add(storeInfo);
		}

		return storeList;
	}

	/********************************************
	 * 장바구니 추가
	 *******************************************/
	@PostMapping("/cartInsert")
	public String cartInsert(@RequestBody Map<String, Integer> requestBody, HttpSession httpSession) {
		/* 세션 받아오기 */
		String userId = "user1";

		int menu_no = requestBody.get("menu_no"); // 요청 본문에서 'menu_no' 값을 가져옴
		log.info("menu_no: " + menu_no);

		CartVO cvo = new CartVO();
		cvo.setMember_id(userId);
		CartVO cartVO = cartService.cartIdSearch(cvo);
		String cartId = cartVO.getCart_id();

		CartDetailVO cdvo = new CartDetailVO();
		cdvo.setCart_id(cartId);
		cdvo.setMenu_no(menu_no);
		cartService.cartInsert(cdvo);

		return "장바구니 담기 성공"; // 장바구니 페이지로 이동
	}

}
