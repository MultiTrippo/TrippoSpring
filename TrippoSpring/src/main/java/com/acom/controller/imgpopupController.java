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
public class imgpopupController {

	//@RequestMapping(value="/acom", method=RequestMethod.GET)222
	@GetMapping("/imgpopup")
	public String imgpopup(@RequestParam String hotel_id, Model model) {
		log.info("hotel_id: "+hotel_id);
		model.addAttribute("hotel_id",hotel_id);
		return "acomview/imgpopup";
	}
}