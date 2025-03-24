package com.baseball.app.tickets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baseball.app.users.UserDTO;

@Controller
@RequestMapping("/tickets/*")
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(TicketDTO ticketDTO, HttpSession session, Model model) throws Exception {
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		ticketDTO.setUserId(userDTO.getUserId());
		int result = ticketService.add(ticketDTO);
		
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value="payment", method=RequestMethod.GET)
	public String payment(TicketDTO ticketDTO, Model model) throws Exception {
		ticketDTO = ticketService.getDetail(ticketDTO);
		
		model.addAttribute("dto", ticketDTO);
		return "tickets/payment";
	}

}
