package com.cp.user.order.service;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.vo.OrderVO;

public interface OrderService {
	MemberVO memberInfo(MemberVO mvo);

	public int orderHistoryInsert(OrderVO ovo);

	public OrderVO orderInfo(OrderVO ovo);
}
