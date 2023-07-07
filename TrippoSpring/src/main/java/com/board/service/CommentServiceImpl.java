package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.mapper.CommentMapper;
import com.board.model.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Inject
	private CommentMapper commentMapper;

	@Override
	public int createComment(CommentVO comment) {
		// TODO Auto-generated method stub
		return this.commentMapper.createComment(comment);
	}

	@Override
	public int updateComment(CommentVO comment) {
		return this.commentMapper.updateComment(comment);
	}

	@Override
	public int deleteComment(int commentNo) {
		return this.commentMapper.deleteComment(commentNo);
	}

	@Override
	public List<CommentVO> getAllCommentsByPost(int postNo) {
		return this.commentMapper.getAllCommentsByPost(postNo);
	}

	@Override
	public List<CommentVO> getCommentsByUser(String username) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
