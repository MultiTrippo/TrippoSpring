package com.schedule.db;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FixVO {
	private int fix_id;
	private String page_id;
	private String lat;
	private String lng;
	private String p_name;
	private String p_memo;
	private String p_color;
	
	@Override
	public String toString() {
		return "FixVO [fix_id : " + fix_id + ", page_id : " + page_id + ", lat :  " + lat + ", lng : " 
				+ lng + ", p_name : " + p_name + ", p_memo : " + p_memo + ", p_color : " + "p_color";  
	}
}
