package com.baseball.app.matches;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseball.app.seats.SeatDTO;

@Service
public class MatchService {
	
	@Autowired
	private MatchDAO matchDAO;
	
	public MatchDTO getDetail(MatchDTO matchDTO) throws Exception {
		
		return matchDAO.getDetail(matchDTO);
	}
	
	public List<SeatDTO> getSeatList(MatchDTO matchDTO) throws Exception {
		
		return matchDAO.getSeatList(matchDTO);
	}

}
