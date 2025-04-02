package com.baseball.app.teams;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/teams/*")
public class TeamController {
	
	@Autowired
	private TeamService teamService;
	
	
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String getList(Model model) throws Exception{
		
		List<TeamDTO> list = teamService.getList();
		
		
		model.addAttribute("list", list);
		
		return "teams/teamList";
	}
	
	
	

}
