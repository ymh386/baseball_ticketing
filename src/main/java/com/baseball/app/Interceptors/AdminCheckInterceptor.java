package com.baseball.app.Interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.baseball.app.users.UserDTO;

@Component
public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Object user = request.getSession().getAttribute("user");
		
		UserDTO userDTO = (UserDTO)user;
		
		if(user != null && userDTO.getUserId().equals("admin")) {
			return true;
		}
		request.setAttribute("result", "관리자만 사용가능합니다.");
		request.setAttribute("path", "/");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
		view.forward(request, response);
		
		return false;
	}
	
	

}
