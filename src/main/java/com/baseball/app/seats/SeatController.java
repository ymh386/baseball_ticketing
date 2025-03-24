package com.baseball.app.seats;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/seats/*")
public class SeatController {
	
	@Autowired
	private SeatService seatService;
	
	@RequestMapping(value="add", method=RequestMethod.GET)
	public String add() throws Exception {
		
		return "seats/add";
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(SeatDTO seatDTO) throws Exception {
		
		int result = seatService.add(seatDTO);
		
		return "redirect:/";
	}

}
