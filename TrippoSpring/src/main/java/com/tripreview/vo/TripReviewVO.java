package com.tripreview.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TripReviewVO {	
	
	private int review_num;
	private String review_title;
	private String user_id;
	private Date created_at;
	private int view_count;
	private String wwhere;
	private Date wwhen1;
	private Date wwhen2;
	private String wwith;
	private int expence;	
	private String contents;

}
