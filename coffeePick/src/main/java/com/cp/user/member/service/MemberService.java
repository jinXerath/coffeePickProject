package com.cp.user.member.service;

import java.util.List;


import com.cp.user.member.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> memberList(MemberVO mvo);
	public int memberStatus(MemberVO mvo);
	public int memberCount();
	//지훈
	public boolean memberJoin(MemberVO mvo);

	public int nickCheck(String member_nickname);

	public int idCheck(String member_id);

	public MemberVO login(String id, String pw);

	public String memberIdFind(String phoneNumber);

	public String memberIdFindEmail(String member_email);

	public MemberVO memberPwFindPhone(MemberVO vo);

	public int pwAlter(String member_id, String member_pw);
	public MemberVO memberPwFindEmail(MemberVO vo);
	
	public int memberPwCheck(String member_id, String member_pw);
	public int memberDelete(String member_id, String member_pw);
	public int memberDataUpdate(String member_id, String member_name, String member_nickname, String member_addr,
			String member_phone, String member_email);
	public int emailCheck(String member_email);
	public int phoneCheck(String member_phone);

	/*
	 * public int member_check(String id, String pwd);
	 */
	public int memberListCnt(MemberVO mvo);
	
	public int cartInsert(MemberVO mvo);
	public int pointInsert(MemberVO mvo);
	public int pickmoneyInsert(MemberVO mvo);
}
