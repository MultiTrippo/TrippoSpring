package com.board.model;

import lombok.Data;

@Data
public class PostVO {
	private int id;
	private String writer;
	private String title;
	private String content;
	private String imgUrls;
	private String country;
	private String city;
	private String category;

	// Constructors
	public PostVO() {
	}

	public PostVO(String writer, String title, String content, String imgUrls, String country, String city, String category) {
		this.writer=writer;
		this.title = title;
		this.content = content;
		this.imgUrls = imgUrls;
		this.country = country;
		this.city = city;
		this.category=category;
	}

}
