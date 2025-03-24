package com.baseball.app.users;

import com.baseball.app.files.FileDTO;

public class User_ImageDTO extends FileDTO{
	
	
	private Long imageNum;
	private String userId;
	
	
	
	public Long getImageNum() {
		return imageNum;
	}
	public void setImageNum(Long imageNum) {
		this.imageNum = imageNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	

}
