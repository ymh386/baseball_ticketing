package com.baseball.app.tickets;

import java.util.List;

import javax.servlet.http.HttpSession;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseball.app.seats.SeatDTO;
import com.baseball.app.users.UserDTO;

@Service
public class TicketService {
	
	@Autowired
	private TicketDAO ticketDAO;
	
	public TicketDTO getDetail(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.getDetail(ticketDTO);
	}
	
	public SeatDTO getSeatPrice(SeatDTO seatDTO) throws Exception {
		return ticketDAO.getSeatPrice(seatDTO);
	}
	
	public List<PaymentDTO> getPaymentList(HttpSession session) throws Exception {
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		List<PaymentDTO> ar = ticketDAO.getPaymentList(userDTO);
		return ar;
	}
	
	public TicketDTO getPaymentDetail(TicketDTO ticketDTO, HttpSession session) throws Exception {
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		ticketDTO.setUserId(userDTO.getUserId());
		ticketDTO = ticketDAO.getPaymentDetail(ticketDTO);
		return ticketDTO;
	}
	
	public int add(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.add(ticketDTO);
	}
	
	public int paymentAdd(PaymentDTO paymentDTO, HttpSession session) throws Exception {
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		paymentDTO.setUserId(userDTO.getUserId());
		return ticketDAO.paymentAdd(paymentDTO);
	}
	
	public int ticketStatusComplete(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.ticketStatusComplete(ticketDTO);
	}
	
	public int delete(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.delete(ticketDTO);
	}
	

	

}
