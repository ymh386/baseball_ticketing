package com.baseball.app.boards;

import java.sql.Date;

public class BoardDTO {
	
	
	private String boardTitle;	
	private Long boardNum;	
	private Date boardDate;
	private String boardContent;
	private String userId;
	private Long boardHit;
	
	
	
	public Long getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(Long boardHit) {
		this.boardHit = boardHit;
	}	
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}	
	public Long getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Long boardNum) {
		this.boardNum = boardNum;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
	
	

}
