package com.baseball.app.matches;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baseball.app.boards.ReviewDTO;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.tickets.TicketDTO;

@Repository
public class MatchDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.baseball.app.matches.MatchDAO.";	
	
	//detail
	public MatchDTO getDetail(MatchDTO matchDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + "getDetail", matchDTO);
	}
	
	//seatList
	public List<SeatDTO> getSeatList(MatchDTO matchDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getSeatList", matchDTO);
		
	}
	
	//ticketPayList
	public List<TicketDTO> getTicketPayment(TicketDTO ticketDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getTicketPayment", ticketDTO);
	}
	
	//getReviewList
	public List<ReviewDTO> getReviewList(MatchDTO matchDTO) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + "getReviewList", matchDTO);
	}
	
	//deleteReview
	public int deleteReview(ReviewDTO reviewDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE + "deleteReview", reviewDTO);
	}
	
	//addReview
	public int addReview(ReviewDTO reviewDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE + "addReview", reviewDTO);
	}
	

}
