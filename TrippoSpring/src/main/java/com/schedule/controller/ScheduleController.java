package com.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.schedule.db.EtcService;
import com.schedule.db.EtcVO;

@Controller
public class ScheduleController {
	
	// Autowired : spring�� bean ��ü�� ����. ��ü ���� �Ǵ� �ʿ�� �� �� �ش��ϴ� ���Ӽ� �ڵ����� �ذ�
	@Autowired
	private EtcService etcservice;
	
	@RequestMapping(value="/schedule", method=RequestMethod.GET)
	public String schedule(Model model) {
		
		return "schedule/trav_manage"; // �� ���� .jsp ���� ��ġ
		
		// /WEB-INF/views/schedule/trav_manage.jsp ���·� ���� �ȴ�.
		
	}
	
//	@RequestMapping(value="/etc")
	
	
	@RequestMapping(value="/etcInsert", method = RequestMethod.POST)
	public String insertEtcList(Model model, @ModelAttribute EtcVO etc) {
		System.out.println("#controller getEtc_text : " + etc.getEtc());
		System.out.println("#controller getEtc_id : " + etc.getEtc_id());
		
		int n = etcservice.insertEtcList(etc);
		System.out.println("#n : " + n);
		if(n == 1) {
			System.out.println("controller : etc 입력 성공");
		} else {
			System.out.println("controller : etc 입력 실패");
		}
		
		return "redirect:/schedule";
		
	}
	
	@RequestMapping(value="/etcDelete", method = RequestMethod.POST)
	public String deleteEtcList(Model model, @ModelAttribute EtcVO etc_id) {
		System.out.println("#controller delEtc_id" + etc_id.getEtc_id());
		
		int n = etcservice.deleteEtcList(etc_id);
		System.out.println("#n : " + n);
		if(n == 1) {
			System.out.println("controller : etc 삭제 성공");
		} else {
			System.out.println("controller : etc 삭제 실패");
		}
		
		
		return "redirect:/schedule";
	}
	
	@RequestMapping(value="/etcUpdate", method = RequestMethod.POST)
	public String updateEtcList(Model model, @ModelAttribute EtcVO etc_id) {
		System.out.println("#controller upEtc_id" + etc_id.getEtc_id());
		
		int n = etcservice.updateEtcList(etc_id);
		System.out.println("#n : " + n);
		if(n == 1) {
			System.out.println("controller : etc 수정 성공");
		} else {
			System.out.println("controller : etc 수정 실패");
		}
		
		return "redirect:/schedule";
	}
	
	@RequestMapping(value="/etcList", method = RequestMethod.GET)
	public String getEtcList(@RequestParam("page_id") String pageId, Model model) {
		System.out.println("리스트 불러오기 etc page_id : " + pageId);

		List<EtcVO> selectEtc = etcservice.getEtcList(pageId);
		model.addAttribute("selectEtc", selectEtc);
		
		List<EtcVO> n = etcservice.getEtcList(pageId);
		System.out.println("#n : " + n);

		
		return "schedule/trav_manage";
		
	}
	
}