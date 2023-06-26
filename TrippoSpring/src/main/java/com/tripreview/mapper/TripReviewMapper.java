package com.tripreview.mapper;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.tripreview.vo.TripReviewVO;

public interface TripReviewMapper {
	
	public List<TripReviewVO> getAllList();
	
	public TripReviewVO getOneReview(int review_num);	
	
	public int insertReview(TripReviewVO review);
	
	public int deleteReview(int review_num);
	
	/* public int modifyReview(int review_num); */

	public int modifyReviewComplete(TripReviewVO review);
}
