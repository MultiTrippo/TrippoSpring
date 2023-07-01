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
	

    public void setTotalReviews(int totalReviews) {
        this.totalReviews = totalReviews;
        calcPages();
    }
	public void calcPages() {
		
		lastBlock = (int) (Math.ceil(cri.getCurrPage() / (double) paginationSize) * paginationSize);		
		firstBlock = (lastBlock - paginationSize) + 1;
        
        int tempEndPage = (int) (Math.ceil(totalReviews / (double) cri.getAmount()));    
        if(lastBlock > tempEndPage) {
        	lastBlock = tempEndPage;
        }
        
        prev = (firstBlock==1)? false : true;    
        next = (lastBlock*cri.getAmount() >= totalReviews)? false : true;
	}
}
