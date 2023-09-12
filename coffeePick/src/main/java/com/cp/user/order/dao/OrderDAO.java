package com.cp.user.order.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.member.vo.MemberVO;

@Mapper
public interface OrderDAO {
	MemberVO memberInfo(MemberVO mvo);
}
