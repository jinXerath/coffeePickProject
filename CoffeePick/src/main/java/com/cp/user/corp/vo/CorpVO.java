package com.cp.user.corp.vo;

import com.cp.common.vo.CommonVO;
import com.cp.user.store.vo.StoreVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CorpVO extends CommonVO{
	private int    corp_no;
	private String corp_id;
	private String corp_pw;
	private String corp_name;
	private String corp_email;
	private String corp_addr;
	private String corp_phone;
	private String corp_regdate;
	private String corp_leavedate;
	private String corp_registration_number;
	private String corp_status;
	
	private StoreVO storeVO;
}
