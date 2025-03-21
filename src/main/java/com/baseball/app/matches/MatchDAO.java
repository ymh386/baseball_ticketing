package com.baseball.app.matches;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.baseball.app.matches.MatchDAO.";	
	
	//detail
	public MatchDTO getDetail(MatchDTO matchDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + "getDetail", matchDTO);
	}

}
