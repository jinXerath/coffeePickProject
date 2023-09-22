package com.cp.user.cart.vo;

import java.util.List;

import lombok.Data;

@Data

public class CartVO {
	private String cart_id;
	private String member_id;

	private List<CartDetailVO> cartDetailVOList;
}
