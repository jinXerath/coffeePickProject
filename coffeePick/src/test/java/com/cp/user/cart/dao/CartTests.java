package com.cp.user.cart.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.cart.vo.CartDetailVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class CartTests {
	@Setter(onMethod_ = @Autowired)
	private CartDAO cartDAO;

	/*
	 * @Test public void cartIdSearchTests() { String member_id = "user2";
	 * 
	 * CartVO cartVO = new CartVO(); cartVO.setMember_id(member_id);
	 * 
	 * CartVO result = cartDAO.cartIdSearch(cartVO);
	 * 
	 * log.info("Cart ID: {}, Member ID: {}", result.getCart_id(),
	 * result.getMember_id()); }
	 */
	/*
	 * @Test public void cartDetailListTest() { CartDetailVO cvo = new
	 * CartDetailVO(); cvo.setCart_id("cart1");
	 * 
	 * List<CartDetailVO> list = cartDAO.cartDetailList(cvo);
	 * 
	 * for (CartDetailVO vo : list) { log.info(vo.toString()); } }
	 */
	/*
	 * @Test public void menuListTest() { MenuVO mvo = new MenuVO();
	 * mvo.setMenu_no(1);
	 * 
	 * List<MenuVO> list = cartDAO.menuList(mvo);
	 * 
	 * for (MenuVO vo : list) { log.info(vo.toString()); } }
	 */
	/*
	 * @Test public void storeListTest() { StoreVO svo = new StoreVO();
	 * svo.setStore_id("store1");
	 * 
	 * List<StoreVO> list = cartDAO.storeList(svo);
	 * 
	 * for (StoreVO vo : list) { log.info(vo.toString()); } }
	 */

	@Test
	public void cartDeleteTest() {
		CartDetailVO cdvo = new CartDetailVO();
		cdvo.setCart_id("cart2");

		int result = cartDAO.cartDelete(cdvo);

		log.info(String.valueOf(result));
	}

}
