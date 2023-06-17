package com.trippo.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TripReviewFormController {

	@GetMapping("/trip_review_form")
	public String tripReviewForm() {
		
		return "trip_review_form/trip_review_form";
	}
	
}
