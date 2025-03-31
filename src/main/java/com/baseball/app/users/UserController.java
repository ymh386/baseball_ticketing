package com.baseball.app.users;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baseball.app.tickets.TicketDTO;

@Controller
@RequestMapping(value = "/users/*")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
    // 회원가입 화면
    @RequestMapping(value="join", method = RequestMethod.GET)
    public void join() throws Exception {
    }

    // 회원가입 처리
    @RequestMapping(value="join", method = RequestMethod.POST)
    public String join(UserDTO userDTO, HttpSession session) throws Exception {
        int result = userService.join(userDTO, session.getServletContext());
        return "redirect:/";
    }
    // 로그인 화면
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public void login() throws Exception {
    	
    }

    // 로그인 처리
    @RequestMapping(value ="login", method = RequestMethod.POST)
    public String login(UserDTO userDTO, HttpSession session, Model model) {
        try {
            userDTO = userService.login(userDTO);
        } catch (Exception e) {
            model.addAttribute("result", e.getMessage());
            return "users/login";
        }

        if (userDTO != null) {
            session.setAttribute("user", userDTO);
            return "redirect:../";
        }

        model.addAttribute("result", "로그인을 다시 시도해주세요");
        model.addAttribute("path", "./login");

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
	
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPassword(UserDTO userDTO, Model model) throws Exception {
	    // 이메일이 존재하는지 확인
	    if (!userService.isEmailExists(userDTO)) {
	        model.addAttribute("message", "등록되지 않은 이메일입니다.");
	        model.addAttribute("check", 1); // 이메일이 존재하지 않는 경우
	        return "users/findPassword"; // 포워드 방식으로 비밀번호 찾기 페이지로 리턴
	    }

	    // 임시 비밀번호 생성 및 이메일 전송
	    String tempPassword = userService.generateTempPassword();
	    boolean isUpdated = userService.updatePassword(userDTO.getEmail(), tempPassword); // DB에 임시 비밀번호 업데이트

	    if (isUpdated) {
	        // 임시 비밀번호 이메일로 전송
	        userService.sendTempPassword(userDTO.getEmail(), tempPassword);
	        model.addAttribute("message", "임시 비밀번호가 이메일로 전송되었습니다. 로그인 후 비밀번호를 변경해주세요!");
	        model.addAttribute("check", 0); // 임시 비밀번호 전송 성공

	        // 로그인 페이지로 포워드
	        return "users/findPassword";
	    } else {
	        // 비밀번호 업데이트 실패한 경우
	        model.addAttribute("message", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
	        model.addAttribute("check", 1); // 실패 처리
	        return "users/findPassword"; // 다시 비밀번호 찾기 페이지로 포워드
	    }
	}



	
	@RequestMapping(value ="mypage",method = RequestMethod.GET)
	public void mypage() throws Exception{
		
		
		
	}
	
	private String getTeamName(int teamNum) {
	    switch(teamNum) {
	        case 1: return "기아 타이거즈";
	        case 2: return "SSG 랜더스";
	        case 3: return "한화 이글스";
	        case 4: return "키움 히어로즈";
	        case 5: return "삼성 라이온즈";
	        case 6: return "롯데 자이언츠";
	        case 7: return "케이티 위즈";
	        case 8: return "엘지 트윈스";
	        case 9: return "엔씨 다이노스";
	        case 10: return "두산 베어스";
	        default: return "미지정";
	    }
	    
	}
	
	
	
	
	@RequestMapping(value = "getTicket", method = RequestMethod.GET)
	public String getTickets(HttpSession session, Model model, UserDTO userDTO) throws Exception {

	    UserDTO user = (UserDTO) session.getAttribute("user");

	    if (user == null) {
	        // 로그인되지 않았다면 로그인 페이지로 리다이렉트
	        return "redirect:/login";
	    }

	    // 사용자의 티켓 정보 가져오기 (Map 형태로 반환)
	    List<Map<String, Object>> ticketList = userService.getTickets(user);

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
	public String pwUpdate(UserDTO userDTO, @RequestParam String currentPassword, @RequestParam String newPassword, 
	        @RequestParam String confirmPassword, HttpSession session, Model model) throws Exception {
	    // 세션에서 현재 사용자 정보 가져오기
	    userDTO = (UserDTO) session.getAttribute("user");

	    // 서비스에서 비밀번호 변경 처리
	    String result = userService.pwUpdate(userDTO, currentPassword, newPassword, confirmPassword);

	    // 비밀번호 변경 결과 처리
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
	
	@RequestMapping(value = "/refund", method = RequestMethod.POST)
	public String refundTicket(@RequestParam("ticketNum") Long ticketNum, HttpSession session) {
	    try {
	        // 세션에서 UserDTO 객체를 가져오기
	        UserDTO user = (UserDTO) session.getAttribute("user");
	        if (user == null) {
	            return "redirect:./login";  // 로그인 페이지로 리다이렉트
	        }

	        // 티켓 상태를 '환불완료'로 변경
	        int result = userService.updateState(ticketNum, "환불완료");

	        if (result == 1) {
	            return "redirect:./getTicket";  // 티켓 조회 페이지로 리다이렉트
	        } else {
	            return "redirect:./getTicket?error=true";  // 티켓 조회 페이지로 오류 메시지와 함께 리다이렉트
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "redirect:./getTicket?error=true";  // 오류가 발생하면 티켓 조회 페이지로 리다이렉트
	    }
	}
	
	

	    
	    
	    
	}
	  
	  
	  
	
	

    

    
    

	
	
	
	
	
	
	
	
		

	
	
	
	
	



