package com.cp.user.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.member.vo.MemberVO;

@Mapper
public interface MemberDAO {
	public List<MemberVO> memberList(MemberVO mvo);
	public int memberStatus(MemberVO mvo);
	public int memberCount();
}
