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

@Service
@Slf4j
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

}
