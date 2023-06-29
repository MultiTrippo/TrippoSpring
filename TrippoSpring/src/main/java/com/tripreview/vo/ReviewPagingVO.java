package com.tripreview.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ReviewPagingVO{
	
	private int currPage; //���� ������
	private int amount; // �� �������� ������ �Խñ� ��
	private int colsNum; //mysql������ ����� ����

	private ReviewPagingVO(){
		
	}
	
	private ReviewPagingVO(int currPage, int amount) {

		this.currPage = currPage;
		this.amount = amount;
		this.colsNum = (currPage-1) * amount;
	}
	
	private int totalReviews; // �� �Խñ� ��
	private int totalPages; //�� ������ ��
		
	private boolean prev;
	private boolean next;	
	
	
	//		currPage	(currPage-1)*amount		amount
	//currPage�� 1�������϶� 0��°�÷�(1��°��)����, 3���������ֱ�
	//			2�������϶� 3��°�÷�(4��°��)����, 3���������ֱ�
	//			3�������϶� 6��°�÷�(7��°��)����, 3���������ֱ�
	
	private void pageSetting() {
		
		this.totalPages = (totalReviews%amount == 0)? totalReviews/amount : totalReviews/amount+1;

	}
	
}
