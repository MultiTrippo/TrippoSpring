package com.member.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {	
	
	private String id;
	private String name;
	private String password;
	private String phone;
	private Date birth;
	private int gender;
	private String email;
	
}
