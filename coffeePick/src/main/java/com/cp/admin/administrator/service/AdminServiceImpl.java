package com.cp.admin.administrator.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.admin.administrator.dao.AdminDAO;
import com.cp.admin.administrator.vo.AdminKeyVO;
import com.cp.admin.administrator.vo.AdminVO;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminDAO adminDAO;

	/**
	 * 관리자 로그인
	 */
	@Override
	public AdminVO adminLogin(AdminVO avo) {
		AdminVO admin = adminDAO.adminLogin(avo);
		return admin;
	}

	@Override
	public AdminVO adminInfo(AdminVO avo) {
		AdminVO admin = adminDAO.adminInfo(avo);
		return admin;
	}

	/**
	 * 관리자 회원가입 AdminVO의 모든 필드를 입력 받아 db에 저장해주고 결과 값 0과 1로 반환
	 */
	@Override
	public int adminInsert(AdminVO avo) {
		int result = 0;
		result = adminDAO.adminInsert(avo);
		return result;
	}

	@Override
	public int adminUpdate(AdminVO avo) {
		int result = 0;
		result = adminDAO.adminUpdate(avo);
		return result;
	}

	@Override
	public int adminDelete(AdminVO avo) {
		int result = 0;
		result = adminDAO.adminDelete(avo);
		return result;
	}

	@Override
	public int adminPwUpdate(AdminVO avo) {
		int result = 0;
		result = adminDAO.adminPwUpdate(avo);
		return result;
	}

	@Override
	public int adminIdConfirm(AdminVO avo) {
		int result = 0;
		result = adminDAO.adminIdConfirm(avo);
		return result;
	}

	@Override
	public int adminPwConfirm(AdminVO avo) {
		int result = 0;
		result = adminDAO.adminPwConfirm(avo);
		return result;
	}

	@Override
	public List<AdminVO> adminList(AdminVO avo) {
		List<AdminVO> adminList = null;
		adminList = adminDAO.adminList(avo);
		return adminList;
	}

	@Override
	public int adminCnt(AdminVO avo) {
		int total = adminDAO.adminCnt(avo);
		return total;
	}

	@Override
	public int adminKeyConfirm(AdminKeyVO akvo) {
		int result = 0;
		result = adminDAO.adminKeyConfirm(akvo);
		return result;
	}

	@Override
	public AdminKeyVO adminKeyInfo() {
		AdminKeyVO akvo = adminDAO.adminKeyInfo();
		return akvo;
	}

	@Override
	public int adminKeyUpdate(AdminKeyVO akvo) {
		int result = 0;
		result = adminDAO.adminKeyUpdate(akvo);
		return result;
	}
}
