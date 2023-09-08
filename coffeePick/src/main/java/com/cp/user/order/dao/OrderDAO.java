package com.cp.user.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.order.vo.OrderVO;

@Mapper
public interface OrderDAO {
	public List<OrderVO> orderList(OrderVO ovo);
}
