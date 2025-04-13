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
	
//	@Autowired
//	private MatchDAO matchDAO;
//	
//	@Scheduled(cron = "0/10 * * * * *")
//	public void updateMatchStatus() throws Exception {
//		Thread.sleep(1000);
//		Long matchTime = 0L;
//		Long matchEndTime = 0L;
//		Calendar now = Calendar.getInstance();
//		Long nowTime = now.getTimeInMillis();
//		List<MatchDTO> list = new ArrayList<MatchDTO>();
//		
//		try {
//			list = matchDAO.getAll();
//		} catch(Exception e) {
//			System.out.println("--------------------------");
//		}
//		
//		for(MatchDTO dto : list) {
//			matchTime = dto.getMatchDate().getTime();
//			matchEndTime = matchTime + 9000000L;
//			if(dto.getMatchStatus().equals("진행 전") && matchTime <= nowTime) {
//				System.out.println("경기진행 : 경기번호 " + dto.getMatchNum());
//				dto.setMatchStatus("진행 중");
//				matchDAO.updateMatchStatus(dto);
//			} else if(dto.getMatchStatus().equals("진행 중") && matchEndTime <= nowTime) {
//				System.out.println("경기종료 : 경기번호 " + dto.getMatchNum());
//				dto.setMatchStatus("종료");
//				matchDAO.updateMatchStatus(dto);
//			}
//		}
//		Thread.sleep(1000);
//	}

}
