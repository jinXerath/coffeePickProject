package com.cp.user.member.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class MemberDaoTests {
	
	@Setter(onMethod_=@Autowired)
	private MemberDAO memberDao;
	
//	@Test
//	public void testMemberList() {
//		log.info("test");
//		List<MemberVO> list = memberDao.memberList();
//		
//		for(MemberVO vo : list) {
//			log.info(vo.toString());
//		}
//		
//	}
	
	@Test
	public void testMemberStatus() {
		MemberVO mvo = new MemberVO();
		mvo.setMember_status("N");
		mvo.setMember_id("user1");
		
		int count= memberDao.memberStatus(mvo);
		log.info("수정된 행의 수: "+ count);
	}
	
}
