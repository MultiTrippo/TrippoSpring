package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.model.PostVO;
import com.board.service.PostService;

@Controller
public class BoardShowController {
	
	@Autowired
	private PostService pService;
	
	@RequestMapping(value="/showDetails", method=RequestMethod.GET)
	public String boardShow() {
		return "board/boardShowDetails";
	}
	
}