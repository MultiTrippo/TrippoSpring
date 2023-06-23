package com.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.board.model.PostVO;

@Service
public interface PostService {
	//포스트 생성 또는 수정, 삭제
    int createPost(PostVO post);
    int updatePost(PostVO post);
    int deletePost(int postId);
    
    //포스트 가져오기
    PostVO getPostById(int postId);
    List<PostVO> getAllPosts();
    List<PostVO> getNextCategoryPost(String category, int postId);
    List<PostVO> getFilteredPosts(String category, String country, String city);
    
    int getNumAllPosts();
    int getNumFilteredPosts(String category, String country, String city);

    //조회수 증가
    int increaseViews(int postId);
    //좋아요수 증가
    int increaseLikes(int postId);
}
