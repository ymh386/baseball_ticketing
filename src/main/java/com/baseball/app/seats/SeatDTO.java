package com.baseball.app.seats;

public class SeatDTO {
	
	
	private Long seatId;
	private Long stadiumNum;
	private Long seatNum;
	private String seatLevel;
	private Long seatPrice;
	
	
	
	public Long getSeatId() {
		return seatId;
	}
	public void setSeatId(Long seatId) {
		this.seatId = seatId;
	}
	public Long getStadiumNum() {
		return stadiumNum;
	}
	public void setStadiumNum(Long stadiumNum) {
		this.stadiumNum = stadiumNum;
	}
	public Long getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(Long seatNum) {
		this.seatNum = seatNum;
	}
	public String getSeatLevel() {
		return seatLevel;
	}
	public void setSeatLevel(String seatLevel) {
		this.seatLevel = seatLevel;
	}
	public Long getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(Long seatPrice) {
		this.seatPrice = seatPrice;
	}
	
	

}
