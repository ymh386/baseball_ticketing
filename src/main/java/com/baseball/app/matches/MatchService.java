package com.baseball.app.matches;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchService {
	
	@Autowired
	private MatchDAO matchDAO;

}
