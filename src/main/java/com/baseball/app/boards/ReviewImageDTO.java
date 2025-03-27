package com.baseball.app.boards;

import com.baseball.app.files.FileDTO;

public class ReviewImageDTO extends FileDTO {

	
	private Long imageNum;
	private Long reviewNum;
	
	
	
	public Long getImageNum() {
		return imageNum;
	}
	public void setImageNum(Long imageNum) {
		this.imageNum = imageNum;
	}
	public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
	}
	
	
	
}
