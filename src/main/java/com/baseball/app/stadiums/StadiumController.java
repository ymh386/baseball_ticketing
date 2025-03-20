package com.baseball.app.stadiums;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/stadiums/*")
public class StadiumController {
	
	@Autowired
	private StadiumService stadiumService;
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String getDetail(StadiumDTO stadiumDTO, Model model) throws Exception {
		
		stadiumDTO = stadiumService.getDetail(stadiumDTO);
		
		model.addAttribute("dto", stadiumDTO);
		
		return "stadiums/detail";
	}

}
