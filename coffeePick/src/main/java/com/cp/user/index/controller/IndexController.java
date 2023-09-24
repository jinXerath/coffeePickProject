package com.cp.user.index.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.cp.user.store.service.StoreService;
import com.cp.user.store.vo.StoreVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	
	@Setter(onMethod_ = @Autowired)
	private StoreService storeService;
	/**
	 * 요청하면 index.jsp로 이동
	 * @return "index"
	 */
	@GetMapping
	public String index(Model model) {
		StoreVO svo = new StoreVO();
		svo.setAmount(50);
		log.info("index호출 성공");
		log.info("매장리스트:"+svo.toString());
		List<StoreVO> storeList = storeService.storeList(svo);
		model.addAttribute("storeList",storeList);
		
		return "index";
	}
	
}
