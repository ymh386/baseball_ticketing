package com.baseball.app.matches;

import java.sql.Date;
import java.sql.Time;

import com.baseball.app.stadiums.StadiumDTO;
import com.baseball.app.teams.TeamDTO;

public class MatchDTO {
	
	
	private Long matchNum;
	private Long stadiumNum;
	private Date matchDate;
	private Time matchTime;
	private Long homeTeam;
	private Long awayTeam;
	private String matchStatus;
	private Long homeScore;
	private Long awayScore;
	private TeamDTO homeTeamDTO;
	private TeamDTO awayTeamDTO;
	private StadiumDTO stadiumDTO;
	
	
	public Time getMatchTime() {
		return matchTime;
	}
	public void setMatchTime(Time matchTime) {
		this.matchTime = matchTime;
	}
	
	public TeamDTO getHomeTeamDTO() {
		return homeTeamDTO;
	}
	public void setHomeTeamDTO(TeamDTO homeTeamDTO) {
		this.homeTeamDTO = homeTeamDTO;
	}
	public TeamDTO getAwayTeamDTO() {
		return awayTeamDTO;
	}
	public void setAwayTeamDTO(TeamDTO awayTeamDTO) {
		this.awayTeamDTO = awayTeamDTO;
	}
	public StadiumDTO getStadiumDTO() {
		return stadiumDTO;
	}
	public void setStadiumDTO(StadiumDTO stadiumDTO) {
		this.stadiumDTO = stadiumDTO;
	}
	public Long getHomeScore() {
		return homeScore;
	}
	public void setHomeScore(Long homeScore) {
		this.homeScore = homeScore;
	}
	public Long getAwayScore() {
		return awayScore;
	}
	public void setAwayScore(Long awayScore) {
		this.awayScore = awayScore;
	}
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
