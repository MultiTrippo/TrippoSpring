package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardViewController {

	//@RequestMapping(value="/boardList", method=RequestMethod.GET)
	@GetMapping("/boardList")
	public String boardList() {
		return "board/boardList";
	}
	
}
