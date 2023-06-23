package com.schedule.db;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EtcVO {
	private int etc_id; // int로 하면 에러가 나기 때문에 
	private String page_id;
	private String etc;
	
	@Override
	public String toString() {
		return "EtcVO [etc_id=" + etc_id + ", page_id : " + page_id + ", etc" + etc + "]";
	}
}
