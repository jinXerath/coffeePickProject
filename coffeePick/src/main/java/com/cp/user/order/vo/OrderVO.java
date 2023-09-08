package com.cp.user.order.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;


/* equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며,
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다*/
@Data
@EqualsAndHashCode(callSuper = false)
public class OrderVO {
	private String order_no 		="";	        
	private int order_basic_price	=0;	
	private int order_use_point	    =0;
	private int order_total_price	=0;
	private String order_request	=""; 
	private int order_status	    =0;
	private String order_method	    ="";
	private String order_store_name	="";
	private String order_store_phone="";	
	private String order_store_addr	="";
	private String order_regdate	="";    
	private String member_id	    ="";   
	private String store_id	        ="";	
}
