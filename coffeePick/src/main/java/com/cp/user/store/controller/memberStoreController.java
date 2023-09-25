package com.cp.user.store.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cp.common.vo.PageDTO;
import com.cp.user.cart.controller.CartController;
import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.member.vo.MemberVO;
import com.cp.user.menu.service.MenuService;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.order.service.OrderService;
import com.cp.user.store.service.StoreService;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/order/*")
@Slf4j
public class memberStoreController {

	@Setter(onMethod_ = @Autowired)
	private StoreService storeService;

	@Setter(onMethod_ = @Autowired)
	private MenuService menuService;

	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Autowired
	private CartController cartController;
	
	
	@GetMapping("/storeList")
	public String storeList(@ModelAttribute StoreVO svo, Model model) {
		svo.setAmount(12);

		log.info("storeList호출 성공");
		// 전체 레코드 조회
		List<StoreVO> storeList = storeService.storeList(svo);
		model.addAttribute("storeList", storeList);

		// 전체 레코드수 반환.
		int total = storeService.storeListCnt(svo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(svo, total));

		return "memberService/order/storeList"; // WEB-INF/views/memberService/order/storeList
	}

	// 매장 메뉴 리스트 조회
	@GetMapping("/storeDetailMenu")
	
	
	public String storeDetailMenu(@ModelAttribute MenuVO mvo, @RequestParam("store_id") String store_id,HttpSession session, Model model) {
		log.info("storeDetailMenu 호출 성공");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String member_id = member.getMember_id();
		
		List<MenuVO> menuList = menuService.menuList(mvo);
		model.addAttribute("menuList", menuList);

		StoreVO storeDetail = storeService.storeDetail(store_id);
		model.addAttribute("storeDetail", Arrays.asList(storeDetail));
		model.addAttribute("store_addr", storeDetail.getStore_addr()); // 주소 정보를 추가
		model.addAttribute("store_name", storeDetail.getStore_name()); // 매장명 추가

		model.addAttribute("store_id", store_id);


		CartVO cartInfo = cartController.getCartInfo(member_id);
		List<CartDetailVO> cartDetailList = cartController.getCartDetailList(cartInfo);
		List<MenuVO> cartmenuList = cartController.getMenuList(cartDetailList);
		List<StoreVO> cartstoreList = cartController.getStoreList(cartmenuList);

		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(member_id);
		MemberVO memberInfo = orderService.memberInfo(memberVO);

		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("cartInfo", cartInfo);
		model.addAttribute("cartDetailList", cartDetailList);
		model.addAttribute("cartmenuList", cartmenuList);
		model.addAttribute("cartstoreList", cartstoreList);

		return "memberService/order/storeDetailMenu";
	}

	@GetMapping("/storeDetailInfo")
	public String storeDetailInfo(@ModelAttribute MenuVO mvo, @RequestParam("store_id") String store_id, Model model) {
		log.info("storeDetailInfo 호출 성공");

		StoreVO storeDetail = storeService.storeDetail(store_id);
		model.addAttribute("storeDetail", Arrays.asList(storeDetail));

		model.addAttribute("storeId", store_id);
		return "memberService/order/storeDetailInfo";
	}
}
