package com.tripreview.vo;

import lombok.Data;

@Data
public class Criteria {
	
	private int currPage;
	private int amount = 10;
	
	//currPage	(currPage-1)*amount		amount
	//1�������϶� 	0��°�÷�(1��°��)����, 		3���������ֱ�
	//2�������϶� 	3��°�÷�(4��°��)����, 		3���������ֱ�
	//3�������϶� 	6��°�÷�(7��°��)����, 		3���������ֱ�	
		
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
