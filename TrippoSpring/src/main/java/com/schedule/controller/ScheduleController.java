package com.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScheduleController {
	
	@RequestMapping(value="/schedule", method=RequestMethod.GET)
	public String schedule() {
		
		return "schedule/trav_manage"; // 뷰 네임 .jsp 파일 위치
		
		// /WEB-INF/views/schedule/trav_manage.jsp 형태로 가게 된다.
		
	}
	
}
