package com.cp.admin.administrator.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.admin.administrator.vo.AdminKeyVO;
import com.cp.admin.administrator.vo.AdminVO;

@Mapper
public interface AdminDAO {
	// 아이디와 비밀번호를 입력 받아 아이디만 전달
	public AdminVO adminLogin(AdminVO avo);
	// 아이디를 입력 받아 비밀번호를 제외한 정보 전달
	public AdminVO adminInfo(AdminVO avo);
	
	// 관리자 회원 가입, 수정, 탈퇴
	public int adminInsert(AdminVO avo);
	public int adminUpdate(AdminVO avo);
	public int adminDelete(AdminVO avo);
	
	// 관리자 비밀번호 수정
	public int adminPwUpdate(AdminVO avo);
	
	// 아이디 중복 체크후 중복되면 1 없으면 0
	public int adminIdConfirm(AdminVO avo);
	// 아이디에 맞는 비밀번호인지 확인 후 맞으면 1 다르면 0
	public int adminPwConfirm(AdminVO avo);
	
	
	// 관리자 키 확인 후 맞으면 1 다르면 0
	public int adminKeyConfirm(AdminKeyVO akvo);
	public AdminKeyVO adminKeyInfo();
	public int adminKeyUpdate(AdminKeyVO akvo);
	
	public List<AdminVO> adminList(AdminVO avo);
	public int adminCnt(AdminVO avo);
}
