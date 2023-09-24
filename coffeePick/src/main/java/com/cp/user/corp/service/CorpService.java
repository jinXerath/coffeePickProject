package com.cp.user.corp.service;

import java.util.List;

import com.cp.user.corp.vo.CorpVO;


public interface CorpService {

	//지훈
	public boolean corpJoin(CorpVO vo);

	public int idCheck(String corp_id);

	public CorpVO login(String id, String pw);

	public String corpIdFindPhone(String phoneNumber);

	public String corpIdFindEmail(String corp_email);

	public CorpVO corpPwFindPhone(CorpVO vo);

	public CorpVO corpPwFindEmail(CorpVO vo);
	
	public int pwAlter(String corp_id, String corp_pw);
	
	public int corpPwCheck(String corp_id, String corp_pw);

	public int corpDelete(String corp_id, String corp_pw);

	public int corpDataUpdate(String corp_id, String corp_name, String corp_email,
			String corp_addr, String corp_phone, String corp_registration_number);

	public int emailCheck(String corp_email);

	public int phoneCheck(String corp_phone);

	/*
	 * public int member_check(String id, String pwd);
	 */
	public List<CorpVO> corpList(CorpVO cvo);
	public int corpStatus(CorpVO cvo);
//	public int corpCount();
	public int corpListCnt(CorpVO cvo);



	
}
