package com.cp.user.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.common.file.FileUploadUtil;
import com.cp.user.menu.dao.MenuDAO;
import com.cp.user.menu.vo.MenuVO;


import lombok.Setter;

@Service
public class MenuServiceImpl implements MenuService {

	@Setter(onMethod_ = @Autowired)
	private MenuDAO menuDAO;

	//메뉴 조회
	@Override
	public List<MenuVO> menuList(MenuVO mvo) {	
		List<MenuVO> list = null;
		list = menuDAO.menuList(mvo);
		return list;
	}

	//글삭제 구현
    @Override
    public int menuDelete(MenuVO mvo) throws Exception{
        int result = 0;
//        if(!bvo.getB_file().isEmpty()) { // b_file 필드의 값이 null 거나 ""아니면(이미지 파일이 존재하면)
//        	FileUploadUtil.fileDelete(bvo.getB_file());
//        }
        result = menuDAO.menuDelete(mvo.getMenu_no());
        //result = boardDAO.boardDelete(bvo.getB_num()); 이걸로도 가능 DAO 수정 필요
        return result;
    }



	//메뉴 등록 구현 (파일 업로드가 추가된 소스코드)
	@Override
	public int menuInsert(MenuVO mvo) throws Exception{
		int result = 0;
		//			if(mvo.getFile().getSize() > 0) {
		//				String fileName = FileUploadUtil.fileUpload(mvo.getFile(),"coffee"); //coffee_1658205347977_cat.jpg
		//				mvo.setMenu_img(fileName);
		//			}
		result = menuDAO.menuInsert(mvo);
		return result;
	}
	
	
	//메뉴 데이터 구현
	  @Override
	   public MenuVO menuData(MenuVO mvo) {
	      
	      MenuVO detail = menuDAO.menuData(mvo);
	      if(detail!=null) {
	         detail.setMenu_content(detail.getMenu_content().toString().replaceAll("\n", "<br />"));
	      }
	      return menuDAO.menuData(mvo);
	   }
	  
	//메뉴 수정 
	@Override
    public MenuVO updateForm(MenuVO mvo) {
    	MenuVO updateData = null;
    	updateData = menuDAO.menuData(mvo);
    	return updateData;
    }
	
	
	
	//메뉴 수정 구현
	public int menuUpdate(MenuVO mvo) throws Exception {
		int result = 0;
		
		result = menuDAO.menuUpdate(mvo);
		return result;
	}


}
