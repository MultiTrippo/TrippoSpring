package com.tripreview.vo;

import lombok.Data;

@Data
public class ReviewPagingVO{
	
	private Criteria cri;
	private int totalReviews; // �� �Խñ� �� ==
	
	private int paginationSize = 10; //���������̼� ũ�� ==	
	private int firstBlock; //���������̼��� ù��° �� ==
	private int lastBlock; //���������̼��� ������ �� ==
		
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
