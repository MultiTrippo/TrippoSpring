package com.acom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AcomlistController {

	//@RequestMapping(value="/acom", method=RequestMethod.GET)
	@GetMapping("/acomlist")
	public String acomlist() {
		return "acomview/acomlist";
	}
	
}
