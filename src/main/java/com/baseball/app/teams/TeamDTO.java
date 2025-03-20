package com.baseball.app.teams;

public class TeamDTO {
	
	
	private Long teamNum;
	private Long stadiumNum;
	private String teamName;
	private String field;
	
	
	public Long getStadiumNum() {
		return stadiumNum;
	}
	public void setStadiumNum(Long stadiumNum) {
		this.stadiumNum = stadiumNum;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	
	
	
	
	
	public Long getTeamNum() {
		return teamNum;
	}
	public void setTeamNum(Long teamNum) {
		this.teamNum = teamNum;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	
	
	
	

}
