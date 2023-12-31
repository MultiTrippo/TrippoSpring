package com.schedule.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.vo.MemberVO;
import com.schedule.db.ScheduleListVO;
import com.schedule.service.ScheduleService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ScheduleListController {
	
	
	@Autowired
	private ScheduleService service;
	

	@RequestMapping(value="/scheduleList", method = RequestMethod.GET)
	public String getAllScheduleList(Model model, HttpSession session) {
		MemberVO mvo= (MemberVO)session.getAttribute("loginUser");
		
		if (mvo == null) {
	        return "redirect:/login";
	    }
		
		model.addAttribute("id", mvo.getId());

		System.out.println("id" + mvo.getId());
		
		 
		

		List<ScheduleListVO> list = service.getAllScheduleList(mvo.getId());
		model.addAttribute("getAllScheduleList", list);

		System.out.println("getList : =" + list);

		return "schedule/trav_list";
	}

	@PostMapping(value="ScheduleInsert", produces = "application/json")
	@ResponseBody
	public ModelMap insertSchedule(Model model, HttpSession session, ScheduleListVO s) {
		
		MemberVO mvo= (MemberVO)session.getAttribute("loginUser");
		model.addAttribute("id", mvo.getId());
		
		System.out.println("#Schedule List controller getId : " + mvo.getId());
		System.out.println("#controller getTrav_title : " + s.getTrav_title());

		// 소문자, 대문자, 숫자를 조합하여 랜덤한 page_id 생성
		String pageId = generateRandomPageId();
		s.setPage_id(pageId);
		s.setId(mvo.getId());

		int se = service.insertSchedule(s);
		System.out.println("se :" + se);
		System.out.println("pageId: " + pageId);

		if(se == 1) {
			System.out.println("controller : Schedule 입력 성공");
		} else {
			System.out.println("controller : Schedule 입력 실패");
		}

		ModelMap map = new ModelMap();
		map.put("page_id", s.getPage_id());

		return map;
	}

	private String generateRandomPageId() {
		String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		int length = 5;
		Random random = new Random();
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int index = random.nextInt(characters.length());
			sb.append(characters.charAt(index));
		}

		return sb.toString();
	}

	@PostMapping(value="/scheduleUpdate", produces = "application/json")
	@ResponseBody
	public ModelMap updateSchedule(Model model, @RequestParam("page_id") String pageId, HttpSession session, ScheduleListVO s) {
		
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		model.addAttribute("up-id", mvo.getId());
		
		System.out.println("#List Controller page_id" + s.getPage_id());
		System.out.println("#List Controller id" + s.getId());
		
		s.setId(mvo.getId());
		
		int se = service.updateSchedule(s);
		System.out.println("#se : " + se);

		if(se == 1) {
			System.out.println("controller : Schedule 수정 성공");
		} else {
			System.out.println("controller : Schedule 수정 실패");
		}

		ModelMap map = new ModelMap();
		map.put("page_id", s.getPage_id());
		return map;
	}

	@PostMapping(value="/scheduleDelete", produces = "application/json")
	@ResponseBody
	public ModelMap deleteSchedule(Model model, @RequestParam("page_id") String pageId, HttpSession session, ScheduleListVO s) {
		System.out.println("#List Controller page_id : " + s.getPage_id());
		
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		model.addAttribute("id", mvo.getId());

		s.setId(mvo.getId());
		int se = service.deleteSchedule(s);
		System.out.println("#se : " + se);

		if(se == 1) {
			System.out.println("controller : Schedule 삭제 성공");
		} else {
			System.out.println("controller : Schedule 삭제 실패");
		}

		ModelMap map = new ModelMap();
		map.put("page_id", s.getPage_id());
		return map;
	}

}
