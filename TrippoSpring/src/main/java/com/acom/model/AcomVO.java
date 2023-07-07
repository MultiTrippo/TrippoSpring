package com.acom.model;

import lombok.Data;

@Data
public class AcomVO {
	private String arrival_date;
	private String departure_date;
	private String guest_qty;
	private String children_qty;
	private String room_qty;
	private String hotel_id;


// Constructors
	public AcomVO() {
	}

public AcomVO(String arrival_date,String departure_date, String guest_qty, String children_qty, String room_qty, String hotel_id) {
	this.arrival_date=arrival_date;
	this.departure_date = departure_date;
	this.guest_qty = guest_qty;
	this.children_qty = children_qty;
	this.room_qty = room_qty;
	this.hotel_id = hotel_id;
	
}

}
