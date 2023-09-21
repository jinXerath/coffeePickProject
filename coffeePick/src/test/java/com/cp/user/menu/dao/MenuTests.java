package com.cp.user.menu.dao;



import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.user.menu.vo.MenuVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class MenuTests {
	
	@Setter(onMethod_ = @Autowired)
	private MenuDAO menuDAO;
	
//	//전체 메뉴 조회
//	@Test
//	public void menuListTest() {
//		
//		log.info("menuList() 메서드 호출");
//		List<MenuVO> list = menuDAO.menuList(null);
//		for(MenuVO vo : list) {
//			log.info(vo.toString());
//		}
//	}
	
	// 메뉴 삭제 테스트
//	@Test
//	public void testMenuDelete(int menu_no) {
//	    MenuVO menu = new MenuVO();
//	    menu.setMenu_no(1); // 삭제할 메뉴 번호
//
//	   int r= menuDAO.menuDelete(menu_no);
//	    log.info("삭제된 행의 수: " + r);
//	}
	
	//메뉴 등록 테스트
//	@Test
//	public void testBoardInsert() {
//		log.info("------------------------------");
//		log.info("menuInsert() 메서드 실행");
//		MenuVO menu = new MenuVO();
//		menu.setMenu_no(0);
//		//menu.setMenu_img("이미지");
//		menu.setMenu_name("ahzkzjvl");
//		menu.setMenu_price(6000);
//		menu.setMenu_content("안녕하세요.");
//		menu.setMenu_category("coffee");
//		menu.setStore_id("store_id_1");
//		
//		int count = menuDAO.menuInsert(menu);
//		log.info("입력된 행의 수 : " + count);
//	}
	
	@Test
	public void testMenuDelete() {
	    int menuNo = 26; // 삭제할 메뉴 번호
	    
	    int count = menuDAO.menuDelete(menuNo);
	    log.info("삭제된 행의 수: " + count);
	}

	

}
