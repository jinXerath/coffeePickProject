package com.cp.user.menu.controller;

import java.util.List;

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


import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/menu/*")
@Slf4j
public class MenuController {

	@Setter(onMethod_ = @Autowired)  //구현 클래스에 @Service로 인스턴스 생성 했음.
	private MenuService menuService;


	/***************************************************
	 * 매장 리스트 구현하기(페이징 처리부분과 검색 제외 목록 조회)
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
    public String menuUpdateForm(@RequestParam("menu_no") String menuNo,@ModelAttribute MenuVO mvo, Model model) {
        log.info("menuUpdateForm 호출 성공");
        model.addAttribute("menuNo", menuNo);
        
        MenuVO updateData = menuService.updateForm(mvo);
		
		model.addAttribute("updateData", updateData);
        return "corpService/menu/menuUpdateForm";
    }
    
    @PostMapping("/menuUpdate")
    public String menuUpdate(@ModelAttribute MenuVO mvo, Model model) throws Exception {
        log.info("menuUpdate 호출 성공");
        log.info("데이터 출력:" + mvo.toString());

        int result = 0;
        String url = "";

        result = menuService.menuUpdate(mvo); // MenuService에 menuUpdate 메서드를 구현해야 함.
        log.info(""+result);
        if (result == 1) {
            url = "/menu/menuList?store_id=" + mvo.getStore_id();
        } else {
            url = "/menu/menuUpdateForm?menu_no=" + mvo.getMenu_no();
        }
        log.info(url);
        return "redirect:" + url;
    }

	/*****************************************
	 * 글삭제 구현하기
	 *****************************************/

	@PostMapping(value="/menuDelete")
	public String menuDelete(@ModelAttribute MenuVO mvo /* RedirectAttributes ras*/) throws Exception {
		log.info("menuDelete 호출 성공");

		//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";

		result = menuService.menuDelete(mvo);
		//ras.addFlashAttribute("menuVO",mvo);

		if (result == 1) {
			url="/menu/boardList?store_id="+mvo.getStore_id();  // 삭제 성공 시
		} else {
			url="/menu/boardList?store_id="+mvo.getStore_id(); // 삭제 실패 시
		}
		return "redirect:"+url;
	}

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
	public String menuInsert(@ModelAttribute MenuVO mvo, Model model) throws Exception {
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
}
