package com.sist.mvc;
import com.sist.movie.dao.*;
import java.util.*;

import org.json.simple.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MovieRestController {
	@Autowired
	private MovieDAO dao;
	
	@RequestMapping(value="chart/chart_data.do", produces="application/json;charset=utf8")
	public String movie_chart() {
		String result = "";
		List<MovieVO> list = dao.movieBoxOfficeAllData();
		JSONArray arr = new JSONArray();
		for(MovieVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("mno", vo.getMno());
			obj.put("title", vo.getTitle());
			obj.put("poster", vo.getPoster());
			obj.put("regdate", vo.getRegdate());
			obj.put("grade", vo.getGrade());
			obj.put("genre", vo.getGenre());
			obj.put("score", vo.getScore());
			if(vo.getStory().contains("["))
				obj.put("story", vo.getStory().substring(0, vo.getStory().indexOf("[")));
			else
				obj.put("story", vo.getStory());
			obj.put("actor", vo.getActor());
			obj.put("director", vo.getDirector());
			
			arr.add(obj);
		}
		result = arr.toJSONString();
		//System.out.println("chart_data : " + result);
		return result;
	}
	
	@RequestMapping(value="chart/chart_detail.do", produces="application/json;charset=utf8")
	public String movie_chartDetail(int mno) {
		String result = "";
		
		MovieVO vo = dao.movieBoxOfficeDetailData(mno);
		
		JSONObject obj = new JSONObject();
		obj.put("mno", vo.getMno());
		obj.put("title", vo.getTitle());
		obj.put("poster", vo.getPoster());
		obj.put("regdate", vo.getRegdate());
		obj.put("grade", vo.getGrade());
		obj.put("genre", vo.getGenre());
		obj.put("score", vo.getScore());
		if(vo.getStory().contains("["))
			obj.put("story", vo.getStory().substring(0, vo.getStory().indexOf("[")));
		else
			obj.put("story", vo.getStory());
		obj.put("actor", vo.getActor());
		obj.put("director", vo.getDirector());
			
		result = obj.toJSONString();
		System.out.println("chart_detail : " + result);
		return result;
	}
	
	@RequestMapping("chart/recommand_data.do")
	public String chart_recommand_data(int no) {
		String result = "";
		String data = "";
		if(no==2) // 상황
			data = "휴식,드라이브,산책,집,출/퇴근길,휴가/여행,운동,시상식,거리,하우스파티,클럽,고백,해변,공연,라운지";
		else if(no==3) // 감성
			data = "외로움,기분전환,슬픔,힘찬,이별,지침/힘듦,설렘,오후,밤,새벽,저녁,아침,사랑,스트레스/짜증,그리움,추억,우울,행복,불안,분노,기쁨,축하";
		else if(no==4) // 날씨/계절
			data = "가을,맑은날,추운날,봄,여름,겨울,흐린날,비오는날,더운날,안개낀날,눈오는날";
		else if(no==1) { // 장르
			String tmp = "";
			List<String> genre = dao.movieGenreAllData();
			for(String str : genre) {
				if(str!=null)
					tmp += str + ",";
			}
			data = tmp.substring(0, tmp.lastIndexOf(","));
		}
		result = data;
		return result;
	}
}
