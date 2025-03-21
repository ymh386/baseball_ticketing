package com.baseball.app.users;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.baseball.app.users.UserDAO.";
	
	
	//회원가입
	public int join(UserDTO userDTO) throws Exception{
	
		return sqlSession.insert(NAMESPACE+"join", userDTO);
			
		
	}
	
	
	//user 한명의 정보 조회, userName
	public UserDTO getDetail(UserDTO userDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getDetail",userDTO);
		
	}
	
	
	//id 찾기
	public UserDTO findId(UserDTO userDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"findId", userDTO);
		
	}
	
	//pw 찾기 
	
	public UserDTO findPassword(UserDTO userDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"findPassword", userDTO);
		
	}
	
	
	//티켓 정보
	
	public List<Long> getTickets(UserDTO userDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getTickets", userDTO);
	}
	
	// PW 수정 
	
	public int pwUpdate(UserDTO userDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"pwUpdate", userDTO);
		
	}
	
	// 회원 탈퇴 
	public int userDelete(UserDTO userDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"userDelete", userDTO);
		
	}
	
	
	
	
	
	
	

}
