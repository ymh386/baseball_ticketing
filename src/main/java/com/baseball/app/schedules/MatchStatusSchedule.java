package com.baseball.app.schedules;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.baseball.app.matches.MatchDAO;
import com.baseball.app.matches.MatchDTO;

@Component
@EnableScheduling
public class MatchStatusSchedule {
	
	@Autowired
	private MatchDAO matchDAO;
	
	@Scheduled(cron = "*/10 * * * * *")
	public void updateMatchStatus() throws Exception {
		Long matchTime = 0L;
		Calendar now = Calendar.getInstance();
		Long nowTime = now.getTimeInMillis();
		List<MatchDTO> list = new ArrayList<MatchDTO>();
		
		list = matchDAO.getAll();
		
		for(MatchDTO dto : list) {
			matchTime = dto.getMatchDate().getTime() + dto.getMatchTime().getTime();
			if(matchTime <= nowTime) {
				System.out.println("경기진행 - 경기번호 : " + dto.getMatchNum());
				matchDAO.updateMatchStatus(dto);
			}
		}
		
		
	}

}
