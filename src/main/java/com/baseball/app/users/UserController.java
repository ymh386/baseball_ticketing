package com.baseball.app.users;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.app.tickets.TicketDTO;

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
		
	    UserDTO user = (UserDTO) session.getAttribute("user");

	    if (user == null) {
	        // 로그인되지 않았다면 로그인 페이지로 리다이렉트
	        return "redirect:/login";
	    }

	    // 사용자의 티켓 정보 가져오기 
	    List<TicketDTO> ticketList = userService.getTickets(user);

	    // 티켓 목록을 모델에 추가
	    model.addAttribute("ticketList", ticketList);

	    // "getTicket" 뷰 페이지로 이동
	    return "users/getTicket";
	}
		
	
	
	@RequestMapping(value ="pwUpdate", method = RequestMethod.GET)
	public String pwUpdate() throws Exception{
		
		return "users/pwUpdate";
			
	}
	
	
	
	
	@RequestMapping(value="pwUpdate", method = RequestMethod.POST)
	public String pwUpdate(UserDTO userDTO,@RequestParam String currentPassword,@RequestParam String newPassword, 
	        @RequestParam String confirmPassword,HttpSession session, Model model) throws Exception{
		 UserDTO user = (UserDTO)session.getAttribute("user");
		 
	     String result = userService.pwUpdate(user, currentPassword, newPassword, confirmPassword);
	     System.out.println(user.getPassword());
	     System.out.println(currentPassword);
	     System.out.println(newPassword);
	     System.out.println(confirmPassword);

	        if (result.equals("success")) {
	            return "redirect:./mypage"; // 비밀번호 변경 성공 후 프로필 페이지로 리다이렉트
	        } else {
	            model.addAttribute("message", result); // 오류 메시지를 JSP로 전달
	            return "users/pwUpdate"; // 실패 시 다시 비밀번호 변경 페이지로
	        }
		
	}	
	
	
	@RequestMapping(value="userDelete", method= RequestMethod.GET)
	public String userDelete() throws Exception{
		
		
		
		return "users/userDelete";
	}
	
	
	@RequestMapping(value="userDelete", method=RequestMethod.POST)
	public String userDelete(UserDTO userDTO,HttpSession session) throws Exception{
	    UserDTO user = (UserDTO) session.getAttribute("user");
	    
	    if (user == null) {
	        // 세션에 사용자 정보가 없으면 로그인 페이지로 리다이렉트
	        return "redirect:/login";
	    }
	    
	    // 탈퇴 서비스 호출 (세션에서 가져온 user 정보 사용)
	    int result = userService.userDelete(user);
	    
	    // 탈퇴 성공 여부 확인
	    if (result > 0) {
	        // 탈퇴 성공 시 세션에서 사용자 정보 제거
	        session.removeAttribute("user");
	    }
	    
	    // 탈퇴 후 메인 페이지로 리다이렉트
	    return "redirect:/";
	}
	
	
	
	
	
	
	
	
		
	}
	
	
	
	
	



