package com.sist.mvc;
import java.util.*;
import java.io.*;
import java.net.*;
import com.sist.movie.dao.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReserveRestController {
	@Autowired
	private MovieDAO dao;
	
	@RequestMapping(value="movie/boxoffice_data.do", produces="application/json;charset=utf8") 
	public String movie_boxoffice_r(String no) {
		String json = "";
		if(no==null)
			no="1";
		int index=Integer.parseInt(no);
		String strUrl="";
		switch (index) {
		case 1:
		   strUrl="searchMainDailyBoxOffice.do";
		   break;
		case 2:
		   strUrl="searchMainRealTicket.do";
		   break;
		case 3:
		   strUrl="searchMainDailySeatTicket.do";
		   break;
		case 4:
		   strUrl="searchMainOnlineDailyBoxOffice.do";
		   break;
		}
		String s = "http://www.kobis.or.kr/kobis/business/main/"+strUrl;
		try {
			URL url = new URL(s);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			StringBuffer sb = new StringBuffer();
			if(conn != null) {
				BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				while(true) {
					String ss = in.readLine();
					if(ss==null) break;
					sb.append(ss);
				}
			}
			json = sb.toString();
			//System.out.println(json);
		} catch (Exception ex) {}
		return json;
	}
	
	
	// SELECT mno, title, score, poster, genre, actor, director 
	@RequestMapping(value="movie/find_data.do", produces="application/json;charset=utf8")
	public String movie_find_data() {
		String result = "";
		List<MovieVO> list = dao.movieAllData();
		JSONArray arr = new JSONArray();
		for(MovieVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("mno", vo.getMno());
			obj.put("title", vo.getTitle());
			obj.put("score", vo.getScore());
			obj.put("poster", vo.getPoster());
			obj.put("genre", vo.getGenre());
			obj.put("actor", vo.getActor());
			obj.put("director", vo.getDirector());
			obj.put("regdate", vo.getRegdate());
			obj.put("story", vo.getStory());
			obj.put("grade", vo.getGrade());
			
			arr.add(obj);
		}
		result = arr.toString();
		
		return result;
	}
}
















