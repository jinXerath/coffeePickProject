package com.cp.user.order.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.order.vo.OrderVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
/*
@Slf4j
@SpringBootTest
public class OrderTests {
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDAO;

	/*
	 * @Test public void storeListTest() { MemberVO mvo = new MemberVO();
	 * mvo.setMember_id("user1");
	 * 
	 * MemberVO list = orderDAO.memberInfo(mvo);
	 * 
	 * log.info(toString().valueOf(list)); }
	 */
	/*
	 * @Test public void orderHistoryInsertTest() { OrderVO ovo = new OrderVO();
	 * ovo.setOrder_no("user1"); ovo.setOrder_basic_price(1000);
	 * ovo.setOrder_use_point(100); ovo.setOrder_total_price(900);
	 * ovo.setOrder_request("안녕하세요"); ovo.setOrder_status(1);
	 * ovo.setOrder_method(1); ovo.setOrder_store_name("Store3");
	 * ovo.setOrder_store_phone("010-1234-5678"); ovo.setOrder_store_addr("강남구역삼동");
	 * ovo.setMember_id("user1"); ovo.setStore_id("store1");
	 * 
	 * int orderInfo = orderDAO.orderHistoryInsert(ovo);
	 * 
	 * log.info(toString().valueOf(orderInfo)); }
	 */
	/*
	 * @Test public void OrderListTest() { OrderVO ovo = new OrderVO();
	 * ovo.setOrder_no("order_171444133");
	 * 
	 * OrderVO list = orderDAO.orderInfo(ovo);
	 * 
	 * log.info(toString().valueOf(list)); }
	 */
	/*
	 * @Test public void orderDetailInsertTest() { OrderDetailVO odvo = new
	 * OrderDetailVO(); odvo.setOrder_detail_no(4);
	 * odvo.setOrder_detail_menu_name("아메리카노"); odvo.setOrder_detail_menu_count(4);
	 * odvo.setOrder_detail_menu_price(2000); odvo.setOrder_no("order_182224883");
	 * 
	 * int orderDetailInfo = orderDAO.orderDetailInsert(odvo);
	 * 
	 * log.info(toString().valueOf(orderDetailInfo)); }
	 */
	/*
	 * @Test public void orderDetailListTest() { OrderDetailVO odvo = new
	 * OrderDetailVO(); odvo.setOrder_no("order_977889");
	 * 
	 * List<OrderDetailVO> list = orderDAO.orderDetailInfo(odvo);
	 * 
	 * for (OrderDetailVO vo : list) { log.info(vo.toString()); } }
	 */

	/*
	 * @Test public void orderDetailListTest() { OrderVO ovo = new OrderVO();
	 * ovo.setMember_id("user1"); List<OrderVO> list = orderDAO.orderList(ovo);
	 * 
	 * for (OrderVO vo : list) { log.info(vo.toString()); } }
	 */

//	@Test
//	public void testGetOrderList() {
//		OrderVO order = new OrderVO();
//		order.setPageNum(1);
//		order.setMember_id("user1");
//		order.setKeyword("Coffee Shop");
//		List<OrderVO> orderList = orderDAO.orderList(order);
//	public void orderDetailListTest() {
//		OrderDetailVO odvo = new OrderDetailVO();
//		odvo.setOrder_no("order_977889");
//		odvo.setOrder_no("order2");
//
//		for (OrderVO o : orderList) {
//			System.out.println(o.toString());
//		}
//	}*/

	/*
	 * @Test public void testGetOrderListCount() { OrderVO order = new OrderVO();
	 * order.setMember_id("user1"); // 회원 ID 설정 order.setSearch("order_store_name");
	 * // 검색 조건 설정 order.setKeyword("Coffee Shop"); // 검색 키워드 설정
	 * 
	 * int count = orderDAO.orderListCnt(order); System.out.println("Total Orders: "
	 * + count); }
	 */
//}
