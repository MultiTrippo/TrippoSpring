package com.member.mapper;

import com.member.vo.MemberVO;

public interface MemberMapper {
	
	public int idCheck(MemberVO member);
	
	public int emailCheck(MemberVO member);
	
	public int signUpComplete(MemberVO member);
	
	public MemberVO loginComplete(MemberVO member);

}
