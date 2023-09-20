package com.cp.user.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.dao.OrderDAO;
import com.cp.user.order.vo.OrderDetailVO;
import com.cp.user.order.vo.OrderVO;
import com.cp.user.order.vo.RefundVO;
import com.google.gson.JsonObject;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service

public class OrderServiceImpl implements OrderService {
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDAO;

	@Override
	public MemberVO memberInfo(MemberVO mvo) {
		return orderDAO.memberInfo(mvo);
	}

	@Override
	public int orderHistoryInsert(OrderVO ovo) {
		int result = 0;
		result = orderDAO.orderHistoryInsert(ovo);
		return result;
	}

	@Override
	public OrderVO orderInfo(OrderVO ovo) {
		return orderDAO.orderInfo(ovo);
	}

	@Override
	public int orderDetailInsert(OrderDetailVO odvo) {
		int result = 0;
		result = orderDAO.orderDetailInsert(odvo);
		return result;
	}

	@Override
	public List<OrderDetailVO> orderDetailInfo(OrderDetailVO odvo) {
		List<OrderDetailVO> list = null;
		list = orderDAO.orderDetailInfo(odvo);
		log.info(list.toString());
		return list;
	}

	@Override
	public List<OrderVO> orderList(OrderVO ovo) {
		List<OrderVO> list = null;
		list = orderDAO.orderList(ovo);
		return list;
	}

	@Override
	public int orderListCnt(OrderVO ovo) {
		return orderDAO.orderListCnt(ovo);
	}

	@Override
	public int orderStatusCount() {
		int result = 0;
		result = orderDAO.orderStatusCount();
		return result;
	}

	@Override
	public void Refund(RefundVO RefundVO, String token) {

		String cancelUrl = "https://api.iamport.kr/payments/cancel";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Authorization", token);

		RestTemplate restTemplate = new RestTemplate();

		JsonObject requestData = new JsonObject();
		requestData.addProperty("reason", RefundVO.getReason());
		requestData.addProperty("merchant_uid", RefundVO.getMerchant_uid());
		requestData.addProperty("imp_uid", "imp63623734");
		requestData.addProperty("amount", RefundVO.getCancel_request_amount());

		HttpEntity<String> requestEntity = new HttpEntity<>(requestData.toString(), headers);

		ResponseEntity<String> responseEntity = restTemplate.exchange(cancelUrl, HttpMethod.POST, requestEntity,
				String.class);
		if (responseEntity.getStatusCode().is2xxSuccessful()) {

			log.info("으어어어?");
			String responseData = responseEntity.getBody();
			log.info("responseData?" + responseData);
			// JSONObject responseJson = new JSONObject();
			// JSONObject response = responseJson.getJSONObject("response");
			// 처리 결과에 대한 작업 수행
		} else {
			// 요청 실패에 대한 작업 수행
		}
	}

	
	//진환 매장 주문접수대기 주문리스트 불러오는 메소드
	@Override
	public List<OrderVO> orderReceiveList(OrderVO ovo){
		List<OrderVO> list = null;
		list = orderDAO.orderReceiveList(ovo);
		return list;
	}
	
	@Override
	public List<OrderVO> orderProcessList(OrderVO ovo){
		List<OrderVO> list = null;
		list = orderDAO.orderProcessList(ovo);
		return list;
	}
	
	@Override
	public List<OrderVO> orderProcessCompleteList(OrderVO ovo){
		List<OrderVO> list = null;
		list = orderDAO.orderProcessCompleteList(ovo);
		return list;
	}
	
	// 주믄 수락 클릭시 실행. 
	@Override
	public int orderAccept(OrderVO ovo) throws Exception {
		int result = 0;
		result = orderDAO.orderAccept(ovo);
		return result;
	}
	
	// 주문거절 클릭시
	@Override
	public int orderCancel(OrderVO ovo) throws Exception {
		int result = 0;
		result = orderDAO.orderCancel(ovo);
		return result;
	}
	
	// 제조완료 버튼클릭시 '제조완료' 압데이트
	@Override
	public int orderComplete(OrderVO ovo) throws Exception {
		int result = 0;
		result = orderDAO.orderComplete(ovo);
		return result;
	}
	
	
	// 픽업완료 버튼 클릭시 'update status = 4'
	@Override
	public int pickUpComplete(OrderVO ovo) throws Exception {
		int result = 0;
		result = orderDAO.pickUpComplete(ovo);
		return result;
	}
}
