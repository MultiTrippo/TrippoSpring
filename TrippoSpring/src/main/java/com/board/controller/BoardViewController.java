package com.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.model.PostVO;
import com.board.service.PostService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BoardViewController {
	
	@Autowired
	private PostService pService;
	
	//@GetMapping("/boardList")
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(Model model) {
		
		Map<String, String> map = new HashMap<>();
		map.put("category", "Food");
		//map.put("country", "일본");
		List<PostVO> foodList = pService.getFilteredPosts(map);
		
		map.put("category", "PhotoSpot");
		List<PostVO> PhotoSpotList = pService.getFilteredPosts(map);
		map.put("category", "Attraction");
		List<PostVO> AttractionList = pService.getFilteredPosts(map);
		model.addAttribute("foodList", foodList);
		model.addAttribute("PhotoSpotList", PhotoSpotList);
		model.addAttribute("AttractionList", AttractionList);
		
		// Food =========================================
		ObjectMapper objectMapper = new ObjectMapper();
	    String foodListJson;
	    try {
	        foodListJson = objectMapper.writeValueAsString(foodList);
	    } catch (JsonProcessingException e) {
	        foodListJson = "[]"; // 변환 실패 시 빈 배열로 초기화
	    }
	    System.out.println(foodListJson);
	    model.addAttribute("foodListJson", foodListJson);
	    
	    // Attraction ====================================
	    ObjectMapper objectMapper2 = new ObjectMapper();
	    String AttrListJson;
	    try {
	    	AttrListJson = objectMapper2.writeValueAsString(AttractionList);
	    } catch (JsonProcessingException e) {
	    	AttrListJson = "[]"; // 변환 실패 시 빈 배열로 초기화
	    }
	    model.addAttribute("AttrListJson", AttrListJson);
		
	    // Attraction ====================================
	    ObjectMapper objectMapper3 = new ObjectMapper();
	    String PhotoSpotListJson;
	    try {
	    	PhotoSpotListJson = objectMapper3.writeValueAsString(PhotoSpotList);
	    } catch (JsonProcessingException e) {
	    	PhotoSpotListJson = "[]"; // 변환 실패 시 빈 배열로 초기화
	    }
	    model.addAttribute("PhotoSpotListJson", PhotoSpotListJson);
	    
		return "board/boardList";
	}
	
}
