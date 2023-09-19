package com.cp.user.order.controller;

import java.util.ArrayList;
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
import com.cp.user.member.service.MemberService;
import com.cp.user.member.vo.MemberVO;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.order.service.OrderService;
import com.cp.user.order.vo.OrderDetailVO;
import com.cp.user.order.vo.OrderVO;
import com.cp.user.pickmoney.service.PickmoneyService;
import com.cp.user.pickmoney.vo.PickmoneyHistoryVO;
import com.cp.user.pickmoney.vo.PickmoneyVO;
import com.cp.user.point.service.PointService;
import com.cp.user.point.vo.PointHistoryVO;
import com.cp.user.point.vo.PointVO;
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
	private MemberService memberService;
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	@Setter(onMethod_ = @Autowired)
	private PointService pointService;
	@Setter(onMethod_ = @Autowired)
	private PickmoneyService pickmoneyService;
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

		PointVO pointVO = new PointVO();
		pointVO.setMember_id(member_id);
		PointVO pointInfo = pointService.pointInfo(pointVO);

		PickmoneyVO pvo = new PickmoneyVO();
		pvo.setMember_id("user1");
		PickmoneyVO pickmoneyInfo = pickmoneyService.pickmoneyInfo(pvo);

		model.addAttribute("pickmoneyInfo", pickmoneyInfo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("cartInfo", cartInfo);
		model.addAttribute("cartDetailList", cartDetailList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("storeList", storeList);
		model.addAttribute("pointInfo", pointInfo);

		return "memberService/order";
	}

	/**********************
	 * 결제
	 ***********************/
	@PostMapping("/payMent")
	public String payMent(@RequestBody PaymentRequest paymentRequest, Model model, HttpSession session)
			throws Exception {

		/** 세션 멤버 아이디 적용 영역 */
		String member_id = "user1";

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
		int chargePoint = paymentRequest.getChargePoint();
		int usePickmoney = paymentRequest.getUsePickmoney();
		String storeId = paymentRequest.getStoreId();

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
		ovo.setOrder_charge_point(chargePoint);
		ovo.setOrder_use_pickmoney(usePickmoney);
		ovo.setMember_id(member_id);
		ovo.setStore_id(storeId);

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

		/************* 포인트 영역 *******************/
		PointVO pointVO = new PointVO();
		PointHistoryVO pointHistoryVO = new PointHistoryVO();

		/* 포인트 적립 적용 */
		pointVO.setMember_id(member_id);
		pointVO.setPoint_total(chargePoint);
		pointHistoryVO.setPoint_history_amount(chargePoint);
		pointHistoryVO.setPoint_history_reason("I");
		pointHistoryVO.setMember_id(member_id);
		pointService.updatePoint(pointVO);
		pointService.pointHistoryInsert(pointHistoryVO);

		/* 포인트 사용 적용 */
		int minusUsePoint = -usePoint;
		pointVO.setPoint_total(minusUsePoint);
		pointHistoryVO.setPoint_history_amount(usePoint);
		pointHistoryVO.setPoint_history_reason("O");
		pointHistoryVO.setMember_id(member_id);
		pointService.updatePoint(pointVO);
		pointService.pointHistoryInsert(pointHistoryVO);
		/************* 포인트 영역 끝 ******************/

		/************* 장바구니 지우기 *******************/
		CartVO cartVO = new CartVO();
		cartVO.setMember_id(member_id);
		CartVO cartInfo = cartService.cartIdSearch(cartVO);

		CartDetailVO cartDetailVO = new CartDetailVO();
		cartDetailVO.setCart_id(cartInfo.getCart_id());
		cartService.cartDelete(cartDetailVO);

		/************* 장바구니 지우기 끝 *******************/

		return "결제완료";
	}

	/**********************
	 * 픽머니 결제
	 ***********************/
	@PostMapping("/pickmoneyPayment")
	public void pickmoneyPayMent(@RequestBody PaymentRequest paymentRequest, Model model, HttpSession session)
			throws Exception {

		/** 세션 멤버 아이디 적용 영역 */
		String member_id = "user1";

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
		int chargePoint = paymentRequest.getChargePoint();
		int usePickmoney = paymentRequest.getUsePickmoney();
		String storeId = paymentRequest.getStoreId();
		// 받아온값을 출력하여확인합니다
		log.info("결제 성공");
		log.info("merchant_uid : " + merchant_uid);
		log.info("포인트사용전금액 : " + basicPrice);
		log.info("사용포인트 : " + usePoint);
		log.info("결제 금액:" + totalPrice);
		log.info("적립포인트:" + chargePoint);
		log.info("요청사항:" + request);
		log.info("결제수단:" + method);
		log.info("매장명:" + storeName);
		log.info("매장번호:" + storePhone);
		log.info("매장주소:" + storeAddr);
		log.info("사용픽머니:" + usePickmoney);
		log.info("매장ID:" + storeId);
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
		ovo.setOrder_charge_point(chargePoint);
		ovo.setOrder_use_pickmoney(usePickmoney);
		ovo.setMember_id(member_id);
		ovo.setStore_id(storeId);

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

		/************* 포인트 영역 *******************/
		PointVO pointVO = new PointVO();
		PointHistoryVO pointHistoryVO = new PointHistoryVO();

		/* 포인트 적립 적용 */
		pointVO.setMember_id(member_id);
		pointVO.setPoint_total(chargePoint);
		pointHistoryVO.setPoint_history_amount(chargePoint);
		pointHistoryVO.setPoint_history_reason("I");
		pointHistoryVO.setMember_id(member_id);
		pointService.updatePoint(pointVO);
		pointService.pointHistoryInsert(pointHistoryVO);

		/* 포인트 사용 적용 */
		int minusUsePoint = -usePoint;
		pointVO.setPoint_total(minusUsePoint);
		pointHistoryVO.setPoint_history_amount(usePoint);
		pointHistoryVO.setPoint_history_reason("O");
		pointHistoryVO.setMember_id(member_id);
		pointService.updatePoint(pointVO);
		pointService.pointHistoryInsert(pointHistoryVO);
		/************* 포인트 영역 끝 ******************/

		/************* 픽머니 영역 ******************/
		PickmoneyVO pickmoneyVO = new PickmoneyVO();
		PickmoneyHistoryVO pickmoneyHistoryVO = new PickmoneyHistoryVO();

		/* 픽머니 사용 적용 */
		int minusUsePickmoney = -usePickmoney;
		pickmoneyVO.setMember_id(member_id);
		pickmoneyVO.setPickmoney_total(minusUsePickmoney);
		pickmoneyHistoryVO.setPickmoney_history_amount(usePickmoney);
		pickmoneyHistoryVO.setPickmoney_history_reason("O");
		pickmoneyHistoryVO.setMember_id(member_id);
		pickmoneyService.pickmoneyUpdate(pickmoneyVO);
		pickmoneyService.pickmoneyHistoryInsert(pickmoneyHistoryVO);
		/************* 픽머니 영역 끝 ******************/
	}

	/*******************
	 * 주문 - 결제완료 후 창 실행
	 *********************/
	@GetMapping("/orderEnd")
	public String orderEnd(@RequestParam("merchant_uid") String merchant_uid, Model model, HttpSession session) {

		/** 세션 멤버 아이디 적용 영역 */
		String member_id = "user1";

		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(member_id);
		MemberVO memberInfo = orderService.memberInfo(memberVO);
		model.addAttribute("memberInfo", memberInfo);

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

	/**********************
	 * 주문상세 업데이트
	 ***********************/
	@ResponseBody
	@GetMapping("/orderUpdate")
	public int orderUpdate(@RequestParam("merchant_uid") String merchant_uid, Model model, HttpSession session) {

		OrderVO orderVO = new OrderVO();
		orderVO.setOrder_no(merchant_uid);
		OrderVO order = orderService.orderInfo(orderVO);

		return order.getOrder_status();
	}

	@ResponseBody
	@GetMapping("/orderHistoryUpdate")
	public List<Integer> orderHistoryUpdate(Model model, HttpSession session) {
		/** 세션 멤버 아이디 적용 영역 */
		String member_id = "user1";

		OrderVO orderVO = new OrderVO();
		orderVO.setMember_id(member_id);
		List<OrderVO> orderList = orderService.orderList(orderVO);
		List<Integer> orderStatusList = new ArrayList<>();

		for (OrderVO order : orderList) {
			orderStatusList.add(order.getOrder_status());
		}

		return orderStatusList;
	}

	/**********************
	 * 주문내역
	 ***********************/
	@GetMapping("/orderList")
	public String orderList(@ModelAttribute OrderVO ovo, Model model, HttpSession session) {
		/* 세션에서 아이디 받아오기 */

		/* 주문 내역 */
		ovo.setMember_id("user1");

		String keyword = ovo.getKeyword();
		System.out.println("키워드: " + keyword);

		List<OrderVO> orderList = orderService.orderList(ovo);
		model.addAttribute("orderList", orderList);

		int total = orderService.orderListCnt(ovo);
		model.addAttribute("pageMaker", new PageDTO(ovo, total));

		/* 주문 상태 개수 */
		int orderStatusCnt = orderService.orderStatusCount();
		model.addAttribute("orderStatusCnt", orderStatusCnt);

		return "memberService/orderList";
	}
	/** 결제취소 */

}
