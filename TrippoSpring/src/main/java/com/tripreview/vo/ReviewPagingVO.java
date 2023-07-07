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
