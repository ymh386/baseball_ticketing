package com.baseball.app.tickets;

public class TicketDTO {

	
	private Long matchNum;
	private String seatNum;
	private Long ticketNum;
	private String userId;
	private String ticketStatus;
	private String paymentId;
	
	
	
	public Long getMatchNum() {
		return matchNum;
	}
	public void setMatchNum(Long matchNum) {
		this.matchNum = matchNum;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public Long getTicketNum() {
		return ticketNum;
	}
	public void setTicketNum(Long ticketNum) {
		this.ticketNum = ticketNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTicketStatus() {
		return ticketStatus;
	}
	public void setTicketStatus(String ticketStatus) {
		this.ticketStatus = ticketStatus;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	
	
	
	
	
	

	

	
	
	
	
	
	
}
