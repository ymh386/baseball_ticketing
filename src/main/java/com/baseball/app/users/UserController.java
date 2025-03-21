package com.baseball.app.users;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/users/*")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="join", method = RequestMethod.GET)
	public void join()throws Exception{
		
	}
	
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(UserDTO userDTO,HttpSession session) throws Exception{
		
		int result = userService.join(userDTO,session.getServletContext());
		
		return "redirect:/";
		
		
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login()throws Exception{
		
	}
	

	
	@RequestMapping(value ="login", method = RequestMethod.POST)
	public String login(UserDTO userDTO, HttpSession session, Model model) {
		
		try {
			userDTO = userService.login(userDTO);
			
		}catch (Exception e) {
			model.addAttribute("result", e.getMessage());
			return "users/login";
		}
		
		if(userDTO != null) {
			session.setAttribute("user", userDTO);
			return "redirect:../";
		}
		
		model.addAttribute("result", "로그인을 다시 시도해주세요");
		model.addAttribute("path","./login");
		
		return "commons/result";
		
		
	}
	
	
	@RequestMapping(value ="logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		// user속성에 null 값 대입 
		session.setAttribute("user", null);
		
		// user 속성 삭제 
		session.removeAttribute("user");
		
		// session을 삭제시킨다. 유지시간을 0으로 세팅
		session.invalidate();
		
		return "redirect:../";
		
		
	}
	
	@RequestMapping(value="findId", method = RequestMethod.GET)
	public String findId() throws Exception{

		return "users/findId";
		
		
		}
	
	@RequestMapping(value="findId", method = RequestMethod.POST)
	public String findId(UserDTO userDTO, Model model) throws Exception{
		
		UserDTO user = userService.findId(userDTO);
		
		if(user == null) {
			model.addAttribute("check", 1);	
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getUserId());
		}
		
		return "users/findId";
		
		
	}
	
	@RequestMapping(value="findPassword", method = RequestMethod.GET)
	public String findPassword() throws Exception{

		return "users/findPassword";
		
		
		}
	
	
	@RequestMapping(value = "findPassword", method = RequestMethod.POST)
	public String findPassword(UserDTO userDTO, Model model) throws Exception{
		UserDTO user = userService.findPassword(userDTO);
		
		if(user == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("password", user.getPassword());
		}
		
		return "users/findPassword";
		

	
	}
	
	@RequestMapping(value ="mypage",method = RequestMethod.GET)
	public void mypage() throws Exception{
		
		
		
	}
	
	
	@RequestMapping(value ="getTicket", method = RequestMethod.GET)
	public String getTickets(HttpSession session, Model model,UserDTO userDTO) throws Exception{
		
		return "";
		
	}
	
	
	
	
		
	}
	
	
	
	
	



