package com.baseball.app.boards;

public class CommentDTO extends BoardDTO {
	
	
	private Long commentNum;
	private Long commentRef;
	private Long commentStep;
	private Long commentDepth;
	
		

	public Long getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(Long commentRef) {
		this.commentRef = commentRef;
	}

	public Long getCommentStep() {
		return commentStep;
	}

	public void setCommentStep(Long commentStep) {
		this.commentStep = commentStep;
	}

	public Long getCommentDepth() {
		return commentDepth;
	}

	public void setCommentDepth(Long commentDepth) {
		this.commentDepth = commentDepth;
	}

	public Long getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(Long commentNum) {
		this.commentNum = commentNum;
	}
	
	
	

}
