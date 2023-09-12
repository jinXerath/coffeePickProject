package com.cp.user.order.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class OrderTests {
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDAO;

	@Test
	public void storeListTest() {
		MemberVO mvo = new MemberVO();
		mvo.setMember_id("user1");

		MemberVO list = orderDAO.memberInfo(mvo);

		log.info(toString().valueOf(list));
	}

}
