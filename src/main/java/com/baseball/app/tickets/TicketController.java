package com.baseball.app.tickets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baseball.app.users.UserDTO;

public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(TicketDTO ticketDTO, HttpSession session) throws Exception {
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		ticketDTO.setUserId(userDTO.getUserId());
		ticketService.add(ticketDTO);
		
		return "tickets/payment";
	}

}
