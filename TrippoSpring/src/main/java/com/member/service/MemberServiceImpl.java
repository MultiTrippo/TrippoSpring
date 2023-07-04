package com.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.mapper.MemberMapper;
import com.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	
	@Override
	public int idCheck(MemberVO member){
		
		System.out.println("service: idCheck(member)");
		return this.mapper.idCheck(member);
	}
	
	@Override
	public int emailCheck(MemberVO member){
		
		System.out.println("service: emailCheck(member)");
		return this.mapper.emailCheck(member);
	}
	
	@Override
	public int signUpComplete(MemberVO member) {
		
		System.out.println("service: signUpComplete(member)");
		return this.mapper.signUpComplete(member);
	}
	
	@Override
	public MemberVO loginComplete(MemberVO member) {
		
		System.out.println("service: loginComplete(member)");
		return this.mapper.loginComplete(member);
	}
	

}
