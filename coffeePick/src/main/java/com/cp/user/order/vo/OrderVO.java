package com.cp.user.order.vo;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrderVO extends CommonVO {
	private String order_no = "";
	private int order_basic_price = 0;
	private int order_use_point = 0;
	private int order_total_price = 0;
	private String order_request = "";
	private int order_status = 0;
	private int order_method = 0;
	private String order_store_name = "";
	private String order_store_phone = "";
	private String order_store_addr = "";
	private String order_regdate = "";
	private int order_charge_point = 0;
	private int order_use_pickmoney = 0;
	private String member_id = "";
	private String store_id = "";
}
