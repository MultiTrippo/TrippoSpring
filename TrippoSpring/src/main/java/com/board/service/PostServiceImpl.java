package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.mapper.PostMapper;
import com.board.model.PostVO;

@Service("postService")
public class PostServiceImpl implements PostService {
	
	@Inject
	private PostMapper postMapper;
	
	@Override
	public int createPost(PostVO post) {
		return this.postMapper.createPost(post);
	}

	@Override
	public int updatePost(PostVO post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePost(int postId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PostVO getPostById(int postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PostVO> getAllPosts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PostVO> getNextCategoryPost(String category, int postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PostVO> getFilteredPosts(String category, String country, String city) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNumAllPosts() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNumFilteredPosts(String category, String country, String city) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseViews(int postId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseLikes(int postId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
