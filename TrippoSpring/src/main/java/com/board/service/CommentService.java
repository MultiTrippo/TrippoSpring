package com.board.service;

import java.util.List;

import com.board.model.CommentVO;

public interface CommentService {
	//댓글 생성, 수정, 삭제
	int createComment(CommentVO comment);
	int updateComment(CommentVO comment);
	int deleteComment(int commentNo);
	
	//댓글 가져오기
	List<CommentVO> getAllCommentsByPost(int postNo);
	List<CommentVO> getCommentsByUser(String username);
}
