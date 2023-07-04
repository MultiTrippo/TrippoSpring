package com.tripreview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripreview.mapper.TripReviewMapper;
import com.tripreview.vo.Criteria;
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
	public TripReviewVO getOneReview(int review_num){
		
		this.mapper.updateViewCnt(review_num); //조회수 증가
		return this.mapper.getOneReview(review_num);
	}
	
	@Override
	public int insertReview(TripReviewVO review) {
		
		System.out.println("service : 글 작성 완료");		
		return this.mapper.insertReview(review);
	}
	
	@Override
	public int deleteReview(int review_num) {
		
		System.out.println("service: 글 삭제 완료");
		return this.mapper.deleteReview(review_num);
	}
	
	@Override
	public int modifyReviewComplete(TripReviewVO review){
		
		System.out.println("service: 수정 완료");
		return this.mapper.modifyReviewComplete(review);
	}
	
	@Override
	public List<TripReviewVO> getAllListWithPaging(Criteria cri){
		
		System.out.println("service: getAllListWithPaging(cri)");
		return this.mapper.getAllListWithPaging(cri);
	}
	
	@Override
	public int getTotalReviewsCnt(Criteria cri) {
		
		System.out.println("service: getTotalReviewsCnt(cri)");
		return this.mapper.getTotalReviewsCnt(cri);
	}
	
	@Override
	public void updateViewCnt(int review_num) {
	
		System.out.println("service: updateViewCnt(review_num)");
	}
	

}
