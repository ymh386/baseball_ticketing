package com.baseball.app.ticketing;

public class TicketingDTO {

	
	private Long ticketNum;
	private Long matchNum;
	private String userId;
	private Long seatId;
	private String ticketStatus;
	
	
	
	public Long getTicketNum() {
		return ticketNum;
	}
	public void setTicketNum(Long ticketNum) {
		this.ticketNum = ticketNum;
	}
	public Long getMatchNum() {
		return matchNum;
	}
	public void setMatchNum(Long matchNum) {
		this.matchNum = matchNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getSeatId() {
		return seatId;
	}
	public void setSeatId(Long seatId) {
		this.seatId = seatId;
	}
	public String getTicketStatus() {
		return ticketStatus;
	}
	public void setTicketStatus(String ticketStatus) {
		this.ticketStatus = ticketStatus;
	}
	
	
	
	
	
}
