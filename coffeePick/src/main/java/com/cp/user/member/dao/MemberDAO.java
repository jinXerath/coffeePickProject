package com.cp.user.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.member.vo.MemberVO;

@Mapper
public interface MemberDAO {
	public List<MemberVO> memberList(MemberVO mvo);
	public int memberStatus(MemberVO mvo);
	public int memberCount();
//지훈
	public boolean memberJoin(MemberVO vo);

	public int nick_check(String member_nickname);

	public int id_check(String member_id);

	public MemberVO login(String id, String pw);

	public String memberIdFind(String phoneNumber);

	public String memberIdFind_email(String member_email);

	public MemberVO memberPwFind_phone(MemberVO vo);

	public MemberVO memberPwFind_email(MemberVO vo);
	
	public int pwAlter(String member_id, String member_pw);
	
	public String member_pw_check(String member_id, String member_pw);
	public int member_delete(String member_id, String member_pw);
	public int member_data_update(String member_id, String member_name, String member_nickname, String member_addr,
			String member_phone, String member_email);
	public int email_check(String member_email);
	public int phone_check(String member_phone);
	

	/*
	 * public int member_check(String id, String pwd);
	 */
}
