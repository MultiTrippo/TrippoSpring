package com.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.member.service.MemberService;
import com.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	

	
	
	/** ȸ�����Ծ�� ������ ���� */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUp() {
		
		return "member/signup";
	}
	
	/** ȸ������ �Ϸ��ư Ŭ���� */
	@RequestMapping(value = "/signupComplete", method = RequestMethod.POST)
	public String signUpComplete(@ModelAttribute MemberVO member) {
		
		System.out.println("controller: signUpComplete(member)");
		System.out.println(member);
		
		int n = service.signUpComplete(member);
		if(n==1) {
			System.out.println("ȸ������ �Ϸ�");
		}else {
			System.out.println("ȸ������ ����");
		}
		
		return "redirect:login";
	}
	
	/** ���̵� �ߺ�Ȯ�� ��ư Ŭ���� */
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(MemberVO member) {
		
		System.out.println("controller: idCheck(member)");
		
		return service.idCheck(member);
	}
	
	/** �̸��� �ߺ�Ȯ�� ��ư Ŭ���� */
	@ResponseBody
	@PostMapping("/emailCheck")
	public int emailCheck(MemberVO member) {
		
		System.out.println("controller: emailCheck(member)");
		
		return service.emailCheck(member);
	}
	
	
	
	
	/** �α��������� ���� */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	/** �α����ϱ� ��ư Ŭ�� */
	@RequestMapping(value = "/loginComplete", method = RequestMethod.POST)
	public String loginComplete(@ModelAttribute MemberVO member, HttpServletRequest req, RedirectAttributes rttr) {
		
		//view���� �Է��� ���� ����
		System.out.println("controller���� getId: "+member.getId());
		System.out.println("controller���� getPassword: "+member.getPassword()); 
		
		HttpSession session = req.getSession();
		MemberVO loginUser = service.loginComplete(member);
		
		if(loginUser == null) {
			//�α��� ����
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:login";			
		}else {
			//�α��� ����
			session.setAttribute("loginUser", loginUser);
			return "redirect:boardList";
		}
		
	}
	
	/** �α׾ƿ� ��ư Ŭ�� */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:login";
	}

}
