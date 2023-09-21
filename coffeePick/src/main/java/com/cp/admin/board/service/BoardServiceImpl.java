package com.cp.admin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.admin.board.dao.BoardDAO;
import com.cp.admin.board.vo.BoardVO;
import com.cp.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardDAO boardDao;
	
	@Override
	public List<BoardVO> boardList(BoardVO bvo){
		List<BoardVO> list = null;
		list = boardDao.boardList(bvo);
		return list;
	}
	
	@Override
	public int boardListCnt(BoardVO bvo) {
		return boardDao.boardListCnt(bvo);
	}
	
	@Override
	public int boardInsert(BoardVO bvo) throws Exception{
		int result = 0;
		if(bvo.getFile().getSize()>0) {
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(),"board"); //board_1234.jpg
			bvo.setBoard_img(fileName);
		}
		result = boardDao.boardInsert(bvo);
		return result;
	}
	
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
//		boardDao.readCntUpdate(bvo); // 조회수 증가 메서드 호출

		BoardVO detail = boardDao.boardDetail(bvo);
		if (detail != null) {
			detail.setBoard_content(detail.getBoard_content().toString().replace("\n", "<br />"));
		}
		return detail;
	}
	
	@Override
	public int boardDelete(BoardVO bvo) throws Exception{
		int result = 0;
		if(!bvo.getBoard_img().isEmpty() ) { // b_file 필드의 값이 null 거나 ""아니면(이미지 파일이 존재하면)
			FileUploadUtil.fileDelete(bvo.getBoard_img());
		}
		
		result = boardDao.boardDelete(bvo.getBoard_no());
		return result;
	}
	
	@Override
	public BoardVO updateForm(BoardVO bvo) {
		BoardVO updateData = boardDao.boardDetail(bvo);
		return updateData;
	}
	
	
	@Override
	public int boardUpdate(BoardVO bvo) throws Exception{
		int result = 0;
		if(!bvo.getFile().isEmpty()) {			// 새롭게 업로드할 파일이 존재하면
			if(!bvo.getBoard_img().isEmpty()) {	// 기존 파일이 존재하면
				FileUploadUtil.fileDelete(bvo.getBoard_img());
			}
			
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "board");
			bvo.setBoard_img(fileName);
		}
		result = boardDao.boardUpdate(bvo);
		return result;
	}
	
	@Override
	public void checkDelete(List<String> list) throws Exception{
		boardDao.checkDelete(list);
	}

}
