package com.cp.user.corp.vo;

import com.cp.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CorpVO extends CommonVO{
   private int corp_no;//
   private String corp_id="";//아이디
   private String corp_pw="";//비밀번호
   private String corp_name="";//이름
   private String corp_email="";//이메일
   private String corp_addr="";//주소
   private String corp_phone="";//핸드폰번호
   private String corp_regdate="";//가입날짜
   private String corp_leavedate="";//탈퇴날짜
   private String corp_registration_number="";//사업자등록번호
   private String corp_status="";//상태
   
  
}