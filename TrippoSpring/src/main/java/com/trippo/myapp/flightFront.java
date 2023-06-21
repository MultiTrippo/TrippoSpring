package com.trippo.myapp;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class flightFront {
	
	@RequestMapping(value="/flightQuery", method=RequestMethod.GET)
	public String flightQuery() {
		
		return "flight/fightQuery";
	}
	
	public static void main(String[] args) {
	
		
	}

}
