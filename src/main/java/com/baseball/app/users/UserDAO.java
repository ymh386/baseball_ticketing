package com.baseball.app.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.baseball.app.matches.MatchDTO;
import com.baseball.app.tickets.TicketDTO;

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
	
	public UserDTO getDetail(String userId) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getDetail",userId);
		
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
	
	public List<Map<String, Object>> getTickets(UserDTO userDTO) throws Exception{
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
	
	
	
    // 이메일로 사용자 찾기
    public UserDTO findByEmail(UserDTO userDTO) throws Exception {
        return sqlSession.selectOne(NAMESPACE + "findByEmail", userDTO);
    }

    // 비밀번호 업데이트
    public int findPwUpdate(UserDTO userDTO) throws Exception {
        return sqlSession.update(NAMESPACE + "findPwUpdate", userDTO);
    }



    // 티켓 상태 업데이트 메서드 (티켓환불 할때 티켓을 지울거면 필요없음)
    public int updateState(TicketDTO ticketDTO) throws Exception {
        return sqlSession.update(NAMESPACE + "updateState", ticketDTO); // update 쿼리 실행
    }
    
    public void updatePaymentState(TicketDTO ticketDTO) {
        sqlSession.update(NAMESPACE + "updatePaymentState", ticketDTO);
    }
    
    
    
    // 티켓 환불 (티켓 삭제)
    public int ticketDelete(TicketDTO ticketDTO) throws Exception{
    	return sqlSession.delete(NAMESPACE+"ticketDelete", ticketDTO);
    }
    
    
    public MatchDTO getUpcomingMatchByTeam(Long teamNum) throws Exception {
    	return sqlSession.selectOne(NAMESPACE + "getUpcomingMatchByTeam", teamNum);
    }
    
    

    
    
}
    

    


	


