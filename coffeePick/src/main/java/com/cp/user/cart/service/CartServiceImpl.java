package com.cp.user.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.user.cart.dao.CartDAO;
import com.cp.user.cart.vo.CartDetailVO;
import com.cp.user.cart.vo.CartVO;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.store.vo.StoreVO;

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

	@Override
	public List<StoreVO> storeList(StoreVO svo) {
		List<StoreVO> list = null;
		list = cartDAO.storeList(svo);
		return list;
	}

	@Override
	public int updateMenuQuantity(Long cartDetailNo, String operation) {
		try {
			return cartDAO.updateMenuQuantity(cartDetailNo, operation);
		} catch (Exception e) {
			e.printStackTrace();
			return 0; // 실패할 경우 0 반환 또는 예외 처리
		}
	}

	@Override
	public void deleteCartItem(CartDetailVO cvo) {
		cartDAO.deleteCartItem(cvo);
	}

}
