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

}
