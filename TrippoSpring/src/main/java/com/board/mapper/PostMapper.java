package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.board.model.PostVO;

@Repository
@Mapper
public interface PostMapper {
    // 포스트 생성 또는 수정, 삭제
    int createPost(PostVO post);
    int updatePost(PostVO post);
    int deletePost(int postId);

    // 포스트 가져오기
    PostVO getPostById(int postId);
    List<PostVO> getAllPosts();
    List<PostVO> getNextCategoryPost(@Param("category") String category, @Param("postId") int postId);
    List<PostVO> getFilteredPosts(
        @Param("category") String category,
        @Param("country") String country,
        @Param("city") String city
    );

    int getNumAllPosts();
    int getNumFilteredPosts(
        @Param("category") String category,
        @Param("country") String country,
        @Param("city") String city
    );

    // 조회수 증가
    int increaseViews(int postId);
    // 좋아요수 증가
    int increaseLikes(int postId);
}
