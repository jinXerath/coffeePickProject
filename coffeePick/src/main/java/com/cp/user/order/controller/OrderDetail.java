package com.cp.user.order.controller;

import lombok.Data;

@Data
public class OrderDetail {
	private String orderNumber;
	private String name;
	private int quantity;
	private int amount;

}