package com.cp.user.order.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.vo.OrderVO;

@Mapper
public interface OrderDAO {
	public MemberVO memberInfo(MemberVO mvo);

	public int orderHistoryInsert(OrderVO ovo);

	public OrderVO orderInfo(OrderVO ovo);
}
