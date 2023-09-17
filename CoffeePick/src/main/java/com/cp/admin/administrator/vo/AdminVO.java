package com.cp.admin.administrator.vo;

import com.cp.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AdminVO extends CommonVO{
	private int admin_no;
    private String admin_id;
    private String admin_pw;
    private String admin_name;
    private String admin_phone;
    private String admin_email;
    private String admin_regdate;
    private String admin_authority;
}
