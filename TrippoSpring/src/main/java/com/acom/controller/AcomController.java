package com.acom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.acom.model.AcomVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AcomController {

	//@RequestMapping(value="/acom", method=RequestMethod.GET)
	@GetMapping("/acom")
	public String acom(@RequestParam String hotel_id, Model model) {
		//log.info("hotel_id: "+hotel_id);
		model.addAttribute("hotel_id",hotel_id);
		return "acomview/acom";
	}
	//@RequestMapping(value="/acom", method=RequestMethod.GET)
	@GetMapping("/acomlist")
	public String acomlist(@ModelAttribute AcomVO AcomVO, HttpSession session) {
		//log.info(AcomVO);
		session.setAttribute("acom", AcomVO);
		return "acomview/acomlist";
	}
	
	
}
