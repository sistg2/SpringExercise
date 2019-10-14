package com.sist.databoard.dao;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DataBoardVO {
	private int no;
	private String name;
	private String subject;
	private String content;
	private String pwd;
	private Date regdate;
	private int hit;
	private String filename;
	private String filesize;
	private int filecount;
	private int rcount;
	private List<MultipartFile> files;
	private List<String> fList = new ArrayList<String>();
	private List<String> sList = new ArrayList<String>();
	
}
