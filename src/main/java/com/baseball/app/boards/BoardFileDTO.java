package com.baseball.app.boards;

import com.baseball.app.files.FileDTO;

public class BoardFileDTO extends FileDTO {
	
	
	private Long fileNum;
	private Long boardNum;
	
	
	
	public Long getFileNum() {
		return fileNum;
	}
	public void setFileNum(Long fileNum) {
		this.fileNum = fileNum;
	}
	public Long getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Long boardNum) {
		this.boardNum = boardNum;
	}
	
	

}
