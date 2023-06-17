package com.trippo.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardViewController {

	@GetMapping("/boardList")
	public String boardList() {
		return "board/boardList";
	}
	
}
