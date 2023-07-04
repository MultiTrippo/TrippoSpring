package com.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.schedule.db.EtcVO;
import com.schedule.db.FixVO;
import com.schedule.service.EtcService;
import com.schedule.service.FixService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ScheduleController {
	
	// Autowired : spring�� bean ��ü�� ����. ��ü ���� �Ǵ� �ʿ�� �� �� �ش��ϴ� ���Ӽ� �ڵ����� �ذ�
	@Autowired
	private EtcService etcservice;
	
	@Autowired
	private FixService fixservice;
	
	@RequestMapping(value="/schedule", method=RequestMethod.GET)
	public String schedule(Model model) {
		
		return "schedule/trav_manage"; // �� ���� .jsp ���� ��ġ
		
		// /WEB-INF/views/schedule/trav_manage.jsp ���·� ���� �ȴ�.
		
	}
	
//	@RequestMapping(value="/etc")
	
	@PostMapping(value="/fixInsert", produces = "application/json")
	@ResponseBody
	public ModelMap insertFixList(@RequestParam("page_id") String pageId, FixVO fix) {
		System.out.println("#controller getFix_title : " + fix.getP_name());
		System.out.println("#controller getFix_id : " + fix.getFix_id());
		
		int f = fixservice.insertFixList(fix);
		System.out.println("f :" + f+", fix_id" + fix.getFix_id());
				if(f == 1) {
			System.out.println("controller : fix 입력 성공");
		} else {
			System.out.println("controller : fix 입력 실패");
		}
		
		ModelMap map=new ModelMap();
		map.put("fix_id", fix.getFix_id());
		return map;
	}
	
	@PostMapping(value="/fixUpdate", produces="application/json")
	@ResponseBody
	public ModelMap updateFixList(@RequestParam("page_id") String pageId, @RequestParam("fix_id") int fixId, FixVO fix) {
		System.out.println("#controller upFix_id : " + fix.getFix_id());
		System.out.println("#controller upMemo :" + fix.getP_memo());
		System.out.println("#controller upFixPage_id : " + fix.getPage_id());
		
		int f = fixservice.updateFixList(fix);
		System.out.println("#f : " + f);
		
		if(f == 1) {
			System.out.println("controller : fix 수정 성공");
		} else {
			System.out.println("controller : fix 수정 실패");
		}
		
		ModelMap map=new ModelMap();
		map.put("result", f);
		return map;
	}
	
	@PostMapping(value="/fixDelete", produces="application/json")
	@ResponseBody
	public ModelMap deleteFixList(@RequestParam("page_id") String pageId, @RequestParam("fix_id") int fixId, FixVO fix) {
		System.out.println("#controller delFix_id" + fix.getFix_id());
		
		int f = fixservice.deleteFixList(fix);
		System.out.println("#f : " + f);
		
		if(f == 1) {
			System.out.println("controller : fix 삭제 성공");
		} else {
			System.out.println("controller : fix 삭제 실패");
		}
		
		ModelMap map = new ModelMap();
		map.put("fix_id : ", fix.getFix_id());
		
		return map;
	}
	
	@GetMapping(value="fixList", produces = "application/json")
	@ResponseBody
	public List<FixVO> getFixList(@RequestParam("page_id") String pageId){
		System.out.println("리스트 불러오기 fix page_id : " + pageId);
		
		List<FixVO> selectFix = fixservice.getFixList(pageId);
		
		System.out.println(selectFix);
		
		return selectFix;
	}
	
	@PostMapping(value="/etcInsert", produces="application/json")
	@ResponseBody
	public ModelMap insertEtcList(@RequestParam("page_id") String pageId, EtcVO etc) {
		System.out.println("#controller getEtc_text : " + etc.getEtc());
		System.out.println("#controller getEtc_id : " + etc.getEtc_id());
		
		int n = etcservice.insertEtcList(etc);
		System.out.println("#n : " + n);
		
		if(n == 1) {
			System.out.println("controller : etc 입력 성공");
		} else {
			System.out.println("controller : etc 입력 실패");
		}
		
		ModelMap map = new ModelMap();
		map.put("etc_id", etc.getEtc_id());
		return map;
	}
	
	@PostMapping(value="/etcDelete", produces="application/json")
	@ResponseBody
	public ModelMap deleteEtcList(@RequestParam("page_id") String pageId, @RequestParam("etc_id") int etcId, EtcVO etc_id) {
		System.out.println("#controller delEtc_id" + etc_id.getEtc_id());
		
		int n = etcservice.deleteEtcList(etc_id);
		
		System.out.println("#n : " + n);
		if(n == 1) {
			System.out.println("controller : etc 삭제 성공");
		} else {
			System.out.println("controller : etc 삭제 실패");
		}
		
		ModelMap map = new ModelMap();
		map.put("etc_id", etc_id.getEtc_id());
		return map;
	}
	
	@PostMapping(value="/etcUpdate", produces="application/json")
	@ResponseBody
	public ModelMap updateEtcList(@RequestParam("page_id") String pageId, @RequestParam("etc_id") int etcId, EtcVO etc_id) {
		System.out.println("#controller upEtc_id : " + etc_id.getEtc_id());
		System.out.println("#controller upEtc :" + etc_id.getEtc());
		System.out.println("#controller upEtPage_id : " + etc_id.getPage_id());
		
		int n = etcservice.updateEtcList(etc_id);
		System.out.println("#n : " + n);
		if(n == 1) {
			System.out.println("controller : etc 수정 성공");
		} else {
			System.out.println("controller : etc 수정 실패");
		}
		
		ModelMap map = new ModelMap();
		map.put("et_id", etc_id.getEtc_id());
		return map;
	}
	
	@GetMapping(value="/etcList", produces = "application/json")
	@ResponseBody
	public List<EtcVO> getEtcList(@RequestParam("page_id") String pageId) {
		System.out.println("리스트 불러오기 etc page_id : " + pageId);

		List<EtcVO> selectEtc = etcservice.getEtcList(pageId);
		
		System.out.println(selectEtc);

		return selectEtc;
		
	}
	
}