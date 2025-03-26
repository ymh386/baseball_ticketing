package com.baseball.app.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.BoardService;
import com.baseball.app.files.FileManager;
import com.baseball.app.pages.Pager;

@Service
public class NoticeService implements BoardService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	
	public List<BoardDTO> getList(Pager pager) throws Exception{
		
		return noticeDAO.getList(pager);
		
	}


	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.getDetail(boardDTO);
	}


	@Override
	public int add(BoardDTO boardDTO, MultipartFile[] attaches, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.add(boardDTO);
	}


	@Override
	public int update(BoardDTO boardDTO, MultipartFile[] attaches, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.update(boardDTO);
	}


	@Override
	public int delete(BoardDTO boardDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.delete(boardDTO);
	}
	
}
