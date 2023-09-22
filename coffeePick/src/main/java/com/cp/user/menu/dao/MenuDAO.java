package com.cp.user.menu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.user.menu.vo.MenuVO;




@Mapper
public interface MenuDAO {

	public List<MenuVO> menuList(MenuVO mvo);  //메뉴 조회
	public int menuDelete(int menu_no);	   //메뉴 삭제
	public int menuInsert(MenuVO mvo); //메뉴 등록
	public int menuUpdate(MenuVO mvo); //메뉴 수정
	public MenuVO menuData(MenuVO mvo); //메뉴 조회 메뉴번호 기준
	
}
