package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardAddController {

	//@GetMapping("/addPost")
	@RequestMapping(value="/addPost", method=RequestMethod.GET)
	public String boardAdd() {
		//jsp
		return "board/boardAdd"; 
	}
	
}
