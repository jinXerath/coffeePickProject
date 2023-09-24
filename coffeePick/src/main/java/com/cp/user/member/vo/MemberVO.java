package com.cp.user.member.vo;

import com.cp.common.vo.CommonVO;

import com.cp.user.pickmoney.vo.PickmoneyVO;
import com.cp.user.point.vo.PointVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends CommonVO {
	private int		member_no			;
	private String 	member_id 		= 	"";		//id
	private String	member_pw		=	"";		//password
	private String	member_name		=	"";		//이름
	private String	member_nickname	=	"";		//별명
	private	String	member_email	=	"";		//메일
	private String 	member_addr		=	"";		//주소
	private	String	member_phone	=	"";		//전화번호
	private String 	member_status	=	"";		//상태
	private String	member_regdate	=	"";		//가입날짜
	private String  member_leavedate=	"";		//탈퇴날짜
	
	private PointVO point;
	private PickmoneyVO pickmoney;
	

	



	
}
