package com.cp.user.order.service;

import java.util.List;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.vo.OrderDetailVO;
import com.cp.user.order.vo.OrderVO;

public interface OrderService {
	MemberVO memberInfo(MemberVO mvo);

	public int orderHistoryInsert(OrderVO ovo);

	public OrderVO orderInfo(OrderVO ovo);

	public int orderDetailInsert(OrderDetailVO odvo);

	public List<OrderDetailVO> orderDetailInfo(OrderDetailVO odvo);

	public List<OrderVO> orderList(OrderVO ovo);

	public int orderListCnt(OrderVO ovo);

	public int orderStatusCount();

	
	public List<OrderVO> orderReceiveList(OrderVO ovo);
	
	public List<OrderVO> orderProcessList(OrderVO ovo);
	
	public List<OrderVO> orderProcessCompleteList(OrderVO ovo);
	
	// 주문 수락시 주문상태 2 = '제조중' 으로 업데이트
	public int orderAccept(OrderVO ovo) throws Exception;
	
	public int orderComplete(OrderVO ovo) throws Exception;
	
	public int orderCancel(OrderVO ovo) throws Exception;
	
	public int pickUpComplete(OrderVO ovo) throws Exception;
	
	public OrderVO dailySales(OrderVO ovo);
	
	public Integer periodSales(OrderVO ovo);
	
	public List<OrderVO> orderMenuDetailSales(OrderVO ovo);
}
