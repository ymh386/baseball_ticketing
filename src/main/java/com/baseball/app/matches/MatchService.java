package com.baseball.app.matches;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.boards.BoardFileDTO;
import com.baseball.app.boards.ReviewDTO;
import com.baseball.app.files.FileManager;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.tickets.TicketDTO;

@Service
public class MatchService {
	
	@Autowired
	private MatchDAO matchDAO;
	
	@Autowired
	private FileManager fileManager;
	
	
	//
	public MatchDTO getDetail(MatchDTO matchDTO) throws Exception {
		
		return matchDAO.getDetail(matchDTO);
	}
	
	public List<SeatDTO> getSeatList(MatchDTO matchDTO) throws Exception {
		
		return matchDAO.getSeatList(matchDTO);
	}
	
	public List<TicketDTO> getTicketPayment(TicketDTO ticketDTO) throws Exception {
		return matchDAO.getTicketPayment(ticketDTO);
	}
	
	
	//
	public List<MatchDTO> getMatchList() throws Exception {
		
		return matchDAO.getMatchList();
	}
	
	
	//
	public List<ReviewDTO> getReviewList(MatchDTO matchDTO) throws Exception {
		
		return matchDAO.getReviewList(matchDTO);
	}
	
	
	//getReviewDetail
	public ReviewDTO getReviewDetail(ReviewDTO reviewDTO) throws Exception {
		
		return matchDAO.getReviewDetail(reviewDTO);
	}
	
	
	//
	public int deleteReview(ReviewDTO reviewDTO) throws Exception {
		
		return matchDAO.deleteReview(reviewDTO);
	}
	
	
	//
	public int addReview(ReviewDTO reviewDTO) throws Exception {
		
		return matchDAO.addReview(reviewDTO);
	}
	
	
	//updateReview
	public int updateReview(ReviewDTO reviewDTO) throws Exception {	
		
		return matchDAO.updateReview(reviewDTO);
	}
	
	
	
	
	// 에디터에 이미지 추가 시 HDD에서 이미지 생성
	public String tempImage(MultipartFile[] attaches,HttpSession session) throws Exception {
		
		String result = "";
		
		// 경로 지정
		String path = session.getServletContext().getRealPath("/resources/images/temp/");
		System.out.println(path);
		
		
		// 경로 생성 및 파일 HDD 저장하고 new Name 받아오기
		for (MultipartFile attach : attaches) {
			if(attach.isEmpty()) {
				continue;
				
			}			
			String fileName = fileManager.fileSave(path, attach);
			String miniPath = "/resources/images/temp/";
			result = miniPath + fileName;
		}
		
		return result;
	}
	
	
	// 에디터에 이미지 삭제 시 HDD에서 이미지 삭제
	public String deleteTempImage(String imageSrc, HttpSession session) throws Exception {
		
		System.out.println("imageSrc : " + imageSrc);
		
		String miniPath = imageSrc.substring(0, imageSrc.lastIndexOf("/")+1);
		System.out.println("miniPath : " + miniPath);
		
		String path = session.getServletContext().getRealPath(miniPath);
		System.out.println("path : " + path);
		
		String fileName = imageSrc.substring(imageSrc.lastIndexOf("/")+1);
		System.out.println("fileName : " + fileName);
		
		fileManager.fileDelete(path, fileName);
		
		return "삭제 완료";
	}
	
	
	
	
}
