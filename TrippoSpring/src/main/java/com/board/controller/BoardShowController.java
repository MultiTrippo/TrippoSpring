package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.model.PostVO;
import com.board.service.PostService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BoardShowController {
	
	@Autowired
	private PostService pService;
	
//	@GetMapping(value="/boardShow", produces="application/json")
//	@ResponseBody
//	public PostVO boardShow(@RequestParam("postNo") int postNo, Model model) {
//		PostVO postDetail = pService.getPostById(postNo);
//
//        return postDetail;
//
//	}// boardShow -------------------------------------------
		
	@RequestMapping(value="/boardShow", method=RequestMethod.GET)
	public String boardShow(@RequestParam("postNo") int postNo, Model model) {
		PostVO postDetail = pService.getPostById(postNo);
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String postJson = objectMapper.writeValueAsString(postDetail);
			model.addAttribute("postJson", postJson);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
		return "board/boardShow";
	}// boardShow -------------------------------------------
	
	
		
}//////////////////////////////////////////////////////////////