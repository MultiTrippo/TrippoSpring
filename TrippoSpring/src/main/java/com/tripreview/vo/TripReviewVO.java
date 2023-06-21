package com.tripreview.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TripReviewVO {	
	
//	private int review_num;
//    private String user_id;
//    private int view_count;
//    private String review_title;
//    private Date created_at;
//    private String twhere;
//    private Date twhen;
//    private String twith;
//    private String details;
	
	/*
	review_num int(10) not null auto_increment primary key,
    user_id varchar(20) not null unique,
    view_count int(5) default 0,
    review_title varchar(50),
    created_at timestamp default current_timestamp
    */
	
	private int review_num;
	private String user_id;
	private int view_count;
	private String review_title;
	private Date created_at;
	
	@Override
	public String toString() {
		return "TripReviewVO [review_num=" + review_num + ", user_id=" + user_id + ", view_count=" + view_count
				+ ", review_title=" + review_title + ", created_at=" + created_at + "]";
	}
	
	

}
