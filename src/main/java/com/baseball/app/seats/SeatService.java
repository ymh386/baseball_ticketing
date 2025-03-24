package com.baseball.app.seats;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatService {
	
	@Autowired
	private SeatDAO seatDAO;
	
	public int add(SeatDTO seatDTO) throws Exception {
		return seatDAO.add(seatDTO);
	}

}
