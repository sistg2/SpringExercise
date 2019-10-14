package com.sist.movie.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDAO {
	@Autowired
	private MovieMapper mapper;
	
	public List<MovieVO> movieListData(Map map) {
		return mapper.movieListData(map);
	}
	
	public int movieTotalPage(int cateno) {
		return mapper.movieTotalPage(cateno);
	}
	
	public List<MovieVO> boxOfficeListData(Map map) {
		return mapper.boxOfficeListData(map);
	}
	
	public int boxOfficeTotalPage(int cateno) {
		return mapper.boxOfficeTotalPage(cateno);
	}
	
	public List<GraphVO> movieScoreData() {
		return mapper.movieScoreData();
	}
	
	public MovieVO movieDetailData(int mno) {
		return mapper.movieDetailData(mno);
	}
	
	public MovieVO boxDetailData(int mno) {
		return mapper.boxDetailData(mno);
	}
	
	public List<MovieVO> movieAllData() {
		return mapper.movieAllData();
	}
	
	public String isLogin(String id, String pwd) {
		String result = "";
		int count = mapper.memberIdCount(id);
		if(count==0) {
			result += "NOID";
		} else {
			String db_pwd = mapper.memberGetPwd(id);
			if(pwd.equals(db_pwd)) 
				result = id;
			else
				result = "NOPWD";
		}
		return result;
	}
	
	public List<MovieVO> movieBoxOfficeAllData() {
		return mapper.movieBoxOfficeAllData();
	}
	
	public MovieVO movieBoxOfficeDetailData(int mno) {
		return mapper.movieBoxOfficeDetailData(mno);
	}
	
	public List<String> movieGenreAllData() {
		return mapper.movieGenreAllData();
	}
	
	public List<String> movieTitleAllData() {
		return mapper.movieTitleAllData();
	}
}





