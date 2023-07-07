package com.tripreview.mapper;

import java.util.List;

import com.tripreview.vo.Criteria;
import com.tripreview.vo.TripReviewVO;

public interface TripReviewMapper {
	
	public List<TripReviewVO> getAllList();	
	
	public TripReviewVO getOneReview(int review_num);	
	
	public int insertReview(TripReviewVO review);
	
	public int deleteReview(int review_num);
	
	public int modifyReviewComplete(TripReviewVO review);
		
	public List<TripReviewVO> getAllListWithPaging(Criteria cri);
	
	public int getTotalReviewsCnt(Criteria cri);
	
	public void updateViewCnt(int review_num);
	
	
	
	
}
