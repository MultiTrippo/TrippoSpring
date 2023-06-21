package com.tripreview.service;

import java.util.List;

import com.tripreview.vo.TripReviewVO;

public interface TripReviewService {
	
	public List<TripReviewVO> getAllList();
	
	public TripReviewVO getOneReview(int review_num);
	
	public int insertReview(TripReviewVO review);


}
