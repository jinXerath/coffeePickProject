package com.cp.admin.administrator.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

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
