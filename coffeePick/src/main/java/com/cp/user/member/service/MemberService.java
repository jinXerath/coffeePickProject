package com.cp.user.member.service;

import java.util.List;

import com.cp.user.member.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> memberList(MemberVO mvo);
	public int memberStatus(MemberVO mvo);
	public int memberCount();
	public int memberListCnt(MemberVO bvo);
}
