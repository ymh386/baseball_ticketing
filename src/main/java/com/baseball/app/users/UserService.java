package com.baseball.app.users;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Objects;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.app.files.FileManager;
import com.baseball.app.tickets.TicketDTO;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private FileManager fileManager;
	

	// 로그인 
	public UserDTO login(UserDTO userDTO) throws Exception {
	    UserDTO result = userDAO.getDetail(userDTO);

	    if (result == null) {
	        return null;
	    }

	    if (Objects.equals(result.getPassword(), userDTO.getPassword())) {
	        return result;
	    }

	    return null;
	}
		
		
	
	// 회원가입
	public int join(UserDTO userDTO,ServletContext context) throws Exception{
		int result = userDAO.join(userDTO);
		
		return result;
	}
	
	// 아이디 찾기
	public UserDTO findId(UserDTO userDTO) throws Exception{
		return userDAO.findId(userDTO);
	}
	
	// 비밀번호 찾기
	public UserDTO findPassword(UserDTO userDTO) throws Exception{
		return userDAO.findPassword(userDTO);
	}

	
	
	
	// 티켓 조회 
	public List<TicketDTO> getTickets(UserDTO userDTO) throws Exception{
		return userDAO.getTickets(userDTO);
	}

	//비밀번호 변경
	public String pwUpdate(UserDTO userDTO,String currentPassword, String newPassword, String confirmPassword) throws Exception{
		
		  if (!newPassword.equals(confirmPassword)) {
	            return "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.";
	        }

	        // 현재 비밀번호가 맞는지 확인
	        if (!userDTO.getPassword().equals(currentPassword)) {
	            return "현재 비밀번호가 올바르지 않습니다.";
	        }

	        // 비밀번호 변경 로직
	        userDTO.setPassword(newPassword);
	        userDAO.pwUpdate(userDTO);

	        return "success";
	        
	    }
	
	// 회원 탈퇴
	public int userDelete(UserDTO userDTO) throws Exception{
		
		return userDAO.userDelete(userDTO);
		
	}
	

	
	

	
	
	
	
	
	
	
	
	
	}
	
	
	

