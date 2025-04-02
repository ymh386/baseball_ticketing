package com.baseball.app.teams;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamService {
	
	@Autowired
	private TeamDAO teamDAO;
	
	
	public List<TeamDTO> getList() throws Exception{
		
		return teamDAO.getList();
		
	}



	
	

}
