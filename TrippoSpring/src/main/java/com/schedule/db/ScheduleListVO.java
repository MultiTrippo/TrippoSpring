package com.schedule.db;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScheduleListVO {
	private String id;
	private String page_id;
	private Date trav_date;
	private String trav_title;
	
	@Override
	public String toString() {
		return "ScheduleListVO [ id : " + id  + ", page_id : "	+ page_id + ", trav_date : " + trav_date + ", trav_title : " + trav_title;
	}
}
