package com.baseball.app.qna;

import java.util.List;

import com.baseball.app.boards.BoardDTO;
import com.baseball.app.boards.BoardFileDTO;
import com.baseball.app.boards.CommentDTO;

public class QnaDTO extends BoardDTO {
	
	
	
	private List<BoardFileDTO> boardFileDTOs;
	private List<CommentDTO> commentDTOs;
	
	
	
	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}
	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}
	public List<CommentDTO> getCommentDTOs() {
		return commentDTOs;
	}
	public void setCommentDTOs(List<CommentDTO> commentDTOs) {
		this.commentDTOs = commentDTOs;
	}
	
	
	

}
