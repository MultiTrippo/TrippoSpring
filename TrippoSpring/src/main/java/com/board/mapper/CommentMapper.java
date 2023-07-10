package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.board.model.CommentVO;

@Repository
@Mapper
public interface CommentMapper {
	//댓글 생성, 수정, 삭제
	int createComment(CommentVO comment);
	int updateComment(CommentVO comment);
	int deleteComment(int commentNo);
	
	//댓글 가져오기
	List<CommentVO> getAllCommentsByPost(int postNo);
	List<CommentVO> getCommentsByUser(String username);
}
