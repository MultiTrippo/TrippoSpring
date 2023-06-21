package com.board.model;

import lombok.Data;

@Data
public class PostVO {
	private int id;
	  private String title;
	  private String content;
	  private String imagePath;
	  private String country;
	  private String city;

	  // Constructors
	  public PostVO() {
	  }

	  public PostVO(String title, String content, String imagePath, String country, String city) {
	    this.title = title;
	    this.content = content;
	    this.imagePath = imagePath;
	    this.country = country;
	    this.city = city;
	  }
	  
	  
}
