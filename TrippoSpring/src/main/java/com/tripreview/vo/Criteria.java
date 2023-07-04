package com.tripreview.vo;

import lombok.Data;

@Data
public class Criteria {
	
	private int currPage;
	private int amount;
	private int colsNum;		
	
	private String keyword;
	
	public Criteria() {
		this(1, 10);		
		this.colsNum = 0;
	}
	
	public Criteria(int currPage, int amount) {
		this.currPage = currPage;
		this.amount = amount;
		this.colsNum = (currPage-1) * amount;
	}
	
	public void setCurrPage(int currPage) {		
		this.colsNum = (currPage-1) * amount;
		this.currPage = currPage;
	}
	
	public void setAmount(int amount) {		
		this.colsNum = (currPage-1) * amount;
		this.amount = amount;
	}
	
	public void setColsNum(int colsNum) {
		this.colsNum = colsNum;
	}
		
}
