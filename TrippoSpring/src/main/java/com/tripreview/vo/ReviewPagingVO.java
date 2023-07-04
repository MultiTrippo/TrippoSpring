package com.tripreview.vo;

import lombok.Data;

@Data
public class ReviewPagingVO{
	
	private Criteria cri;
	private int totalReviews; // 총 게시글 수 ==
	
	private int paginationSize = 10; //페이지네이션 크기 ==	
	private int firstBlock; //페이지네이션의 첫번째 블럭 ==
	private int lastBlock; //페이지네이션의 마지막 블럭 ==
		
	private boolean prev; //==
	private boolean next; //==
	
	public ReviewPagingVO(Criteria cri, int totalReviews) {
		
		this.cri = cri;
		this.totalReviews = totalReviews;
		
		this.lastBlock = (int) (Math.ceil(cri.getCurrPage() / (double) paginationSize) * paginationSize);		
		this.firstBlock = (lastBlock - paginationSize) + 1;
	        
		int tempEndPage = (int) (Math.ceil(totalReviews / (double) cri.getAmount()));    
		this.lastBlock = (tempEndPage < lastBlock)? tempEndPage : lastBlock;
		
		this.prev = (this.firstBlock > 1); 
        this.next = (this.lastBlock < tempEndPage);
				
        
        
      }


}
