package com.cp.user.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.dao.OrderDAO;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDAO;

	@Override
	public MemberVO memberInfo(MemberVO mvo) {
		return orderDAO.memberInfo(mvo);
	}

}
