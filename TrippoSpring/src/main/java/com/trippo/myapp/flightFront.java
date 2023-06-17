package com.trippo.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class flightFront {
	
	@RequestMapping(value="/flightQuery", method=RequestMethod.GET)
	public String flightQuery() {
		
		return "flight/fightQuery";
	}


}
