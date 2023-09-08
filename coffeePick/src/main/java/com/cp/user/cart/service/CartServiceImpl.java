package com.cp.user.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.cart.dao.CartDAO;
import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.menu.vo.MenuVO;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {
	@Setter(onMethod_ = @Autowired)
	private CartDAO cartDAO;

	@Override
	public CartVO cartIdSearch(CartVO cvo) {
		return cartDAO.cartIdSearch(cvo);
	}

	@Override
	public List<CartDetailVO> cartDetailList(CartDetailVO cvo) {
		List<CartDetailVO> list = null;
		list = cartDAO.cartDetailList(cvo);
		return list;
	}

	@Override
	public List<MenuVO> menuList(MenuVO mvo) {
		List<MenuVO> list = null;
		list = cartDAO.menuList(mvo);
		return list;
	}
}
