package com.baseball.app.reviews;

import java.sql.Date;

public class ReviewDTO {
	
	
	private Long reviewNum;
	private Long matchNum;
	private String userId;
	private Date reviewDate;
	private String ReviewContent;
	
	
	
	public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
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
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewContent() {
		return ReviewContent;
	}
	public void setReviewContent(String reviewContent) {
		ReviewContent = reviewContent;
	}
	
	

}
