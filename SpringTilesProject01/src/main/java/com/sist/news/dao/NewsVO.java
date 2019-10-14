package com.sist.news.dao;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NewsVO {
	private int no;
	private String title;
	private String link;
	private String content;
	private String author;
	private String regdate;
	private String poster;
}
