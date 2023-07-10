package com.board.model;

import lombok.Data;

@Data
public class CommentVO {
	private int postNo;
	private int commentNo;
	private String username;
	private String commentText;
	private String addedDate;
	private String editedDate;
	
	
	//Constructors
	public CommentVO() {
	}
	
	public CommentVO(int postNo, int commentNo, String username, String commentText) {
		this.postNo=postNo;
		this.commentNo=commentNo;
		this.username=username;
		this.commentText=commentText;
	}
}
