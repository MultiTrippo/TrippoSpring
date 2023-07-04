package com.schedule.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.schedule.db.ScheduleListVO;
import com.schedule.service.ScheduleService;

@Controller
public class ScheduleListController {
	@Autowired
	private ScheduleService service; 
	
	@RequestMapping(value="/scheduleList", method = RequestMethod.GET)
	public String getAllScheduleList(Model model, @RequestParam("id") String id) {
		
		List<ScheduleListVO> list = service.getAllScheduleList(id);
		model.addAttribute("getAllScheduleList", list);
		
		System.out.println("getList : =" + list);
		
		return "schedule/trav_list";
	}
	
	@RequestMapping(value="ScheduleInsert", method=RequestMethod.POST)
	public String insertSchedule(Model model, @RequestParam("id") String id, ScheduleListVO s) {
		System.out.println("#Schedule List controller getId : " + s.getId());
		System.out.println("#controller getTrav_title : " + s.getTrav_title());
		
		// 소문자, 대문자, 숫자를 조합하여 랜덤한 page_id 생성
		String pageId = generateRandomPageId();
		s.setPage_id(pageId);
		
		int se = service.insertSchedule(s);
		System.out.println("se :" + se);
		System.out.println("pageId: " + pageId);
		if(se == 1) {
			System.out.println("controller : Schedule 입력 성공");
		} else {
			System.out.println("controller : Schedule 입력 실패");
		}
		
		
		return "redirect:/scheduleList";
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
	
	@RequestMapping(value="/scheduleUpdate", method= RequestMethod.POST)
	public String updateSchedule(@RequestParam("page_id") String pageId, @RequestParam("id") String id, ScheduleListVO s) {
		System.out.println("#List Controller page_id" + s.getPage_id());
		System.out.println("#List Controller id" + s.getId());
		
		int se = service.updateSchedule(s);
		System.out.println("#se : " + se);
		
		if(se == 1) {
			System.out.println("controller : Schedule 수정 성공");
		} else {
			System.out.println("controller : Schedule 수정 실패");
		}
		
		
		return "redirect:/scheduleList";
	}
	
	@RequestMapping(value="/scheduleDelete", method= RequestMethod.POST)
	public String deleteSchedule(@RequestParam("page_id") String pageId, @RequestParam("id") String id, ScheduleListVO s) {
		System.out.println("#List Controller page_id : " + s.getPage_id());
		
		int se = service.deleteSchedule(s);
		System.out.println("#se : " + se);
		
		if(se == 1) {
			System.out.println("controller : Schedule 삭제 성공");
		} else {
			System.out.println("controller : Schedule 삭제 실패");
		}
		
		
		return "redirect:/scheduleList";
	}
	
}
