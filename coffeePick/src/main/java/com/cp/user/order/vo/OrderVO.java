package com.cp.user.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private int order_use_pickmoney;
	private int order_charge_point;

	private String order_no 		="";	        
	private int order_basic_price	=0;	
	private int order_use_point	    =0;
	private int order_total_price	=0;
	private String order_request	=""; 
	private int order_status	    =0;
	private String order_store_name	="";
	private String order_store_phone="";	
	private String order_store_addr	="";
	private String order_regdate	="";    
	private String member_id	    ="";   
	private String store_id	        ="";	
	

	private int order_method;
}
