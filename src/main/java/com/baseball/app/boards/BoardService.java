package com.baseball.app.boards;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.pages.Pager;


public interface BoardService {
	
	
	
	//list
	public List<BoardDTO> getList(Pager pager)throws Exception;
	
	//detail
	public BoardDTO getDetail(BoardDTO boardDTO)throws Exception;
	
	//insert
	public int add(BoardDTO boardDTO, MultipartFile[] attaches, HttpSession session)throws Exception;
	
	//update
	public int update(BoardDTO boardDTO, MultipartFile[] attaches, HttpSession session)throws Exception;
	
	//delete
	public int delete(BoardDTO boardDTO)throws Exception;
	
	

}
