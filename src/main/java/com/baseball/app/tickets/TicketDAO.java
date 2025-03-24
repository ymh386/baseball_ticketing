package com.baseball.app.tickets;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.baseball.app.tickets.TicketDAO.";
	
	public TicketDTO getDetail(TicketDTO ticketDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getDetail", ticketDTO);
	}
	
	public int add(TicketDTO ticketDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "add", ticketDTO);
	}
	
	public int delete(TicketDTO ticketDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", ticketDTO);
	}

}
