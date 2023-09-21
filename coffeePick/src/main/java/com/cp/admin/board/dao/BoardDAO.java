package com.cp.admin.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.admin.board.vo.BoardVO;


@Mapper
public interface BoardDAO {
	//공지 게시판
	public List<BoardVO> boardList(BoardVO bvo);
	public int boardListCnt(BoardVO bvo);
	public int boardInsert(BoardVO bvo);
	public BoardVO boardDetail(BoardVO bvo);
	public int boardDelete(int board_no);
	public int boardUpdate(BoardVO bvo);
	public void checkDelete(List<String> list);
	
	
	// 이벤트 게시판
	public List<BoardVO> eventList(BoardVO bvo);
	public int eventListCnt(BoardVO bvo);
	public int eventInsert(BoardVO bvo) ;
	public BoardVO eventDetail(BoardVO bvo);
	public int eventDelete(BoardVO bvo) ;
	public int eventUpdate(BoardVO bvo) ;
	public BoardVO eventUpdateForm(BoardVO bvo);
	public void eventCheckDelete(List<String> list) ;
}
