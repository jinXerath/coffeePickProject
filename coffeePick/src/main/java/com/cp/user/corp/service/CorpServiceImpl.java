package com.cp.user.corp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.corp.vo.CorpVO;

import lombok.Setter;
import com.cp.user.corp.dao.*;
import com.cp.user.corp.service.*;
import com.cp.user.corp.controller.*;

@Service
public class CorpServiceImpl implements CorpService {
	
	@Setter(onMethod_=@Autowired)
	private CorpDAO corpdao;
	

	//지훈
	//회원가입
	@Override
	public boolean corpJoin(CorpVO vo) {
		boolean result=corpdao.corpJoin(vo);
		
		return result;
	}

	@Override
	public int id_check(String corp_id) {
		int result=corpdao.id_check(corp_id);
		return result;
	}



	@Override
	public CorpVO login(String id, String pw) {
		CorpVO result=corpdao.login(id,pw);
		
		  if (result == null) {
		        return null; // 사용자를 찾지 못했을 때 null 반환
		    }
		return result;
	}



	@Override
	public String corpIdFind(String phoneNumber) {
		String result=corpdao.corpIdFind(phoneNumber);
		if(result==null) {
			System.out.println("멤버서비스임플부분 아이디 찾기 결과값은 널이래 널값!null!"+result);
		}
		System.out.println("멤버서비스임플부분 아이디 찾기 결과값"+result);
		return result;
	}



	@Override
	public String corpIdFind_email(String corp_email) {
		String result=corpdao.corpIdFind_email(corp_email);
		if(result==null) {
			System.out.println("멤버서비스임플부분 아이디 찾기 결과값은 널이래 널값!null!"+result);
		}
		System.out.println("멤버서비스임플부분 아이디 찾기 결과값"+result);
		return result;
	}



	@Override
	public CorpVO corpPwFind_phone(CorpVO vo) {
		CorpVO result=corpdao.corpPwFind_phone(vo);
		System.out.println("현재 멤버서비스 임플부분 진입완료");
		if(result==null) {
			System.out.println("멤버서비스임플부분 비밀번호 찾기 결과값은 널이래 널값!null!");
		}
		System.out.println("멤버서비스임플부분 비밀번호 찾기 결과값");
		return result;
	}

	@Override
	public CorpVO corpPwFind_email(CorpVO vo) {
		CorpVO result=corpdao.corpPwFind_email(vo);
		System.out.println("현재 멤버서비스 임플부분 진입완료");
		if(result==null) {
			System.out.println("멤버서비스임플부분 비밀번호 찾기 결과값은 널이래 널값!null!");
		}
		System.out.println("멤버서비스임플부분 비밀번호 찾기 결과값");
		return result;
	}

	@Override
	public int pwAlter(String corp_id, String corp_pw) {
		System.out.println("멤버서비스임플부분 진입완료");
		int result=corpdao.pwAlter(corp_id,corp_pw);
		
		if(result==0) {
			System.out.println("멤버서비스임플부분 비밀번호변경실패");
		}
		return result;
	}

	@Override
	public int corp_pw_check(String corp_id, String corp_pw) {
		System.out.println("코프서비스임플부분 진입완료");
		String exresult=corpdao.corp_pw_check(corp_id,corp_pw);
		int result=0;
		System.out.println("코프result값은?"+result);
		if(exresult!=null) {
			result=1;
			System.out.println("코프제대로 값 가져옴"+result);			
		}
		return result;
	}

	@Override
	public int corp_delete(String corp_id, String corp_pw) {
		System.out.println("멤버서비스임플부분 진입완료");
		int result=corpdao.corp_delete(corp_id,corp_pw);
		System.out.println("result값은?"+result);	
		return result;
	}

	@Override
	public int corp_data_update(String corp_id, String corp_name, String corp_email,
			String corp_addr, String corp_phone, String corp_registration_number) {
		System.out.println("업데이트멤버서비스임플진입시작");
		int result=corpdao.corp_data_update(corp_id,corp_name,corp_email,corp_addr,corp_phone,corp_registration_number);
		System.out.println("멤버서비스임플부분업데이트실행끝"+result);
		return result;
	}

	@Override
	public int email_check(String corp_email) {
		System.out.println("이메일중복멤버서비스임플진입시작");
		int result=corpdao.email_check(corp_email);
		return result;
	}

	@Override
	public int phone_check(String corp_phone) {
		System.out.println("핸드폰중복멤버서비스임플진입시작");
		int result=corpdao.phone_check(corp_phone);
		return result;
	}


}
