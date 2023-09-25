package com.cp.user.order.service;

import java.util.List;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.vo.OrderDetailVO;
import com.cp.user.order.vo.OrderVO;
import com.cp.user.store.vo.StoreVO;

public interface OrderService {
	MemberVO memberInfo(MemberVO mvo);

	public StoreVO storeInfo(StoreVO svo);
	
	public int orderHistoryInsert(OrderVO ovo);

	public OrderVO orderInfo(OrderVO ovo);

	public int orderDetailInsert(OrderDetailVO odvo);

	public List<OrderDetailVO> orderDetailInfo(OrderDetailVO odvo);

	public List<OrderVO> orderList(OrderVO ovo);

	public int orderListCnt(OrderVO ovo);

	public int orderStatusCount();

	
	public List<OrderVO> orderReceiveList(StoreVO svo);
	
	public List<OrderVO> orderProcessList(StoreVO svo);
	
	public List<OrderVO> orderProcessCompleteList(StoreVO svo);
	
	// 주문 수락시 주문상태 2 = '제조중' 으로 업데이트
	public int orderAccept(OrderVO ovo) throws Exception;
	
	public int orderComplete(OrderVO ovo) throws Exception;
	
	public int orderCancel(OrderVO ovo) throws Exception;
	
	public int pickUpComplete(OrderVO ovo) throws Exception;
	
	public List<OrderDetailVO> storeOrderDetailInfo(OrderDetailVO odvo);
}
