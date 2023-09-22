package com.cp.admin.board.service;

import java.util.List;

import com.cp.admin.board.vo.BoardVO;


public interface BoardService {
	// 공지 게시판
	public List<BoardVO> boardList(BoardVO bvo);
	public int boardListCnt(BoardVO bvo);
	public int boardInsert(BoardVO bvo) throws Exception;
	public BoardVO boardDetail(BoardVO bvo);
	public int boardDelete(BoardVO bvo) throws Exception;
	public int boardUpdate(BoardVO bvo) throws Exception;
	public BoardVO updateForm(BoardVO bvo);
	public void checkDelete(List<String> list) throws Exception;
	
	

}
