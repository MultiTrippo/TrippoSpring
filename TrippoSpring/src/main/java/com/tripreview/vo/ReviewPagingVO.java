package com.tripreview.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ReviewPagingVO{
	
	private int currPage; //현재 페이지
	private int amount; // 한 페이지당 보여줄 게시글 수
	private int colsNum; //mysql문법시 사용할 숫자

	private ReviewPagingVO(){
		
	}
	
	private ReviewPagingVO(int currPage, int amount) {

		this.currPage = currPage;
		this.amount = amount;
		this.colsNum = (currPage-1) * amount;
	}
	
	private int totalReviews; // 총 게시글 수
	private int totalPages; //총 페이지 수
		
	private boolean prev;
	private boolean next;	
	
	
	//		currPage	(currPage-1)*amount		amount
	//currPage가 1페이지일때 0번째컬럼(1번째글)부터, 3개씩보여주기
	//			2페이지일때 3번째컬럼(4번째글)부터, 3개씩보여주기
	//			3페이지일때 6번째컬럼(7번째글)부터, 3개씩보여주기
	
	private void pageSetting() {
		
		this.totalPages = (totalReviews%amount == 0)? totalReviews/amount : totalReviews/amount+1;

	}
	
}
