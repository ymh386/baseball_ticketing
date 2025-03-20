package com.baseball.app.stadiums;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StadiumService {
	
	@Autowired
	private StadiumDAO stadiumDAO;
	
	public StadiumDTO getDetail(StadiumDTO stadiumDTO) throws Exception {
		
		 stadiumDTO = stadiumDAO.getDetail(stadiumDTO);
		 
		 return stadiumDTO;
	}

}
