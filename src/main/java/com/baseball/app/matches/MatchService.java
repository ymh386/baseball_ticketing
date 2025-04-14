package com.baseball.app.matches;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.Excels.ExcelRead;
import com.baseball.app.Excels.ExcelReadOption;
import com.baseball.app.boards.BoardFileDTO;
import com.baseball.app.boards.ReviewDTO;
import com.baseball.app.files.FileManager;
import com.baseball.app.pages.Pager;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.tickets.TicketDTO;

@Service
public class MatchService {
	private static final Logger logger = LoggerFactory .getLogger(MatchService.class); 
	
	@Autowired
	private MatchDAO matchDAO;
	
	@Autowired
	private FileManager fileManager;

	public void excelUpload(File destFile, String requestUrl) {
        
       ExcelReadOption excelReadOption = new ExcelReadOption();
        
        //파일경로 추가
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        
        //추출할 컬럼명 추가
        excelReadOption.setOutputColumns("A", "B", "C", "D", "E", "F", "G", "H");
        
        //시작행 1로 하면 맨윗줄부터 시작
        excelReadOption.setStartRow(2);
        
        List<Map<String, String>>excelContent  = ExcelRead.read(excelReadOption);
        
        logger.info("excelContent: "+excelContent);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("excelContent", excelContent);
        
        logger.info("paramMap: "+map);
        System.out.println(requestUrl);
        try {
        	if(requestUrl.equals("/matches/add")) {
        		matchDAO.add(map);		
        	}else {
        		matchDAO.delete(map);
        	}
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
	
	
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
	public List<MatchDTO> getMatchList(Integer month) throws Exception {
		
		return matchDAO.getMatchList(month);
	}
	
	//
	public List<MatchDTO> getMatchListHome() throws Exception {
		
		return matchDAO.getMatchListHome();
	}
	
	
	//getMatchListMonthly
	public List<MatchDTO> getMatchListMonthly(Integer month) throws Exception {
		
		return matchDAO.getMatchListMonthly(month);
	}
	
	
	//
	public List<ReviewDTO> getReviewList(MatchDTO matchDTO, Pager pager) throws Exception {
		
		Long totalCount = matchDAO.getTotalCount(matchDTO);
		pager.Calculate_PageAndBlock(totalCount);
		pager.makeListNum(totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("matchDTO", matchDTO);
		map.put("pager", pager);
		
		return matchDAO.getReviewList(map);
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
			
			// session의 tempFileList에 경로와 파일명 저장
			List<String> list = (List<String>) session.getAttribute("tempFileList");
			if(list != null) {
				list.add(result);				
			} else {
				System.out.println("list가 null입니다");
			}
		}
		
		return result;
	}
	
	
	// 에디터에 이미지 삭제 시 HDD에서 이미지 삭제
	public String deleteTempImage(String imageSrc, HttpSession session) throws Exception {
		
		System.out.println("imageSrc : " + imageSrc);
		
		// 가져온 이미지의 경로 전체를 경로와 파일명으로 파싱한다.
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
