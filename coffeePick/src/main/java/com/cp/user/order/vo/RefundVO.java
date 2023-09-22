package com.cp.user.order.vo;

import lombok.Data;

@Data
public class RefundVO {
	private String merchant_uid;
	private String cancel_request_amount;
	private String reason;

}
