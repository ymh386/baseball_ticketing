package com.baseball.app.users;

import javax.servlet.ServletContext;

import java.util.List;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	

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
		
		
	
	
	public int join(UserDTO userDTO,ServletContext context) throws Exception{
		int result = userDAO.join(userDTO);
		
		return result;
	}
	
	
	public UserDTO findId(UserDTO userDTO) throws Exception{
		return userDAO.findId(userDTO);
	}
	
	
	public UserDTO findPassword(UserDTO userDTO) throws Exception{
		return userDAO.findPassword(userDTO);
	}
	
	public List<Long> getTickets(UserDTO userDTO) throws Exception{
		return userDAO.getTickets(userDTO);
	}

	
	
	
	
}
