package com.baseball.app.users;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.baseball.app.matches.MatchDTO;
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
    public void login(HttpSession session) throws Exception {
    	// 임시용 로그인 로직 'admin'부여
//    	UserDTO user = new UserDTO();
//    	user.setUserId("admin");
//    	session.setAttribute("user", user);
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(UserDTO userDTO,
                        HttpSession session,
                        HttpServletResponse response,
                        @RequestParam(value = "saveId", required = false) String saveId,
                        @RequestParam(value = "autoLogin", required = false) String autoLogin,
                        Model model) {

        boolean hasError = false;

        if (userDTO.getUserId() == null || userDTO.getUserId().trim().isEmpty()) {
            model.addAttribute("userIdError", "아이디를 입력해주세요.");
            hasError = true;
        }

        if (userDTO.getPassword() == null || userDTO.getPassword().trim().isEmpty()) {
            model.addAttribute("passwordError", "비밀번호를 입력해주세요.");
            hasError = true;
        }

        if (hasError) {
            return "users/login";
        }

        try {
            userDTO = userService.login(userDTO);
        } catch (Exception e) {
            model.addAttribute("result", e.getMessage());
            return "users/login";
        }

        if (userDTO != null) {
            session.setAttribute("user", userDTO);

            // 아이디 저장
            if (saveId != null) {
                Cookie idCookie = new Cookie("userId", userDTO.getUserId());
                idCookie.setMaxAge(60 * 60 * 24 * 7); // 7일
                idCookie.setPath("/");
                response.addCookie(idCookie);
            } else {
                Cookie idCookie = new Cookie("userId", null);
                idCookie.setMaxAge(0); // 삭제
                idCookie.setPath("/");
                response.addCookie(idCookie);
            }

            // 자동 로그인 처리 
            if (autoLogin != null) {
                Cookie autoLoginCookie = new Cookie("autoLogin", userDTO.getUserId());
                autoLoginCookie.setMaxAge(60 * 60 * 24 * 7);
                autoLoginCookie.setPath("/");
                response.addCookie(autoLoginCookie);
            }

            return "redirect:../";
        }

        model.addAttribute("result", "로그인을 다시 시도해주세요.");
        return "commons/result";
    }


	
	
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 세션에서 사용자 정보 제거
        session.removeAttribute("user");
        session.invalidate();

        // 쿠키 삭제 (autoLogin, rememberId)
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("autoLogin".equals(cookie.getName()) || "rememberId".equals(cookie.getName())) {
                    cookie.setMaxAge(0); // 쿠키 삭제
                    cookie.setPath("/"); // 경로 지정
                    response.addCookie(cookie); // 삭제된 쿠키 응답에 추가
                }
            }
        }

        return "redirect:../";
    }

	
	@RequestMapping(value="findId", method = RequestMethod.GET)
	public String findId() throws Exception{

		return "users/findId";
		
		
		}
	
	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findId(UserDTO userDTO, Model model) throws Exception{
	    boolean hasError = false;

	    if (userDTO.getName() == null || userDTO.getName().trim().isEmpty()) {
	        model.addAttribute("nameError", "이름을 입력해주세요.");
	        hasError = true;
	    }

	    if (userDTO.getEmail() == null || userDTO.getEmail().trim().isEmpty()) {
	        model.addAttribute("emailError", "이메일을 입력해주세요.");
	        hasError = true;
	    }

	    if (hasError) {
	        return "users/findId"; // 에러가 있으면 다시 아이디 찾기 페이지로 이동
	    }

	    UserDTO id = userService.findId(userDTO);
	    
	    if (id == null) {
	        model.addAttribute("check", 1); // 일치하는 정보 없음
	    } else {
	        model.addAttribute("check", 0);
	        model.addAttribute("id", id.getUserId());
	    }

	    return "users/findId";	
	}

	
	@RequestMapping(value="findPassword", method = RequestMethod.GET)
	public String findPassword() throws Exception{

		return "users/findPassword";
		
		
		}
	
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPassword(UserDTO userDTO, Model model) throws Exception {
	    
		// 아이디 이메일 이름이 일치하는지 확인
		UserDTO user = userService.findPassword(userDTO);

		if (user == null) { // 일치하는 계정 정보가 없을 경우
		    model.addAttribute("message", "입력한 정보와 일치하는 계정이 없습니다.");
		    model.addAttribute("check", 1); // 실패 상태
		    return "users/findPassword"; // 비밀번호 찾기 페이지로 이동
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



	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) throws Exception {
		
		
	    UserDTO user = (UserDTO) session.getAttribute("user");

	    if (user == null) {
	        // 로그인 안 되어있으면 로그인 페이지로 리다이렉트
	        return "redirect:./login";
	    }

	 
	 // 2. teamNum이 null이면 경기정보 보여주지 않음
	    Long teamNum = user.getTeamNum(); 
	    if (teamNum != null && teamNum != 0) {
	        MatchDTO upcomingMatch = userService.getUpcomingMatchByTeam(teamNum);
	        model.addAttribute("upcomingMatch", upcomingMatch);
	    }
	    model.addAttribute("user", user); // 사용자 정보도 같이 넘겨줌
	    return "users/mypage";
	}

	    	
	
	
	
	@RequestMapping(value = "getTicket", method = RequestMethod.GET)
	public String getTickets(HttpSession session, Model model, UserDTO userDTO) throws Exception {

	    UserDTO user = (UserDTO) session.getAttribute("user");

	    if (user == null) {
	        // 로그인되지 않았다면 로그인 페이지로 리다이렉트
	        return "redirect:./login";
	    }

	    // 사용자의 티켓 정보 가져오기 (Map 형태로 반환)
	    List<Map<String, Object>> ticketList = userService.getTickets(user);

	    // 티켓 목록을 모델에 추가
	    model.addAttribute("ticketList", ticketList);

	    // "getTicket" 뷰 페이지로 이동
	    return "users/getTicket";
	}
	
	
	@RequestMapping(value ="pwUpdate", method = RequestMethod.GET)
	public String pwUpdate(HttpSession session) throws Exception{
		
		UserDTO user = (UserDTO)session.getAttribute("user");
		
		if(user == null) {
			return "redirect:./login";
			
		}
		
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
	public String userDelete(HttpSession session) throws Exception{
		 UserDTO user = (UserDTO) session.getAttribute("user");
		
	    if (user == null) {
	        // 세션에 사용자 정보가 없으면 로그인 페이지로 리다이렉트
	        return "redirect:./login";
	    }
		
		return "users/userDelete";
	}
	
	
	@RequestMapping(value="userDelete", method=RequestMethod.POST)
	public String userDelete(UserDTO userDTO,HttpSession session) throws Exception{
	    UserDTO user = (UserDTO) session.getAttribute("user");
	    
	    if (user == null) {
	        // 세션에 사용자 정보가 없으면 로그인 페이지로 리다이렉트
	        return "redirect:./login";
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
    public String refundTicket(@ModelAttribute TicketDTO ticketDTO,Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception{
		System.out.println("refundTicket 실행");
        try {
        	Long refundPoint = 0L;
        	Long returnPoint = 0L;
            Map<String, Object> result = userService.refundTickets(ticketDTO, session);
            if(result.get("level").equals("C")) {
            	returnPoint = 1000L;
            }else if(result.get("level").equals("B")){
            	returnPoint = 2000L;
            }else {
            	returnPoint = 3000L;
            }
            refundPoint = Long.parseLong(result.get("usePoint").toString()) - returnPoint;
        	model.addAttribute("result", "환불이 완료되었습니다. 환불된 포인트 : " + refundPoint
        			+ "P (환불포인트=" + Long.parseLong(result.get("usePoint").toString()) + "P, 반환포인트=" + returnPoint + "P)");
            model.addAttribute("path", "./getTicket"); // 티켓 구매 내역 페이지로 이동
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "환불 처리 중 오류가 발생했습니다.");
        }
        
        return "commons/result"; 
    }
	

	
	@RequestMapping(value = "checkId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> checkId(@RequestBody UserDTO userDTO) {
		System.out.println("gg");
	    boolean exists = userService.checkIdExists(userDTO);
	    Map<String, Boolean> result = new HashMap();
	    result.put("exists", exists);
	    return result;
	}
	

	
	

	

	
}
	


	    
	    
	    
	
	  
	  
	  
	
	

    

    
    

	
	
	
	
	
	
	
	
		

	
	
	
	
	



