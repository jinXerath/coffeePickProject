package com.cp.user.member.vo;

import com.cp.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends CommonVO {
	private int    member_no;
	private String member_id;
	private String member_pw;
	private String member_name;   
	private String member_nickname; 
	private String member_email; 
	private String member_addr;   
	private String member_phone;    
	private String member_status;   
	private String member_regdate;        
	private String member_leavedate;     
}