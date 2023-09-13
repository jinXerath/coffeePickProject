package com.cp.user.order.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int order_detail_no;
	private String order_detail_menu_name;
	private int order_detail_menu_count;
	private int order_detail_menu_price;
	private String order_no;
}
