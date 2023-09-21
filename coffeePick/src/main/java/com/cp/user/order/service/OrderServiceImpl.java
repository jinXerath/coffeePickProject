package com.cp.user.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.dao.OrderDAO;
import com.cp.user.order.vo.OrderDetailVO;
import com.cp.user.order.vo.OrderVO;

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
	
	@Override
	public OrderVO dailySales(OrderVO ovo) {
		
		return orderDAO.dailySales(ovo);
	}
	
	@Override
	public Integer periodSales(OrderVO ovo) {
		
		return orderDAO.periodSales(ovo);
	}
	
	@Override
	public List<OrderVO> orderMenuDetailSales(OrderVO ovo) {
		
		return orderDAO.orderMenuDetailSales(ovo);
	}
			
}
