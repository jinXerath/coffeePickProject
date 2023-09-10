package com.cp.user.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.store.vo.StoreVO;

@Mapper
public interface CartDAO {
	public CartVO cartIdSearch(CartVO cvo);

	public List<CartDetailVO> cartDetailList(CartDetailVO cvo);

	public List<MenuVO> menuList(MenuVO mvo);

	public List<StoreVO> storeList(StoreVO svo);

	public int updateMenuQuantity(Long cartDetailNo, String operation);
	
	public void deleteCartItem(CartDetailVO cvo);
}
