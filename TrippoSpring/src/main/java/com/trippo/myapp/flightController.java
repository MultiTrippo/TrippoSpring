package com.trippo.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class flightController {

	@GetMapping("/trip_flight_page")
	public String tripFlightPage() {
		
		return "/trip_flight_page";
	}
	
}