package com.cp.user.cart.service;

import java.util.List;

import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.store.vo.StoreVO;

public interface CartService {
	public CartVO cartIdSearch(CartVO cvo);

	public List<CartDetailVO> cartDetailList(CartDetailVO cvo);

	public int updateMenuQuantity(CartDetailVO cvo);

	public List<MenuVO> menuList(MenuVO mvo);

	public List<StoreVO> storeList(StoreVO svo);
	
	public void deleteCartItem(CartDetailVO cvo);
}
