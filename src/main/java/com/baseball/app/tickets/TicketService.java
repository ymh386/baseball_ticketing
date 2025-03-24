package com.baseball.app.tickets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketService {
	
	@Autowired
	private TicketDAO ticketDAO;
	
	public int add(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.add(ticketDTO);
	}
	
	public int delete(TicketDTO ticketDTO) throws Exception {
		return ticketDAO.delete(ticketDTO);
	}

}
