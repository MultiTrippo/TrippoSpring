package com.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.board.model.PostVO;

@Repository
@Mapper
public interface PostMapper {
	//포스트 생성 또는 수정, 삭제
    int createPost(PostVO post);
    int updatePost(PostVO post);
    int deletePost(int postNo);
    
    //포스트 가져오기
    PostVO getPostById(int postNo);
    List<PostVO> getAllPosts();
    List<PostVO> getNextCategoryPost(String category, int postNo);
    List<PostVO> getFilteredPosts(Map<String, String> map);

    
    int getNumAllPosts();
    int getNumFilteredPosts(String category, String country, String city);

    //조회수 증가
    int increaseViews(int postNo);
    //좋아요수 증가
    int increaseLikes(int postNo);
}
