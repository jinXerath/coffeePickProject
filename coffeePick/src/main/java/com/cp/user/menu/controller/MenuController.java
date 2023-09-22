package com.cp.user.menu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.cp.user.menu.service.MenuService;
import com.cp.user.menu.vo.MenuVO;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/menu/*")
@Slf4j
public class MenuController {

	@Setter(onMethod_ = @Autowired)  //구현 클래스에 @Service로 인스턴스 생성 했음.
	private MenuService menuService;

	/***************************************************
	 * 메뉴등록 구현하기
	 * *************************************************/
	@GetMapping("/menuInsertForm")
	public String menuInsert(@RequestParam("store_id") String storeId, Model model) {
		
		log.info("menuInsert 호출 성공");
		model.addAttribute("storeId", storeId); // 모델 어트리뷰트에 storeId를 담음

		return "corpService/menu/menuInsertForm";
	}
	
	@PostMapping("/menuInsert")
	public String menuInsert(@ModelAttribute MenuVO mvo,Model model) throws Exception {
	  log.info("menuInsert 호출 성공");
	  log.info("데이터 출력:"+ mvo.toString());
	 
	  int result = 0;
	  String url = "";

	  result = menuService.menuInsert(mvo);
	  log.info(""+result);
	  if(result == 1) {
	    url = "/menu/menuList?store_id="+mvo.getStore_id();
	  } else {
	    url = "/menu/menuInsertForm?store_id="+mvo.getStore_id();
	  }
	  log.info(url);
	  return "redirect:"+url;
	}
	

	/***************************************************
	 * 매장 리스트 구현하기
	 * 요청 URL: http://localhost:8080/menu/menuList
	 * *************************************************/
	@GetMapping("/menuList")
	public String menuList(MenuVO mvo, Model model) {
		log.info("menuList호출 성공");
		//전체 레코드 조회
		List<MenuVO> menuList = menuService.menuList(mvo);
		model.addAttribute("menuList",menuList);

		return "corpService/menu/menuList";  //WEB-INF/views/memberService/order/storeList
	}

	/***************************************************
     * 메뉴업데이트 구현하기
     * *************************************************/
    @GetMapping("/menuUpdateForm")
    public String menuUpdateForm(@RequestParam("store_id") String storeId,@RequestParam("menu_no") int menuNo,@ModelAttribute MenuVO mvo, Model model) {
        log.info("menuUpdateForm 호출 성공");
        log.info("menu_no :" + menuNo);
        log.info("데이터 출력:" + mvo.toString());
        model.addAttribute("menuNo", menuNo);
        model.addAttribute("storeId", storeId);
        
        MenuVO updateData = menuService.updateForm(mvo);
   
		model.addAttribute("updateData", updateData);
        return "corpService/menu/menuUpdateForm";
    }
    
    @PostMapping("/menuUpdate")
    public String menuUpdate(@ModelAttribute MenuVO mvo, Model model) throws Exception {
        log.info("menuUpdate 호출 성공");
        log.info("불러온 데이터:"+mvo.toString());
        MenuVO vo = new MenuVO();
        vo.setStore_id("store_id");
        
        int result = 0;
        String url = "";

        result = menuService.menuUpdate(mvo); // MenuService에 menuUpdate 메서드를 구현해야 함.
        log.info(""+result);
        if (result == 1) {
            url = "/menu/menuList?store_id=" + mvo.getStore_id();
        } else {
            url = "/menu/menuUpdateForm?menu_no=" + mvo.getMenu_no() +"&store_id" + mvo.getStore_id();
        }
        log.info(url);
        return "redirect:" + url;
    }

	/*****************************************
	 * 메뉴삭제 구현하기
	 *****************************************/

    @PostMapping(value="/menuDelete")
    public String menuDelete(@RequestParam("store_id") String storeId,@ModelAttribute MenuVO mvo,Model model) throws Exception {
        log.info("menuDelete 호출 성공");
        log.info("dd"+mvo.toString());
        model.addAttribute("storeId", storeId);
        
        int result = 0;
        String url = "";

        result = menuService.menuDelete(mvo);

        if (result == 1) {
            url = "/menu/menuList?store_id=" + mvo.getStore_id(); // 삭제 성공 시
        } else {
            url = "/menu/menuList?store_id=" + mvo.getStore_id(); // 삭제 실패 시
        }
        return "redirect:" + url;
    }


	
	

}
