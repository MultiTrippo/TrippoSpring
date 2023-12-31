package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.CommentVO;
import com.board.model.PostVO;
import com.board.service.CommentService;
import com.board.service.PostService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BoardShowController {
	
	@Autowired
	private PostService pService;
	@Autowired
	private CommentService cService;
	
//	@GetMapping(value="/boardShow", produces="application/json")
//	@ResponseBody
//	public PostVO boardShow(@RequestParam("postNo") int postNo, Model model) {
//		PostVO postDetail = pService.getPostById(postNo);
//
//        return postDetail;
//
//	}// boardShow -------------------------------------------
		
	@RequestMapping(value="/boardShow", method=RequestMethod.GET)
	public String boardShow(@RequestParam("postNo") int postNo, Model model, HttpSession session) {
		PostVO postDetail = pService.getPostById(postNo);
		List<CommentVO> commentList = cService.getAllCommentsByPost(postNo);
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String postJson = objectMapper.writeValueAsString(postDetail);
			model.addAttribute("postJson", postJson);
			
			ObjectMapper objectMapper2 = new ObjectMapper();
			String commentJson = objectMapper2.writeValueAsString(commentList);
			model.addAttribute("commentJson", commentJson);
			
			System.out.println(pService.getPostById(postNo).getWriter());
			model.addAttribute("showUsername", pService.getPostById(postNo).getWriter());
			model.addAttribute("postNo", postNo);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
		return "board/boardShow";
	}// boardShow -------------------------------------------
	


	@ResponseBody
	@PostMapping(value="/boardShowSend", produces="application/json")
	public ModelMap addComment(@RequestBody CommentVO comment) {
		//System.out.println("comment: "+comment);
		int n = cService.createComment(comment);
		List<CommentVO> commentList = cService.getAllCommentsByPost(comment.getPostNo());
		ModelMap map = new ModelMap();
		map.put("result", n);
		map.put("comment", commentList);
		return map;
	}
	
	@ResponseBody
	@PostMapping(value="/commentDelete", produces="application/json")
	public ModelMap deleteComment(@RequestParam int targetPostNo, @RequestParam int targetCommentNo) {
		int n = cService.deleteComment(targetCommentNo);
		List<CommentVO> commentList = cService.getAllCommentsByPost(targetPostNo);
		ModelMap map = new ModelMap();
		map.put("result", n);
		map.put("comment", commentList);
		return map;
	}
	
	@ResponseBody
	@PostMapping(value="/postDelete", produces="application/json")
	public ModelMap deletePost(@RequestParam int targetPostNo) {
		int n = pService.deletePost(targetPostNo);
		ModelMap map = new ModelMap();
		map.put("result", n);
		map.put("url", "/boardList");
		return map;
	}
	
//	@ResponseBody
//	@PostMapping(value="/postEdit", produces="application/json")
//	public ModelMap editPost (@RequestParam int targetPostNo) {
//		PostVO oldPost = pService.getPostById(targetPostNo);
//		int n = pService.updatePost(oldPost);
//		PostVO updatedPost = pService.getPostById(oldPost.getPostNo());
//		ModelMap map = new ModelMap();
//		map.put("result", n);
//		map.put("url", "/boardList");
//		map.put("post", updatedPost);
//		return map;
//	}
		
}//////////////////////////////////////////////////////////////