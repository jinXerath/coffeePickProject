package com.cp.user.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private String order_no;
	private int order_basic_price;
	private int order_use_point;
	private int order_total_price;
	private String order_request;
	private int order_status;
	private int order_method;
	private String order_store_name;
	private String order_store_phone;
	private String order_store_addr;
	private String order_regdate;
	private int order_charge_point;
	private int order_use_pickmoney;
	private String member_id;
	private String store_id;
}
