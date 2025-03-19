package com.baseball.app.matches;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/matches/*")
public class MatchController {
	
	@Autowired
	private MatchService matchService;

}
