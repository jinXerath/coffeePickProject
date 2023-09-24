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
	

	//지훈
	//회원가입
	@Override
	public boolean memberJoin(MemberVO vo) {
		boolean result=memberdao.memberJoin(vo);
		
		return result;
	}



	@Override
	public int nickCheck(String member_nickname) {
		int result=memberdao.nickCheck(member_nickname);
		return result;
	}



	@Override
	public int idCheck(String member_id) {
		int result=memberdao.idCheck(member_id);
		return result;
	}



	@Override
	public MemberVO login(String id, String pw) {
		MemberVO result=memberdao.login(id,pw);
		
		  if (result == null) {
		        return null; // 사용자를 찾지 못했을 때 null 반환
		    }
		return result;
	}



	@Override
	public String memberIdFind(String phoneNumber) {
		String result=memberdao.memberIdFind(phoneNumber);
		if(result==null) {
			System.out.println("멤버서비스임플부분 아이디 찾기 결과값은 널이래 널값!null!"+result);
		}
		System.out.println("멤버서비스임플부분 아이디 찾기 결과값"+result);
		return result;
	}



	@Override
	public String memberIdFindEmail(String member_email) {
		String result=memberdao.memberIdFindEmail(member_email);
		if(result==null) {
			System.out.println("멤버서비스임플부분 아이디 찾기 결과값은 널이래 널값!null!"+result);
		}
		System.out.println("멤버서비스임플부분 아이디 찾기 결과값"+result);
		return result;
	}



	@Override
	public MemberVO memberPwFindPhone(MemberVO vo) {
		MemberVO result=memberdao.memberPwFindPhone(vo);
		System.out.println("현재 멤버서비스 임플부분 진입완료");
		if(result==null) {
			System.out.println("멤버서비스임플부분 비밀번호 찾기 결과값은 널이래 널값!null!");
		}
		System.out.println("멤버서비스임플부분 비밀번호 찾기 결과값");
		return result;
	}

	@Override
	public MemberVO memberPwFindEmail(MemberVO vo) {
		MemberVO result=memberdao.memberPwFindEmail(vo);
		System.out.println("현재 멤버서비스 임플부분 진입완료");
		if(result==null) {
			System.out.println("멤버서비스임플부분 비밀번호 찾기 결과값은 널이래 널값!null!");
		}
		System.out.println("멤버서비스임플부분 비밀번호 찾기 결과값");
		return result;
	}

	@Override
	public int pwAlter(String member_id, String member_pw) {
		System.out.println("멤버서비스임플부분 진입완료");
		int result=memberdao.pwAlter(member_id,member_pw);
		
		if(result==0) {
			System.out.println("멤버서비스임플부분 비밀번호변경실패");
		}
		return result;
	}

	@Override
	public int memberPwCheck(String member_id, String member_pw) {
		System.out.println("멤버서비스임플부분 진입완료");
		String exresult=memberdao.memberPwCheck(member_id,member_pw);
		int result=0;
		System.out.println("result값은?"+result);
		if(exresult!=null) {
			result=1;
			System.out.println("제대로 값 가져옴"+result);			
		}
		return result;
	}

	@Override
	public int memberDelete(String member_id, String member_pw) {
		System.out.println("멤버서비스임플부분 진입완료");
		int result=memberdao.memberDelete(member_id,member_pw);
		System.out.println("result값은?"+result);
	
		return result;
	}

	@Override
	public int memberDataUpdate(String member_id, String member_name, String member_nickname, String member_addr,
			String member_phone,String member_email) {
		System.out.println("업데이트멤버서비스임플진입시작");
		int result=memberdao.memberDataUpdate(member_id,member_name,member_nickname,member_addr,member_phone,member_email);
		System.out.println("멤버서비스임플부분업데이트실행끝"+result);
		return result;
	}

	@Override
	public int emailCheck(String member_email) {
		System.out.println("이메일중복멤버서비스임플진입시작");
		int result=memberdao.emailCheck(member_email);
		return result;
	}

	@Override
	public int phoneCheck(String member_phone) {
		System.out.println("이메일중복멤버서비스임플진입시작");
		int result=memberdao.phoneCheck(member_phone);
		return result;
	}


	


	/*
	 * @Override public int member_check(String id, String pwd) {
	 * System.out.println("서비스임플부분 멤버체크 메소드 시작 아이디값"+id+"비밀번호"+pwd); int
	 * a=dao.member_check(id,pwd); System.out.println("서비스임플부분 멤버체크 메소드"+a); return
	 * a; }
	 */

	
	@Override
	public int memberListCnt(MemberVO mvo) {
		return memberdao.memberListCnt(mvo);
	}

	@Override
	public int cartInsert(MemberVO mvo) {
		return memberdao.cartInsert(mvo);
	}

	@Override
	public int pointInsert(MemberVO mvo) {
		return memberdao.pointInsert(mvo);
	}

	@Override
	public int pickmoneyInsert(MemberVO mvo) {
	
		return memberdao.pickmoneyInsert(mvo);
	}
}
