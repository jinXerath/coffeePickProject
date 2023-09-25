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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cp.common.vo.PageDTO;
import com.cp.user.cart.controller.CartController;
import com.cp.user.cart.service.CartService;
import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.corp.vo.CorpVO;
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
import com.cp.user.store.service.StoreService;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/order/*")
@Slf4j
public class OrderController {
		@Setter(onMethod_ = @Autowired)
		private StoreService storeService;
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
	   public String processOrder(Model model, HttpSession httpSession) {

	      MemberVO memberLogin = (MemberVO) httpSession.getAttribute("member");
	      String member_id = memberLogin.getMember_id();

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
	      pvo.setMember_id(member_id);
	      PickmoneyVO pickmoneyInfo = pickmoneyService.pickmoneyInfo(pvo);

	      model.addAttribute("pickmoneyInfo", pickmoneyInfo);
	      model.addAttribute("memberInfo", memberInfo);
	      model.addAttribute("cartInfo", cartInfo);
	      model.addAttribute("cartDetailList", cartDetailList);
	      model.addAttribute("menuList", menuList);
	      model.addAttribute("storeList", storeList);
	      model.addAttribute("pointInfo", pointInfo);

	      return "memberService/order/order";
	   }

	   /**********************
	    * 결제
	    ***********************/
	   @PostMapping("/payMent")
	   public String payMent(@RequestBody PaymentRequest paymentRequest, Model model, HttpSession httpSession)
	         throws Exception {

		   
		   
	      /** 세션 멤버 아이디 적용 영역 */
	      MemberVO memberLogin = (MemberVO) httpSession.getAttribute("member");
	      String member_id = memberLogin.getMember_id();

	      // paymentRequest 객체를 사용하여 요청 데이터를 처리합니다.
	      String order_no = paymentRequest.getOrder_no();
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
	      log.info("order_no : " + order_no);
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

	      // ovo에 객체를담슴니다.
	      OrderVO ovo = new OrderVO();
	      ovo.setOrder_no(order_no);
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
	         odvo.setOrder_no(order_no);

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
	   public String pickmoneyPayMent(@RequestBody PaymentRequest paymentRequest, Model model, HttpSession httpSession)
	         throws Exception {

	      /** 세션 멤버 아이디 적용 영역 */
	      MemberVO memberLogin = (MemberVO) httpSession.getAttribute("member");
	      String member_id = memberLogin.getMember_id();

	      // paymentRequest 객체를 사용하여 요청 데이터를 처리합니다.
	      String order_no = paymentRequest.getOrder_no();
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
	      log.info("order_no : " + order_no);
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
	      ovo.setOrder_no(order_no);
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
	         odvo.setOrder_no(order_no);

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


	/*******************
	    * 주문 - 결제완료 후 창 실행
	    *********************/
	   @GetMapping("/orderDetail")
	   public String orderDetail(@RequestParam("order_no") String order_no, Model model, HttpSession session) {
		   
		   
		  MemberVO member = (MemberVO)session.getAttribute("member");
	      /** 세션 멤버 아이디 적용 영역 */
	      String member_id = member.getMember_id();

	      MemberVO memberVO = new MemberVO();
	      memberVO.setMember_id(member_id);
	      MemberVO memberInfo = orderService.memberInfo(memberVO);
	      model.addAttribute("memberInfo", memberInfo);

	      OrderVO orderVO = new OrderVO();
	      orderVO.setOrder_no(order_no);
	      OrderVO orderInfo = orderService.orderInfo(orderVO);
	      model.addAttribute("orderInfo", orderInfo);

	      OrderDetailVO orderDetailVO = new OrderDetailVO();
	      orderDetailVO.setOrder_no(orderVO.getOrder_no());
	      List<OrderDetailVO> orderDetailInfo = orderService.orderDetailInfo(orderDetailVO);
	      model.addAttribute("orderDetailInfo", orderDetailInfo);

	      return "memberService/order/orderDetail";
	   }

	   /**********************
	    * 주문상세 업데이트
	    ***********************/
	   @ResponseBody
	   @GetMapping("/orderUpdate")
	   public int orderUpdate(@RequestParam("order_no") String order_no, Model model, HttpSession session) {

	      OrderVO orderVO = new OrderVO();
	      orderVO.setOrder_no(order_no);
	      OrderVO order = orderService.orderInfo(orderVO);

	      
	      return order.getOrder_status();
	   }	
	   
	   /**********************
	    * 주문내역
	    ***********************/
	   @GetMapping("/orderHistory")
	   public String orderHistory(@ModelAttribute OrderVO ovo, Model model, HttpSession httpSession) {
		   
		   
		   MemberVO memberUser = (MemberVO) httpSession.getAttribute("member");//특정 필요한 세션객체 설정
	       if(memberUser == null) {
	        model.addAttribute("errorMsg","로그인이 필요한 서비스 입니다");
	        return "member/login/loginForm";
	
	       }
		   
		   /* 세션에서 아이디 받아오기 */
	      MemberVO memberLogin = (MemberVO) httpSession.getAttribute("member");
	      String member_id = memberLogin.getMember_id();

	      /* 주문 내역 */
	      ovo.setMember_id(member_id);

	      String keyword = ovo.getKeyword();
	      System.out.println("키워드: " + keyword);

	      List<OrderVO> orderList = orderService.orderList(ovo);
	      model.addAttribute("orderList", orderList);

	      int total = orderService.orderListCnt(ovo);
	      model.addAttribute("pageMaker", new PageDTO(ovo, total));

	      /* 주문 상태 개수 */
	      int orderStatusCnt = orderService.orderStatusCount();
	      model.addAttribute("orderStatusCnt", orderStatusCnt);

	      return "memberService/order/orderHistory";
	   }



	// 진환 스토어 
	
	//  매장의 주문상세조회(모달로) 메소드 
	@GetMapping("/store/orderDetail")
	@ResponseBody
	public List<OrderDetailVO> orderDetailRead(@ModelAttribute OrderVO ovo, Model model) {
		log.info("모달좀 뜨게하라~");
		log.info("order_no = " + ovo.getOrder_no());
		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setOrder_no(ovo.getOrder_no());
		List<OrderDetailVO> orderDetailInfo = orderService.orderDetailInfo(orderDetailVO);
		
		return orderDetailInfo;
	}
	
	// 주문접수 대기창 호출 메소드
	@GetMapping("/store/orderReceive")
	public String orderList( Model model, HttpSession session) {
		log.info("주문접수대기 페이지 호출");
		
		CorpVO corp =(CorpVO)session.getAttribute("corp");
		String corp_id=corp.getCorp_id();
		StoreVO storevo=new StoreVO();
		storevo.setCorp_id(corp_id);
		
		StoreVO svo=new StoreVO();
		svo= storeService.storeInfoRead(storevo);
		
		
		
		List<OrderVO> orderList = orderService.orderReceiveList(svo);
		
		model.addAttribute("orderList", orderList);
		
		return "corpService/order/orderReceiveList";
		 
	}
	
	@GetMapping("/store/getOrderReceive")
	@ResponseBody
	public List<OrderVO> getOrder( Model model, HttpSession session) {
		log.info("주문들어올떄마다 값 전송해줄 메소드 호출");
		CorpVO corp =(CorpVO)session.getAttribute("corp");
		String corp_id=corp.getCorp_id();
		StoreVO storevo=new StoreVO();
		storevo.setCorp_id(corp_id);
		
		StoreVO svo=new StoreVO();
		svo= storeService.storeInfoRead(storevo);
		
		List<OrderVO> orderList = orderService.orderReceiveList(svo);
		
		
		return orderList;
		 
	}	
	
	// 주문 처리중 페이지 호출 메소드
	@GetMapping("/store/orderProcess")
	public String orderProcess(Model model, HttpSession session) {
		log.info("주문 처리중 페이지 호출");
		CorpVO corp =(CorpVO)session.getAttribute("corp");
		String corp_id = corp.getCorp_id();
		StoreVO storevo = new StoreVO();
		storevo.setCorp_id(corp_id);
		
		StoreVO svo=new StoreVO();
		svo= storeService.storeInfoRead(storevo);
		
		List<OrderVO> orderProcessList = orderService.orderProcessList(svo);
		model.addAttribute("orderProcessList", orderProcessList);
		
		return "corpService/order/orderProcessList";
		
	}
	
	
	// 주문처리된 주문상세 페이지 호출 메소드
	@GetMapping("/store/orderCompleteDetail")
	public String orderCompleteDetail(OrderVO ovo,Model model, HttpSession session) {	
	    log.info("주문처리된 주문상세 페이지 호출");
	    log.info(ovo.getOrder_no());
	    OrderVO orderInfo = orderService.orderInfo(ovo);
	    model.addAttribute("orderInfo", orderInfo);
	    OrderDetailVO odvo = new OrderDetailVO(); 
	    odvo.setOrder_no(ovo.getOrder_no());
	    // 주문 상세 정보를 가져와 모델에 추가
	    List<OrderDetailVO> orderDetailInfo = orderService.orderDetailInfo(odvo);
	    model.addAttribute("orderDetailInfo", orderDetailInfo);
	
	    // 주문처리된 주문 상세 페이지 뷰로 이동
	    return "corpService/order/orderCompleteDetail";	
	}
	// 주문처리내역 페이지 호출 메소드
	@GetMapping("/store/orderProcessComplete")
	public String orderProcessComplete(Model model, HttpSession session) {
		log.info("주문처리내역 페이지 호출");
		CorpVO corp =(CorpVO)session.getAttribute("corp");
		String corp_id = corp.getCorp_id();
		StoreVO storevo = new StoreVO();
		storevo.setCorp_id(corp_id);
		
		StoreVO svo=new StoreVO();
		svo= storeService.storeInfoRead(storevo);
		
		List<OrderVO> orderProcessCompleteList = orderService.orderProcessCompleteList(svo);
		model.addAttribute("orderProcessCompleteList", orderProcessCompleteList);
		
		return "corpService/order/orderProcessCompleteList";
		
	}
	
	// 주문 수락시 호출 메소드
	@PostMapping("/store/orderAccept")
	public String orderAccept(@ModelAttribute OrderVO ovo ,Model model, HttpSession session, RedirectAttributes ras) throws Exception{
		log.info("주문수락시 처리할 메소드(주문상태 업데이트하고 주문처리중페이지로 보내버리기)");
		
		
		int result = 0;
		result = orderService.orderAccept(ovo);
		log.info("result : " + result);
		String url = "";  //성공시
		if(result == 1) {
			url = "/order/store/orderReceive";
		} else {
			ras.addFlashAttribute("errorMsg", "주문수락 과정에서 문제가 발생하였습니다.");			
			url = "corpService/order/orderReceive";
		}
		
		return "redirect:" + url;
		
	}
	
	// 주문 거절시 호출 메소드
	@PostMapping("/store/orderCancel")
	public String orderCancel(@ModelAttribute OrderVO ovo ,Model model, HttpSession session, RedirectAttributes ras) throws Exception {
		log.info("주문거절시 처리할 메소드");
		
		int result = 0;
		result = orderService.orderCancel(ovo);
		log.info("result : " + result);
		String url = "";
		if(result == 1) {
			url = "/order/store/orderReceive";
		} else {
			ras.addFlashAttribute("errorMsg", "주문취소 과정에서 문제가 발생하였습니다.");
			url = "/order/store/orderReceive";
		}
		return "redirect:" + url;
	}	

	// 주문 제조완료시 호출 메소드
	@PostMapping("/store/orderComplete")
	public String orderComplete(@ModelAttribute OrderVO ovo ,Model model, HttpSession session, RedirectAttributes ras) throws Exception {
		log.info("제조완료시 처리할 메소드");
		
		int result = 0;
		result = orderService.orderComplete(ovo);
		
		String url = "";
		if(result == 1) {
			url = "/order/store/orderProcess";
		} else {
			ras.addFlashAttribute("errorMsg", "주문완료 과정에서 문제가 발생하였습니다.");
			url = "/order/store/orderProcess";
		}
		
		return "redirect:" + url;
	}
	
	// 픽업완료 버튼 클릭시 호출 메소드
	@PostMapping("/store/pickUpComplete")
	public String pickUpComplete(@ModelAttribute OrderVO ovo, Model model, HttpSession session, RedirectAttributes ras) throws Exception {
		log.info("픽업완료시 처리할 메소드");
		
		int result = 0;
		result = orderService.pickUpComplete(ovo);
		String url = "";
		if(result == 1) {
			url = "/order/store/orderProcess";
		} else {
			ras.addFlashAttribute("errorMsg", "픽업완료 과정에서 문제가 발생하였습니다.");
			url = "/order/store/orderProcess";
		}
		return "redirect:" + url;
	}
    
}
