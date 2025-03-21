package com.baseball.app.stadiums;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StadiumDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.baseball.app.stadiums.StadiumDAO.";
	
	public StadiumDTO getDetail(StadiumDTO stadiumDTO) throws Exception {
		
		
		return sqlSession.selectOne(NAMESPACE + "getDetail", stadiumDTO);
		
	}

}
