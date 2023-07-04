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
public class BoardViewController {
	
	@Autowired
	private PostService pService;
	
	//@GetMapping("/boardList")
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(Model model) {
		List<PostVO> foodList = pService.getFilteredPosts("Food", null, null);
		List<PostVO> PhotoSpotList = pService.getFilteredPosts("PhotoSpot", null, null);
		List<PostVO> AttractionList = pService.getFilteredPosts("Attraction", null, null);
		model.addAttribute("foodList", foodList);
		model.addAttribute("PhotoSpotList", PhotoSpotList);
		model.addAttribute("AttractionList", AttractionList);
		return "board/boardList";
	}
	
}
