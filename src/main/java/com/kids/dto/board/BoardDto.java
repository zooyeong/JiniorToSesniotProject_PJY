package com.kids.dto.board;

import lombok.Data;

@Data
public class BoardDto {

	private int level;
	private int articleNo;
	private int parentNo;
	private String title;
	private String content;
	private String id;
	private String createdAt;
	private int views;
	
}
