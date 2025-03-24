package com.baseball.app.matches;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baseball.app.seats.SeatDTO;

@Controller
@RequestMapping("/matches/*")
public class MatchController {
	
	@Autowired
	private MatchService matchService;
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetail(MatchDTO matchDTO, Model model) throws Exception {
		
		matchDTO = matchService.getDetail(matchDTO);
		
		model.addAttribute("dto", matchDTO);
		
		return "matches/detail";
		
	}
	
	@RequestMapping(value = "seatList", method = RequestMethod.GET)
	public String getSeatList(MatchDTO matchDTO, Model model) throws Exception {
		
		List<SeatDTO> ar = matchService.getSeatList(matchDTO);
		
		model.addAttribute("list", ar);
		
		return "matches/seatList";
	}

}
