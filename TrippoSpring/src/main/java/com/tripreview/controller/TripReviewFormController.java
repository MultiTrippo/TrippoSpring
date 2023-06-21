package com.tripreview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripreview.service.TripReviewService;
import com.tripreview.vo.TripReviewVO;

@Controller
public class TripReviewFormController {
	
	@Autowired
    private TripReviewService service;

	@RequestMapping(value = "/trip_review_form", method = RequestMethod.GET)
	public String tripReviewForm() {
		
		return "trip_review/trip_review_form";
	}
	
	@RequestMapping(value = "/trip_review_list", method = RequestMethod.GET)
	public String getAllList(Model model){
				
		List<TripReviewVO> list = service.getAllList();
		model.addAttribute("getAllList", list);
		
		return "trip_review/trip_review_list"; 
	}
	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String insertReview(Model model, @ModelAttribute TripReviewVO review) {
		System.out.println("#controller getReview_title: "+review.getReview_title());
		System.out.println("#controller getUser_id: "+review.getUser_id());
		
		int n = service.insertReview(review);
		System.out.println("#n: "+n);
		if(n==1) {
			System.out.println("controller : 글쓰기 성공-----");
		}else {
			System.out.println("controller : 글작성 실패-----");
		}
		
		return "redirect:trip_review_list";
	}
	
	@RequestMapping(value = "/viewOneReview", method = RequestMethod.GET)
	public String getOneReview(@RequestParam("review_num") int review_num, Model model) {
	
		System.out.println("조회하는 후기번호: "+ review_num);
		
		TripReviewVO selectedReview = service.getOneReview(review_num);
		model.addAttribute("selectedReview", selectedReview);
		
		return "trip_review/trip_review_view";
	}
	
}