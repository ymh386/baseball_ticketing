package com.baseball.app.qna;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.BoardFileDTO;
import com.baseball.app.boards.BoardService;
import com.baseball.app.files.FileManager;
import com.baseball.app.pages.Pager;


@Service
public class QnaService implements BoardService {
	
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileManager fileManager;
	
	
	//-----------------------------------------------------------------	
	

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {

		return qnaDAO.getList(pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {

		return qnaDAO.getDetail(boardDTO);
	}

	@Override
	public int add(BoardDTO boardDTO, MultipartFile[] attaches, HttpSession session) throws Exception {
		
		int result = qnaDAO.add(boardDTO); System.out.println("add 후 boardNum : " + boardDTO.getBoardNum());		
		
		for (MultipartFile attach : attaches) {
			if(attach.isEmpty()) {
				continue;
			}
			
			// HDD에 파일 저장 후 이름 받아오기
			BoardFileDTO boardFileDTO = this.fileSave(attach, session.getServletContext());
			
			// DB에 파일 정보 저장
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			result = qnaDAO.addFile(boardFileDTO);
		}
		

		return result; 
	}
	

	@Override
	public int update(BoardDTO boardDTO, MultipartFile[] attaches, HttpSession session) throws Exception {

		int result = qnaDAO.update(boardDTO);
		
		for(MultipartFile attach : attaches) {
			if(attach.isEmpty()) {
				continue;
			}
			
			// HDD에 파일 저장 후 이름 받아오기
			BoardFileDTO boardFileDTO = this.fileSave(attach, session.getServletContext());
			
			// DB에 파일 정보 저장
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			result = qnaDAO.addFile(boardFileDTO);
		}		
		
		return result; 
	}
	

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {

		return qnaDAO.delete(boardDTO);
	}
	
	
	// 파일 저장
	public BoardFileDTO fileSave(MultipartFile attach, ServletContext servletContext) throws Exception {
		
		// 경로 지정
		String path = servletContext.getRealPath("/resources/images/qna/");
		System.out.println(path);
		
		// HDD에 저장하고 fileName 리턴
		String fileName = fileManager.fileSave(path, attach);
		
		// 파일의 정보를 DTO에 담아서 리턴
		BoardFileDTO boardFileDTO = new BoardFileDTO();
		boardFileDTO.setFileName(fileName);
		boardFileDTO.setOriginalName(attach.getOriginalFilename());
		
		return boardFileDTO;
	}
	
	
	// 파일 다운로드	
	public BoardFileDTO getFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		
		return qnaDAO.getFileDetail(boardFileDTO);				
	}
	
	
	
	
	
	
	

}
