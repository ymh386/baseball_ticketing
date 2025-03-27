package com.baseball.app.matches;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseball.app.boards.ReviewDTO;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.tickets.TicketDTO;

@Service
public class MatchService {
	
	@Autowired
	private MatchDAO matchDAO;
	
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
	public List<ReviewDTO> getReviewList(MatchDTO matchDTO) throws Exception {
		
		return matchDAO.getReviewList(matchDTO);
	}
	
	
	//
	public int deleteReview(ReviewDTO reviewDTO) throws Exception {
		
		return matchDAO.deleteReview(reviewDTO);
	}
	
	
	//
	public int addReview(ReviewDTO reviewDTO) throws Exception {
		
		return matchDAO.addReview(reviewDTO);
	}
	
}
