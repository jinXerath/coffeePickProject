package com.cp.user.order.controller;

import java.util.List;

import lombok.Data;

@Data
public class PaymentRequest {
	private String merchant_uid;
	private int basicPrice;
	private int usePoint;
	private int totalPrice;
	private String request;
	private int method;
	private String storeName;
	private String storePhone;
	private String storeAddr;
	private String userId;
	private int chargePoint;
	private int usePickmoney;
	private List<OrderDetail> order_detail;

}
