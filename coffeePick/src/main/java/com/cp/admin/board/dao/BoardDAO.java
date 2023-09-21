package com.cp.admin.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cp.admin.board.vo.BoardVO;


@Mapper
public interface BoardDAO {
	public List<BoardVO> boardList(BoardVO bvo);
	public int boardListCnt(BoardVO bvo);
	public int boardInsert(BoardVO bvo);
	public BoardVO boardDetail(BoardVO bvo);
	public int boardDelete(int board_no);
	public int boardUpdate(BoardVO bvo);
	public void checkDelete(List<String> list);

}
