//package com.cp.user.order.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.cp.user.order.service.OrderService;
//import com.cp.user.order.vo.OrderDetailVO;
//import com.cp.user.order.vo.OrderVO;
//
//import lombok.Setter;
//import lombok.extern.slf4j.Slf4j;
//
//
//@Controller
//@RequestMapping("/order/*")
//@Slf4j
//public class StoreOrderController {
//	
//	@Setter(onMethod_ = @Autowired)
//	private OrderService orderService;
//	
//	// 진환 스토어 
//	
//	//  매장의 주문상세조회(모달로) 메소드 
//	@GetMapping("/store/orderDetail")
//	public String orderDetailRead(@ModelAttribute OrderVO ovo, Model model) {
//		log.info("모달좀 뜨게하라~");
//		log.info(ovo.getOrder_no());
//		OrderDetailVO orderDetailVO = new OrderDetailVO();
//		orderDetailVO.setOrder_no(ovo.getOrder_no());
//		log.info(ovo.getOrder_no());
//		List<OrderDetailVO> orderDetailInfo = orderService.orderDetailInfo(orderDetailVO);
//		
//		model.addAttribute("orderDetailInfo", orderDetailInfo);
//		
//		return "corpService/order/storeOrderDetail";
//	}
//	
//	// 주문접수 대기창 호출 메소드
//	@GetMapping("/store/orderReceive")
//	public String orderList(@ModelAttribute OrderVO ovo, Model model, HttpSession session) {
//		log.info("주문접수대기 페이지 호출");
//		
//		
//		List<OrderVO> orderList = orderService.orderReceiveList(ovo);
//		
//		model.addAttribute("orderList", orderList);
//		
//		return "/corpService/order/orderReceiveList";
//		 
//	}
//	
//	// 주문 처리중 페이지 호출 메소드
//	@GetMapping("/store/orderProcess")
//	public String orderProcess(@ModelAttribute OrderVO ovo, Model model, HttpSession session) {
//		log.info("주문 처리중 페이지 호출");
//
//		
//		List<OrderVO> orderProcessList = orderService.orderProcessList(ovo);
//		model.addAttribute("orderProcessList", orderProcessList);
//		
//		return "/corpService/order/orderProcessList";
//		
//	}
//	
//	// 주문처리내역 페이지 호출 메소드
//	@GetMapping("/store/orderProcessComplete")
//	public String orderProcessComplete(@ModelAttribute OrderVO ovo, Model model, HttpSession session) {
//		log.info("주문처리내역 페이지 호출");
//
//		
//		List<OrderVO> orderProcessCompleteList = orderService.orderProcessCompleteList(ovo);
//		model.addAttribute("orderProcessCompleteList", orderProcessCompleteList);
//		
//		return "/corpService/order/orderProcessCompleteList";
//		
//	}
//	
//	// 주문 수락시 호출 메소드
//	@PostMapping("/store/orderAccept")
//	public String orderAccept(@ModelAttribute OrderVO ovo ,Model model, HttpSession session, RedirectAttributes ras) throws Exception{
//		log.info("주문수락시 처리할 메소드(주문상태 업데이트하고 주문처리중페이지로 보내버리기)");
//		
//		log.info("order_no" + ovo.getOrder_no());
//		
//		
//		int result = 0;
//		result = orderService.orderAccept(ovo);
//		log.info("result : " + result);
//		String url = "";  //성공시
//		if(result == 1) {
//			url = "/order/store/orderReceive";
//		} else {
//			ras.addFlashAttribute("errorMsg", "주문수락 과정에서 문제가 발생하였습니다.");			
//			url = "/corpService/order/orderReceive";
//		}
//		
//		return "redirect:" + url;
//		
//	}
//	
//	// 주문 거절시 호출 메소드
//	@PostMapping("/store/orderCancel")
//	public String orderCancel(@ModelAttribute OrderVO ovo ,Model model, HttpSession session, RedirectAttributes ras) throws Exception {
//		log.info("주문거절시 처리할 메소드");
//		
//		int result = 0;
//		result = orderService.orderCancel(ovo);
//		log.info("result : " + result);
//		String url = "";
//		if(result == 1) {
//			url = "/order/store/orderReceive";
//		} else {
//			ras.addFlashAttribute("errorMsg", "주문취소 과정에서 문제가 발생하였습니다.");
//			url = "/order/store/orderReceive";
//		}
//		return "redirect:" + url;
//	}	
//
//	// 주문 제조완료시 호출 메소드
//	@PostMapping("/store/orderComplete")
//	public String orderComplete(@ModelAttribute OrderVO ovo ,Model model, HttpSession session, RedirectAttributes ras) throws Exception {
//		log.info("제조완료시 처리할 메소드");
//		
//		int result = 0;
//		result = orderService.orderComplete(ovo);
//		
//		String url = "";
//		if(result == 1) {
//			url = "/order/store/orderProcess";
//		} else {
//			ras.addFlashAttribute("errorMsg", "주문완료 과정에서 문제가 발생하였습니다.");
//			url = "/order/store/orderProcess";
//		}
//		
//		return "redirect:" + url;
//	}
//	
//	// 픽업완료 버튼 클릭시 호출 메소드
//	@PostMapping("/store/pickUpComplete")
//	public String pickUpComplete(@ModelAttribute OrderVO ovo, Model model, HttpSession session, RedirectAttributes ras) throws Exception {
//		log.info("픽업완료시 처리할 메소드");
//		
//		int result = 0;
//		result = orderService.pickUpComplete(ovo);
//		String url = "";
//		if(result == 1) {
//			url = "/order/store/orderProcess";
//		} else {
//			ras.addFlashAttribute("errorMsg", "픽업완료 과정에서 문제가 발생하였습니다.");
//			url = "/order/store/orderProcess";
//		}
//		return "redirect:" + url;
//	}
//}
