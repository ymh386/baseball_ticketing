package com.baseball.app.matches;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
