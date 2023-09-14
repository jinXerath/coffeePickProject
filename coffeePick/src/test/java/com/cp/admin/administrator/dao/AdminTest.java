package com.cp.admin.administrator.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.admin.administrator.vo.AdminVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class AdminTest {
	
	@Setter(onMethod_= @Autowired)
	private AdminDAO adminDAO;
	
	/*
	@Test
	public void testAdminInsert() {
		AdminVO avo = new AdminVO();
		avo.setAdmin_id("123");
		avo.setAdmin_pw("123");
		avo.setAdmin_name("배준영");
		avo.setAdmin_phone("010-1234-1234");
		avo.setAdmin_email("qwer1234@gmail.com");
		avo.setAdmin_authority("S");
		
		int result = adminDAO.adminInsert(avo);
		log.info("result : "+result);
	}
	*/
	
	@Test
	public void testAdminLogin() {
		AdminVO avo = new AdminVO();
		avo.setAdmin_id("123");
		avo.setAdmin_pw("123");
		
		AdminVO result = adminDAO.adminLogin(avo);
		log.info(result.toString());
	}
}
