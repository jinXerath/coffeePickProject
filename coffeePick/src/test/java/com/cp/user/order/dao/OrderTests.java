package com.cp.user.order.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.order.vo.OrderVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

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

	@Test
	public void OrderListTest() {
		OrderVO ovo = new OrderVO();
		ovo.setOrder_no("order_171444133");

		OrderVO list = orderDAO.orderInfo(ovo);

		log.info(toString().valueOf(list));
	}

}
