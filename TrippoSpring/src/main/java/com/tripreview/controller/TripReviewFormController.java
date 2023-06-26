package com.tripreview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tripreview.service.TripReviewService;
import com.tripreview.vo.TripReviewVO;

@Controller
public class TripReviewFormController {
	
	@Autowired
    private TripReviewService service;

	
	/** 후기 작성하러 가기*/
	@RequestMapping(value = "/trip_review_form", method = RequestMethod.GET)
	public String tripReviewForm() {
		
		return "trip_review/trip_review_form";
	}
	
	/** 후기 작성완료 */
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
	
	/** 모든 후기 리스트 보기 */
	@RequestMapping(value = "/trip_review_list", method = RequestMethod.GET)
	public String getAllList(Model model){
				
		List<TripReviewVO> list = service.getAllList();
		model.addAttribute("getAllList", list);
		
		return "trip_review/trip_review_list"; 
	}
	
	/** 선택한 후기 한개 조회하기 */
	@RequestMapping(value = "/viewOneReview", method = RequestMethod.GET)
	public String getOneReview(@RequestParam("review_num") int review_num, Model model) {
	
		System.out.println("조회하는 후기번호: "+ review_num);
		
		TripReviewVO selectedReview = service.getOneReview(review_num);
		model.addAttribute("selectedReview", selectedReview);
		
		return "trip_review/trip_review_view";
	}
	
	
	/** 선택한 후기 한개 삭제하기 */
	@RequestMapping(value = "/deleteReview", method = RequestMethod.GET)
	public String deleteReview(@RequestParam("review_num") int review_num) {
		
		int n = service.deleteReview(review_num);
		if(n==1) {
			System.out.println("삭제하는 후기번호: "+ review_num);	
			System.out.println("controller: 글삭제 완료");	
		}else {
			System.out.println("controller: 글삭제 실패");
		}
		
		return "redirect:trip_review_list";
	}
	
	/** 후기 수정하러가기 */
	@RequestMapping(value = "/modifyReview", method = RequestMethod.GET)
	public String modifyReview(Model model, @RequestParam("review_num") int review_num) {
		System.out.println("수정하러가기 controller : "+ review_num+"번 후기");
				
		TripReviewVO selectedReview = service.getOneReview(review_num);
		model.addAttribute("selectedReview", selectedReview);
		
		return "trip_review/trip_review_modify";
	}
	
	/** 수정 완료 */
	@RequestMapping(value = "/modifyReviewComplete", method = RequestMethod.POST)
	public String modifyReviewComplete(Model model, @ModelAttribute TripReviewVO review) {
		System.out.println("reviewCompleteController "+review.getReview_title());
		System.out.println("reviewCompleteController "+review.getUser_id());
		
		int n = service.modifyReviewComplete(review);
		if(n==1) {
			System.out.println("controller: 글수정 완료");
		}else {
			System.out.println("controller: 글수정 삭제");
		}
		return "redirect:trip_review_list";
	}
	

	
}