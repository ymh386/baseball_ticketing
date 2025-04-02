package com.baseball.app.teams;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.baseball.app.pages.Pager;

@Repository
public class TeamDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE ="com.baseball.app.teams.TeamDAO.";
	
	
	public List<TeamDTO> getList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getList");	
	}

	
}
