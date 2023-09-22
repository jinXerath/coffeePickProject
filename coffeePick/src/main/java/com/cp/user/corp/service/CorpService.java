package com.cp.user.corp.service;

import java.util.List;

import com.cp.user.corp.vo.CorpVO;


public interface CorpService {

	//지훈
	public boolean corpJoin(CorpVO vo);

	public int id_check(String corp_id);

	public CorpVO login(String id, String pw);

	public String corpIdFind(String phoneNumber);

	public String corpIdFind_email(String corp_email);

	public CorpVO corpPwFind_phone(CorpVO vo);

	public int pwAlter(String corp_id, String corp_pw);
	public CorpVO corpPwFind_email(CorpVO vo);

	public int corp_pw_check(String corp_id, String corp_pw);

	public int corp_delete(String corp_id, String corp_pw);

	public int corp_data_update(String corp_id, String corp_name, String corp_email,
			String corp_addr, String corp_phone, String corp_registration_number);

	public int email_check(String corp_email);

	public int phone_check(String corp_phone);

	/*
	 * public int member_check(String id, String pwd);
	 */
	public List<CorpVO> corpList(CorpVO cvo);
	public int corpStatus(CorpVO cvo);
//	public int corpCount();
	public int corpListCnt(CorpVO cvo);
	
	//진환
	public CorpVO loginJinhwan(CorpVO cvo);
}
