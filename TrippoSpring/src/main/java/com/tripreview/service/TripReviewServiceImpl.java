package com.tripreview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripreview.mapper.TripReviewMapper;
import com.tripreview.vo.TripReviewVO;

@Service("tripReviewService")
public class TripReviewServiceImpl implements TripReviewService {
	
	@Autowired
	private TripReviewMapper mapper;



	@Override
	public List<TripReviewVO> getAllList() {
		
		return this.mapper.getAllList();
	}
	
	@Override
	public TripReviewVO getOneReview(int review_num){
		
		return this.mapper.getOneReview(review_num);
	}
	
	@Override
	public int insertReview(TripReviewVO review) {
		
		System.out.println("service : 글 작성 완료");		
		return this.mapper.insertReview(review);
	}

}
