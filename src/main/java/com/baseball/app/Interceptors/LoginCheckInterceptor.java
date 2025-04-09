package com.baseball.app.Interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
	    String uri = request.getRequestURI();

	    // 로그인 체크 예외 목록
	    if (uri.contains("/checkId") || uri.contains("/users/join")) {
	        return true;
	    }
		
		Object user = request.getSession().getAttribute("user");
		
		if(user != null) {
			return true;
		}
		
		request.setAttribute("result", "로그인 후 이용해주세요.");
		request.setAttribute("path", "/users/login");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
		view.forward(request, response);
		
		return false;
	}

	
	
}
