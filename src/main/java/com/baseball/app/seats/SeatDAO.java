package com.baseball.app.seats;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SeatDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.baseball.app.seats.SeatDAO.";
	
	public int add(SeatDTO seatDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "add", seatDTO);
	}

}
