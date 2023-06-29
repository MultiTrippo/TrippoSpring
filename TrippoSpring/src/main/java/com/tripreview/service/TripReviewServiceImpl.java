package com.tripreview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripreview.mapper.TripReviewMapper;
import com.tripreview.vo.ReviewPagingVO;
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
	public List<TripReviewVO> getAllListWithPaging(ReviewPagingVO paging){
		
		return this.mapper.getAllListWithPaging(paging);
	}
	
	@Override
	public TripReviewVO getOneReview(int review_num){
		
		return this.mapper.getOneReview(review_num);
	}
	
	@Override
	public int insertReview(TripReviewVO review) {
		
		System.out.println("service : �� �ۼ� �Ϸ�");		
		return this.mapper.insertReview(review);
	}
	
	@Override
	public int deleteReview(int review_num) {
		
		System.out.println("service: �� ���� �Ϸ�");
		return this.mapper.deleteReview(review_num);
	}
	
	/*
	 * @Override public int modifyReview(int review_num) {
	 * 
	 * System.out.println("service: �ش� �� �����Ϸ� ����"); return
	 * this.mapper.modifyReview(review_num); }
	 */
	
	@Override
	public int modifyReviewComplete(TripReviewVO review){
		
		System.out.println("service: ���� �Ϸ�");
		return this.mapper.modifyReviewComplete(review);
	}
	
	@Override
	public List<TripReviewVO> searchByCityName(String cityName){
		
		System.out.println("service: searchByCityName(cityName)");
		return this.mapper.searchByCityName(cityName);
	}
}
