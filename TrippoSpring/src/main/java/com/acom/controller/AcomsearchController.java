package com.acom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AcomsearchController {

	//@RequestMapping(value="/acom", method=RequestMethod.GET)
	@GetMapping("/Acomsearch")
	public String acom() {
		return "acomview/Acomsearch";
	}
	@PostMapping("/Acomsearch")
	public String processForm(@RequestParam("check-in") String checkInDate,
	                          @RequestParam("check-out") String checkOutDate,
	                          Model model) {
	    // Process the selected dates
	    // ...
	    
	    // Add dates to the model for further processing or display
	    model.addAttribute("checkInDate", checkInDate);
	    model.addAttribute("checkOutDate", checkOutDate);
	    
	    // Return the appropriate view
	    return "confirmation";
	}
}