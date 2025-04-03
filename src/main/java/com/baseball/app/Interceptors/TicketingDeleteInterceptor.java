package com.baseball.app.Interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.baseball.app.tickets.TicketDAO;
import com.baseball.app.tickets.TicketDTO;

@Component
public class TicketingDeleteInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private TicketDAO ticketDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(true);
		Object dto = session.getAttribute("dto");
		session.setAttribute("dto", null);
		if(dto != null) {
			TicketDTO ticketDTO = (TicketDTO)dto;
			if(ticketDTO.getTicketStatus().equals("결제중")) {
				ticketDAO.delete(ticketDTO);
			}else {
				return true;
			}
			request.setAttribute("result", "결제 취소");
			request.setAttribute("path", "/matches/seatList?matchNum=" + ticketDTO.getMatchNum());
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
			view.forward(request, response);
			return false;
		}
		return true;
		
	}

	
	
}
