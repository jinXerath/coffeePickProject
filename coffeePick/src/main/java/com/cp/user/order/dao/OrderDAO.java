package com.cp.user.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.member.vo.MemberVO;
import com.cp.user.order.vo.OrderDetailVO;
import com.cp.user.order.vo.OrderVO;

@Mapper
public interface OrderDAO {
	public MemberVO memberInfo(MemberVO mvo);

	public int orderHistoryInsert(OrderVO ovo);

	public OrderVO orderInfo(OrderVO ovo);

	public int orderDetailInsert(OrderDetailVO odvo);

	public List<OrderDetailVO> orderDetailInfo(OrderDetailVO odvo);

	public List<OrderVO> orderList(OrderVO ovo);

	public int orderListCnt(OrderVO ovo);

	public int orderStatusCount();
	
	public List<OrderVO> orderReceiveList(OrderVO ovo);  // where order_status = 1
	 
	public List<OrderVO> orderProcessList(OrderVO ovo);  // where order_status = 2
	
	public List<OrderVO> orderProcessCompleteList(OrderVO ovo); // where order_status = 4 or 0
	
	public int orderAccept(OrderVO ovo); 	// order_status  2로 업데이트 
	 
	public int orderComplete(OrderVO ovo);  // order_status 3으로 업데이트
	
	public int orderCancel(OrderVO ovo);	// order_status 0으로 업데이트
	
	public int pickUpComplete(OrderVO ovo);	// order_status 4로 업데이트
	
	public OrderVO dailySales(OrderVO ovo);	// 일매출 조회 쿼리
	
	public Integer periodSales(OrderVO ovo); // 단위기간 매출 조회 쿼리
	
	public List<OrderVO> orderMenuDetailSales(OrderVO ovo); // 매출날짜에 따른 메뉴 매출량 조회.
	
}
