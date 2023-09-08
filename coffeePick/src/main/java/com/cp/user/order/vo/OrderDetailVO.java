package com.cp.user.order.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int order_detail_no				=0;	            
	private String order_detail_menu_name	="";	    
	private int order_detail_menu_price		=0;	   
	private int order_detail_option_name	=0;
	private String order_no	                ="";	
}
