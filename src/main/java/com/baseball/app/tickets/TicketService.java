package com.baseball.app.tickets;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseball.app.pages.Pager;
import com.baseball.app.seats.SeatDTO;
import com.baseball.app.users.UserDAO;
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
	
	public List<PaymentDTO> getPaymentList(HttpSession session, Pager pager) throws Exception {
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		Long totalCount = ticketDAO.getTotalCount(userDTO);
		pager.Calculate_PageAndBlock(totalCount);
		pager.makeListNum(totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", userDTO);
		map.put("pager", pager);
		
		List<PaymentDTO> ar = ticketDAO.getPaymentList(map);
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
	
	public int paymentAdd(PaymentDTO paymentDTO, HttpSession session, String[] productName) throws Exception {
		
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		paymentDTO.setUserId(userDTO.getUserId());
		int result = ticketDAO.paymentAdd(paymentDTO);
		
		String level = productName[1].substring(0, 1);

		if(level.equals("C")) {
			userDTO.setPoint(userDTO.getPoint() + 1000);
		}else if(level.equals("B")) {
			userDTO.setPoint(userDTO.getPoint() + 2000);
		}else {
			userDTO.setPoint(userDTO.getPoint() + 3000);
		}
		
		
		int result2 = ticketDAO.updatePoint(userDTO);
		
		if(result > 0 && result2 > 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	public int ticketStatusComplete(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.ticketStatusComplete(ticketDTO);
	}
	
	public int delete(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.delete(ticketDTO);
	}

	
	

	

}
