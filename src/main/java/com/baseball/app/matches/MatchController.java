package com.baseball.app.matches;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}
