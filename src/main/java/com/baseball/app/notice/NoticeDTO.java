package com.baseball.app.notice;

import java.util.List;

import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.BoardFileDTO;

public class NoticeDTO extends BoardDTO{
	
	
	
	private List<BoardFileDTO> boardFileDTOs;
	

	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}

	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}


	
	
}
