package com.cp.user.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cp.user.cart.controller.CartController;
import com.cp.user.cart.service.CartService;
import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.member.vo.MemberVO;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.order.service.OrderService;
import com.cp.user.order.vo.OrderDetailVO;
import com.cp.user.order.vo.OrderVO;
import com.cp.user.store.vo.StoreVO;
import com.spring.common.vo.PageDTO;

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

	@PostMapping("/payMent")
	public void payMent(@RequestBody PaymentRequest paymentRequest, Model model) throws Exception {
		// paymentRequest 객체를 사용하여 요청 데이터를 처리합니다.
		String merchant_uid = paymentRequest.getMerchant_uid();
		int basicPrice = paymentRequest.getBasicPrice();
		int usePoint = paymentRequest.getUsePoint();
		int totalPrice = basicPrice - usePoint;
		String request = paymentRequest.getRequest();
		int method = paymentRequest.getMethod();
		String storeName = paymentRequest.getStoreName();
		String storePhone = paymentRequest.getStorePhone();
		String storeAddr = paymentRequest.getStoreAddr();

		// 받아온값을 출력하여확인합니다
		log.info("결제 성공");
		log.info("merchant_uid : " + merchant_uid);
		log.info("포인트사용전금액 : " + basicPrice);
		log.info("사용포인트 : " + usePoint);
		log.info("결제 금액:" + totalPrice);
		log.info("요청사항:" + request);
		log.info("결제수단:" + method);
		log.info("매장명:" + storeName);
		log.info("매장번호:" + storePhone);
		log.info("매장주소:" + storeAddr);

		// ovo에 객체를담슴니다.
		OrderVO ovo = new OrderVO();
		ovo.setOrder_no(merchant_uid);
		ovo.setOrder_basic_price(basicPrice);
		ovo.setOrder_use_point(usePoint);
		ovo.setOrder_total_price(totalPrice);
		ovo.setOrder_request(request);
		ovo.setOrder_method(method);
		ovo.setOrder_store_name(storeName);
		ovo.setOrder_store_phone(storePhone);
		ovo.setOrder_store_addr(storeAddr);
		ovo.setOrder_charge_point(0);// 나중에
		ovo.setOrder_use_pickmoney(0);// 나중에
		ovo.setMember_id("user1");
		ovo.setStore_id("store1");

		int orderInfo = orderService.orderHistoryInsert(ovo);

		if (orderInfo == 1) {
			log.info("Order_history Insert성공 ");
		} else {
			log.info("실패");
		}

		List<OrderDetail> order_detail = paymentRequest.getOrder_detail();

		for (OrderDetail detail : order_detail) {
			log.info("상품명: " + detail.getName());
			log.info("수량: " + detail.getQuantity());
			log.info("가격: " + detail.getAmount());

			OrderDetailVO odvo = new OrderDetailVO();
			odvo.setOrder_detail_menu_name(detail.getName());
			odvo.setOrder_detail_menu_count(detail.getQuantity());
			odvo.setOrder_detail_menu_price(detail.getAmount());
			odvo.setOrder_no(merchant_uid);

			int orderDetailInfo = orderService.orderDetailInsert(odvo);

			if (orderDetailInfo == 1) {
				log.info("Order_detail Insert성공 ");
			} else {
				log.info("실패");
			}

		}
	}

	/*******************
	 * 주문 - 결제완료 후 창 실행
	 *********************/
	@GetMapping("/orderEnd")
	public String orderEnd(@RequestParam("merchant_uid") String merchant_uid, Model model, HttpSession session) {

		OrderVO orderVO = new OrderVO();
		orderVO.setOrder_no(merchant_uid);
		OrderVO orderInfo = orderService.orderInfo(orderVO);
		model.addAttribute("orderInfo", orderInfo);

		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setOrder_no(orderVO.getOrder_no());
		List<OrderDetailVO> orderDetailInfo = orderService.orderDetailInfo(orderDetailVO);
		model.addAttribute("orderDetailInfo", orderDetailInfo);

		return "memberService/orderEnd";
	}

	@ResponseBody
	@GetMapping("/orderUpdate")
	public int orderUpdate(@RequestParam("merchant_uid") String merchant_uid, Model model, HttpSession session) {

		OrderVO orderVO = new OrderVO();
		orderVO.setOrder_no(merchant_uid);
		OrderVO order = orderService.orderInfo(orderVO);

		return order.getOrder_status();

	}

	/**********************
	 * 주문내역
	 */
	@GetMapping("/orderList")
	public String orderList(@ModelAttribute OrderVO ovo, Model model, HttpSession session) {

		OrderVO orderVO = new OrderVO();
		/* 세션에서 아이디 받아오기 */
		orderVO.setMember_id("user1");
		List<OrderVO> orderList = orderService.orderList(orderVO);
		model.addAttribute("orderList", orderList);

		int total = orderService.orderListCnt(orderVO);
		model.addAttribute("pageMaker", new PageDTO(ovo, total));

		return "memberService/orderList";
	}
}
