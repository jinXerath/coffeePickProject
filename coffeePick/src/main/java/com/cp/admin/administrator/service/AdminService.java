package com.cp.admin.administrator.service;

import java.util.List;

import com.cp.admin.administrator.vo.AdminKeyVO;
import com.cp.admin.administrator.vo.AdminVO;

public interface AdminService {
	public AdminVO adminLogin(AdminVO avo);

	public AdminVO adminInfo(AdminVO avo);

	public int adminInsert(AdminVO avo);

	public int adminUpdate(AdminVO avo);

	public int adminDelete(AdminVO avo);

	public int adminPwUpdate(AdminVO avo);

	public int adminIdConfirm(AdminVO avo);

	public int adminPwConfirm(AdminVO avo);

	public List<AdminVO> adminList(AdminVO avo);

	public int adminCnt(AdminVO avo);

	public int adminKeyConfirm(AdminKeyVO akvo);

	public AdminKeyVO adminKeyInfo();

	public int adminKeyUpdate(AdminKeyVO akvo);
}
