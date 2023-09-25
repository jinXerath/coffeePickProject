package com.cp.admin.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.cp.admin.administrator.vo.AdminVO;
import com.cp.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BoardVO extends CommonVO{
	private int board_no ;
	private String board_title = "";
	private String board_content = "";
	private String board_readcnt = "";
	private String board_regdate = "";
	private String board_img = "";
	private String admin_id = "";
	
	private AdminVO admin;
	
	private MultipartFile file;
	
	
	private int prev_num; //이전글의 글번호
	private int next_num; //다음글의 글번호
	private String prev_title=""; //이전글의 제목
	private String next_title=""; //다음글의 제목
	private String prev_date=""; //이전글의 날짜
	private String next_date=""; //다음글의 날짜
}
