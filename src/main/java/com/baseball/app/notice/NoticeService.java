package com.baseball.app.notice;

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
public class NoticeService implements BoardService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	
	public List<BoardDTO> getList(Pager pager) throws Exception{
		Long totalCount =noticeDAO.getTotalCount(pager);
		pager.Calculate_PageAndBlock(totalCount);
		pager.makeListNum(totalCount);
		
		List<BoardDTO> list = noticeDAO.getList(pager);
		
		return list;
		
	}


	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.getDetail(boardDTO);
	}


	@Override
	public int add(BoardDTO boardDTO, MultipartFile[] attaches, HttpSession session) throws Exception {

		int result = noticeDAO.add(boardDTO);
		
		for (MultipartFile attach : attaches) {
			if(attach.isEmpty()) {
				continue;
			}
			
			BoardFileDTO boardFileDTO = this.fileSave(attach, session.getServletContext());
			
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			result = noticeDAO.addFile(boardFileDTO);
		}
		
		
		
		
		return result;
	}


	@Override
	public int update(BoardDTO boardDTO, MultipartFile[] attaches, HttpSession session) throws Exception {
		int result = noticeDAO.update(boardDTO);
		
		for(MultipartFile attach: attaches) {
			if(attach.isEmpty()) {
				continue;
			}
			BoardFileDTO boardFileDTO = this.fileSave(attach, session.getServletContext());
			//DB에 저장
			//
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			result = noticeDAO.addFile(boardFileDTO);
		}
		return result;
	}


	@Override
	public int delete(BoardDTO boardDTO, HttpSession session) throws Exception {
		//1. 파일들의 정보를 조회
		boardDTO=noticeDAO.getDetail(boardDTO);
		int result= noticeDAO.deleteAll(boardDTO);
		result = noticeDAO.delete(boardDTO);
		
		//3. HDD 삭제
		 if(result>0) {
			 String path = session.getServletContext().getRealPath("/resources/images/notice/");
			 System.out.println(path);
			 
			 for(BoardFileDTO boardFileDTO: ((NoticeDTO)boardDTO).getBoardFileDTOs()) {
				 fileManager.fileDelete(path, boardFileDTO.getFileName());
			 }
		 }
		 return result;
	}
		
		
		
	
	
	
	public BoardFileDTO fileSave(MultipartFile attach, ServletContext servletContext) throws Exception{
		
		String path = servletContext.getRealPath("/resources/images/notice/");
		System.out.println(path);
		
		String fileName = fileManager.fileSave(path, attach);
		
		BoardFileDTO boardFileDTO = new BoardFileDTO();
		boardFileDTO.setFileName(fileName);
		boardFileDTO.setOriginalName(fileName);
		
		return boardFileDTO;
		
		
	}
	
	
	// 파일 다운로드	
	public BoardFileDTO getFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		
		return noticeDAO.getFileDetail(boardFileDTO);				
	}
	
	// 파일 삭제
	public int fileDelete(BoardFileDTO boardFileDTO, HttpSession session) throws Exception {
		
		//1. 정보 조회
		boardFileDTO = noticeDAO.getFileDetail(boardFileDTO);
		
		//2. DB에서 삭제
		int result = noticeDAO.fileDelete(boardFileDTO); 
		System.out.println("Notice서비스 result"+result);
		//3. HDD에서 삭제
		if (result > 0) {
			String path = session.getServletContext().getRealPath("/resources/images/notice/");
			System.out.println(path);
			fileManager.fileDelete(path, boardFileDTO.getFileName());
		}		
		
		return result;
	}
	
	
	
	
	
	
	
}
