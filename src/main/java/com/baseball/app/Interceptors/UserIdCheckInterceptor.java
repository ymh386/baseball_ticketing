package com.baseball.app.Interceptors;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.ReviewDTO;
import com.baseball.app.users.UserDTO;

@Component
public class UserIdCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("user");
		
		String kind = (String)modelAndView.getModel().get("kind");
		
		
		Object objDTO = (BoardDTO)modelAndView.getModel().get("dto");
		
		String name="";
		
		if(objDTO instanceof BoardDTO) {
			name = ((BoardDTO)objDTO).getUserId();
		}
		
		if(!userDTO.getUserId().equals(name)) {
			modelAndView.setViewName("/commons/result");
			modelAndView.getModel().put("result", "작성자만 가능합니다.");
			modelAndView.getModel().put("path", "./list");
			
		}
		
	}

	

	
	
}
