package com.schedule.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ScheduleController {
	
	@RequestMapping(value="/schedule", method=RequestMethod.GET)
	public String schedule() {
		
		return "schedule/trav_manage"; // 뷰 네임 .jsp 파일 위치
		
		// /WEB-INF/views/schedule/trav_manage.jsp 형태로 가게 된다.
		
	}

}
