package com.baseball.app.matches;

import java.sql.Date;

public class MatchDTO {
	
	
	private Long matchNum;
	private Long stadiumNum;
	private Date matchDate;
	private Long homeTeam;
	private Long awayTeam;
	private String matchStatus;
	
	
	
	public Long getMatchNum() {
		return matchNum;
	}
	public void setMatchNum(Long matchNum) {
		this.matchNum = matchNum;
	}
	public Long getStadiumNum() {
		return stadiumNum;
	}
	public void setStadiumNum(Long stadiumNum) {
		this.stadiumNum = stadiumNum;
	}
	public Date getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}
	public Long getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(Long homeTeam) {
		this.homeTeam = homeTeam;
	}
	public Long getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(Long awayTeam) {
		this.awayTeam = awayTeam;
	}
	public String getMatchStatus() {
		return matchStatus;
	}
	public void setMatchStatus(String matchStatus) {
		this.matchStatus = matchStatus;
	}
	
	

}
