package com.baseball.app.boards;

import java.util.List;

import com.baseball.app.pages.Pager;

public interface BoardDAO {
	
	
	// board 전체 갯수 조회
	public abstract Long getTotalCount(Pager pager)throws Exception;
	
	// 조회 수 업데이트
	public int updateHit(BoardDTO boardDTO) throws Exception;
	
	
	// SELECT, INSERT, UPDATE, DELETE
	public List<BoardDTO> getList(Pager pager) throws Exception;
	
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception;
	
	public int add(BoardDTO boardDTO) throws Exception;
	
	public int update(BoardDTO boardDTO) throws Exception;
	
	public int delete(BoardDTO boardDTO) throws Exception;
	
	

}
