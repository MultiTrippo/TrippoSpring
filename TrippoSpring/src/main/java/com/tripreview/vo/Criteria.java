package com.tripreview.vo;

import lombok.Data;

@Data
public class Criteria {
	
	private int currPage;
	private int amount = 10;
	
	//currPage	(currPage-1)*amount		amount
	//1페이지일때 	0번째컬럼(1번째글)부터, 		3개씩보여주기
	//2페이지일때 	3번째컬럼(4번째글)부터, 		3개씩보여주기
	//3페이지일때 	6번째컬럼(7번째글)부터, 		3개씩보여주기	
		
	public int getColsNum() {
		
		return (currPage-1) * amount;
	}
	
	public void setCurrPage(int currPage) {
		
		if(currPage<=0) {
			this.currPage = 1;
		}else {
			this.currPage = currPage;
		}
	}
	
	public void setAmount(int amount) {
		
		if(this.amount != amount) {
			this.amount = this.amount;
		}else {
			this.amount = amount;
		}
	}
	
	
}
