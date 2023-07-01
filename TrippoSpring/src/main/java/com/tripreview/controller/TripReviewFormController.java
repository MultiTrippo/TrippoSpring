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
import com.tripreview.vo.Criteria;
import com.tripreview.vo.ReviewPagingVO;
import com.tripreview.vo.TripReviewVO;

@Controller
public class TripReviewFormController {
	
	@Autowired
    private TripReviewService service;

	
	/** �ı� �ۼ��Ϸ� ����*/
	@RequestMapping(value = "/trip_review_form", method = RequestMethod.GET)
	public String tripReviewForm() {
		
		return "trip_review/trip_review_form";
	}
	
	/** �ı� �ۼ��Ϸ� */
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String insertReview(Model model, @ModelAttribute TripReviewVO review) {
		System.out.println("#controller getReview_title: "+review.getReview_title());
		System.out.println("#controller getUser_id: "+review.getUser_id());
		
		int n = service.insertReview(review);
		System.out.println("#n: "+n);
		if(n==1) {
			System.out.println("controller : �۾��� ����-----");
		}else {
			System.out.println("controller : ���ۼ� ����-----");
		}
		
		return "redirect:trip_review_list";
	}
	
//	/** ��� �ı� ����Ʈ ���� */
//	@RequestMapping(value = "/trip_review_list", method = RequestMethod.GET)
//	public String getAllList(Model model){
//				
//		List<TripReviewVO> list = service.getAllList();
//		model.addAttribute("getAllList", list);
//		
//		return "trip_review/trip_review_list"; 
//	}
	
	/** ��� �ı� ����Ʈ ���� + ����¡ ó�� */
	@RequestMapping(value = "/trip_review_list", method = RequestMethod.GET)
	public String getAllListWithPaging(Model model, @RequestParam(defaultValue = "1") int viewPage){
													//view�� url���� ?���� queryName�� �������� ��ġ�ϴ°����� RequestParam ���´�
		System.out.println("controller�� page: " + viewPage); 
		
		//Criteria
		Criteria cri = new Criteria();
		cri.setCurrPage(viewPage);
		
		//�� ������ ��
		int totalReviews = service.getTotalReviewsCnt();
		
		//����¡VO
		ReviewPagingVO pagingVO = new ReviewPagingVO();
		pagingVO.setCri(cri);
		pagingVO.setTotalReviews(totalReviews);
		
		List<TripReviewVO> list = service.getAllListWithPaging(cri);

		model.addAttribute("getAllListWithPaging", list);
		model.addAttribute("pagingVO", pagingVO);
		
		return "trip_review/trip_review_list"; 
	}
	
	/** �˻���� �ı� ��ȸ�ϱ� (+ ����¡ ó��) */
	@RequestMapping(value = "/searchReview", method = RequestMethod.GET)
	public String searchReviewsByKeyword(@RequestParam("keyword") String keyword, Model model) {

		System.out.println("keyword: "+keyword);
		
		return "trip_review/trip_review_search";
	}
	
	/** ������ �ı� �Ѱ� ��ȸ�ϱ� */
	@RequestMapping(value = "/viewOneReview", method = RequestMethod.GET)
	public String getOneReview(@RequestParam("review_num") int review_num, Model model) {
	
		System.out.println("��ȸ�ϴ� �ı��ȣ: "+ review_num);
		
		TripReviewVO selectedReview = service.getOneReview(review_num);
		model.addAttribute("selectedReview", selectedReview);
		
		return "trip_review/trip_review_view";
	}
	
	/** ������ �ı� �Ѱ� �����ϱ� */
	@RequestMapping(value = "/deleteReview", method = RequestMethod.GET)
	public String deleteReview(@RequestParam("review_num") int review_num) {
		
		int n = service.deleteReview(review_num);
		if(n==1) {
			System.out.println("�����ϴ� �ı��ȣ: "+ review_num);	
			System.out.println("controller: �ۻ��� �Ϸ�");	
		}else {
			System.out.println("controller: �ۻ��� ����");
		}
		
		return "redirect:trip_review_list";
	}
	
	/** �ı� �����Ϸ����� */
	@RequestMapping(value = "/modifyReview", method = RequestMethod.GET)
	public String modifyReview(Model model, @RequestParam("review_num") int review_num) {
		System.out.println("�����Ϸ����� controller : "+ review_num+"�� �ı�");
				
		TripReviewVO selectedReview = service.getOneReview(review_num);
		model.addAttribute("selectedReview", selectedReview);
		
		return "trip_review/trip_review_modify";
	}
	
	/** ���� �Ϸ� */
	@RequestMapping(value = "/modifyReviewComplete", method = RequestMethod.POST)
	public String modifyReviewComplete(Model model, @ModelAttribute TripReviewVO review) {
		System.out.println("reviewCompleteController "+review.getReview_title());
		System.out.println("reviewCompleteController "+review.getUser_id());
		
		int n = service.modifyReviewComplete(review);
		if(n==1) {
			System.out.println("controller: �ۼ��� �Ϸ�");
		}else {
			System.out.println("controller: �ۼ��� ����");
		}
		return "redirect:trip_review_list";
	}
	

	
}