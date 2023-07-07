package com.board.service;

import java.util.List;
import java.util.Map;

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
	public int deletePost(int postNo) {
		return this.postMapper.deletePost(postNo);
	}

	@Override
	public PostVO getPostById(int postNo) {
		return this.postMapper.getPostById(postNo);
	}

	@Override
	public List<PostVO> getAllPosts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PostVO> getNextCategoryPost(String category, int postNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PostVO> getFilteredPosts(Map<String, String> map) {
		return this.postMapper.getFilteredPosts(map);
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
	public int increaseViews(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseLikes(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
