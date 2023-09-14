package com.cp.user.menu.vo;



import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MenuVO {
	private int menu_no =0;		  		//메뉴번호
	private String menu_name ="";		 //메뉴이름
	private int menu_price =0;		 	//메뉴가격
	private String menu_content =""; 	 //메뉴설명
	private String menu_category =""; 	 //메뉴종류
	private String menu_regdate ="";	 //메뉴등록일
	private String store_id =""; 		 //매장정보ID
	
	
	//private MultipartFile file;         //파일 업로드를 위한 필드
	private String menu_img 		=""; //메뉴이미지
}
