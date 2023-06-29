package com.tripreview.mapper;

import java.util.List;

import com.tripreview.vo.ReviewPagingVO;
import com.tripreview.vo.TripReviewVO;

public interface TripReviewMapper {
	
	public List<TripReviewVO> getAllList();

	public List<TripReviewVO> getAllListWithPaging(ReviewPagingVO paging);
	
	public TripReviewVO getOneReview(int review_num);	
	
	public int insertReview(TripReviewVO review);
	
	public int deleteReview(int review_num);
	
	/* public int modifyReview(int review_num); */

	public int modifyReviewComplete(TripReviewVO review);
	
	public List<TripReviewVO> searchByCityName(String cityName);
	
	
}
