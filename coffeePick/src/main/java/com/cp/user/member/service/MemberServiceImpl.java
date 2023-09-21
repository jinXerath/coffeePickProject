package com.cp.user.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.member.dao.MemberDAO;
import com.cp.user.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_=@Autowired)
	private MemberDAO memberdao;
	
	@Override
	public List<MemberVO> memberList(MemberVO mvo){
		List<MemberVO> list = memberdao.memberList(mvo);
		
		return list;
	}
	
	@Override
	public int memberStatus(MemberVO mvo) {
		int result = 0;
		result = memberdao.memberStatus(mvo);
		return result;
	}

	@Override
	public int memberCount() {
		int result = memberdao.memberCount();
		return result;
	}
	
	@Override
	public int memberListCnt(MemberVO mvo) {
		return memberdao.memberListCnt(mvo);
	}
}
