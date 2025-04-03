package com.baseball.app.tickets;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketService {
	
	@Autowired
	private TicketDAO ticketDAO;
	
	public TicketDTO getDetail(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.getDetail(ticketDTO);
	}
	
	public int add(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.add(ticketDTO);
	}
	
	public int delete(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.delete(ticketDTO);
	}
	

	

}
