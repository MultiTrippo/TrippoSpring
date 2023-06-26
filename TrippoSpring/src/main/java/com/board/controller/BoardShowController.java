package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardShowController {

	@RequestMapping(value="/showDetails", method=RequestMethod.GET)
	public String boardShow() {
		return "board/boardShowDetails";
	}
	
}