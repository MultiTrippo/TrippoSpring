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
   
   

   
   
   /** 회원가입양식 페이지 접속 */
   @RequestMapping(value = "/signup", method = RequestMethod.GET)
   public String signUp() {
      
      return "member/signup";
   }
   
   /** 회원가입 완료버튼 클릭시 */
   @RequestMapping(value = "/signupComplete", method = RequestMethod.POST)
   public String signUpComplete(@ModelAttribute MemberVO member) {
      
      System.out.println("controller: signUpComplete(member)");
      System.out.println(member);
      
      int n = service.signUpComplete(member);
      if(n==1) {
         System.out.println("회원가입 완료");
      }else {
         System.out.println("회원가입 실패");
      }
      
      return "redirect:login";
   }
   
   /** 아이디 중복확인 버튼 클릭시 */
   @ResponseBody
   @PostMapping("/idCheck")
   public int idCheck(MemberVO member) {
      
      System.out.println("controller: idCheck(member)");
      
      return service.idCheck(member);
   }
   
   /** 이메일 중복확인 버튼 클릭시 */
   @ResponseBody
   @PostMapping("/emailCheck")
   public int emailCheck(MemberVO member) {
      
      System.out.println("controller: emailCheck(member)");
      
      return service.emailCheck(member);
   }
   
   
   
   
   /** 로그인페이지 접속 */
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String login() {
      
      return "member/login";
   }
   
   /** 로그인하기 버튼 클릭 */
   @RequestMapping(value = "/loginComplete", method = RequestMethod.POST)
   public String loginComplete(@ModelAttribute MemberVO member, HttpServletRequest req, RedirectAttributes rttr) {
      
      //view에서 입력한 값이 들어옴
      System.out.println("controller에서 getId: "+member.getId());
      System.out.println("controller에서 getPassword: "+member.getPassword()); 
      
      HttpSession session = req.getSession();
      MemberVO loginUser = service.loginComplete(member);
      
      if(loginUser == null) {
         //로그인 실패
         int result = 0;
         rttr.addFlashAttribute("result", result);
         return "redirect:login";         
      }else {
         //로그인 성공
         session.setAttribute("loginUser", loginUser);
         
         return "redirect:boardList";
      }
      
   }
   
   /** 로그아웃 버튼 클릭 */
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout(HttpSession session) {
      session.invalidate();
      
      return "redirect:login";
   }

}