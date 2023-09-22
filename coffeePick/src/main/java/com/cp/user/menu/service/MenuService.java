package com.cp.user.menu.service;

import java.util.List;

import com.cp.user.menu.vo.MenuVO;





public interface MenuService {

	public List<MenuVO> menuList(MenuVO mvo); //메뉴 리스트 조회
	public int menuInsert(MenuVO mvo) throws Exception; //메뉴 등록
	//public void menuDelete(int menu_no) throws Exception; //메뉴 삭제
	public int menuDelete(MenuVO mvo) throws Exception;  //메뉴 삭제
	
	public int menuUpdate(MenuVO mvo) throws Exception;  //메뉴 수정
	public MenuVO updateForm(MenuVO mvo); //메뉴 수정
	public MenuVO menuData(MenuVO mvo); //메뉴 조회 메뉴번호 기준
}
