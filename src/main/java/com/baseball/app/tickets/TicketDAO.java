package com.baseball.app.tickets;

import java.util.Map;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baseball.app.matches.MatchDTO;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.users.UserDTO;

@Repository
public class TicketDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.baseball.app.tickets.TicketDAO.";
	
	public TicketDTO getDetail(TicketDTO ticketDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getDetail", ticketDTO);
	}
	
	public SeatDTO getSeatPrice(SeatDTO seatDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getSeatPrice", seatDTO);
	}
	
	public List<PaymentDTO> getPaymentList(UserDTO userDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getPaymentList", userDTO);
	}
	
	public TicketDTO getPaymentDetail(TicketDTO ticketDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getPaymentDetail", ticketDTO);
	}
	
	public int add(TicketDTO ticketDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "add", ticketDTO);
	}
	
	public int paymentAdd(PaymentDTO paymentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "paymentAdd", paymentDTO);
	}
	
	public int ticketStatusComplete(TicketDTO ticketDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "ticketStatusComplete", ticketDTO);
	}
	
	public int delete(TicketDTO ticketDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", ticketDTO);
	}
	
	
	public Map<String, Object> checkRefundEligibility(String paymentId) {
	        return sqlSession.selectOne("checkRefundEligibility", paymentId);
	    }

	public int updateTicketStatus(String paymentId) {
	        return sqlSession.update("updateTicketStatus", paymentId);
	    }
	
	
	
	
	

}
