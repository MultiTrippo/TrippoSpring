package com.acom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AcomController {

	//@RequestMapping(value="/acom", method=RequestMethod.GET)
	@GetMapping("/acom")
	public String acom() {
		return "acomview/acom";
	}
	
}
