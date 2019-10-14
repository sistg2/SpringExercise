package com.sist.movie.dao;
import java.util.*;
import org.apache.ibatis.annotations.Select;

public interface MovieMapper {
	@Select("SELECT mno, title, regdate, score, story, poster, num "
		  + "FROM (SELECT mno, title, regdate, score, story, poster, rownum as num "
		  + "FROM (SELECT mno, title, regdate, score, story, poster "
		  + "FROM springMovie "
		  + "WHERE cateno=#{cateno} "
		  + "ORDER BY mno ASC )) "
		  + "WHERE num BETWEEN #{start} AND #{end} ")
	public List<MovieVO> movieListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/9.0) FROM springMovie "
		  + "WHERE cateno=#{cateno} ")
	public int movieTotalPage(int cateno);
	
	@Select("SELECT mno, title, regdate, score, story, poster, num "
		  + "FROM (SELECT mno, title, regdate, score, story, poster, rownum as num "
		  + "FROM (SELECT mno, title, regdate, score, story, poster "
		  + "FROM springBoxOffice "
		  + "WHERE cateno=#{cateno} "
		  + "ORDER BY mno ASC )) "
		  + "WHERE num BETWEEN #{start} AND #{end} ")
	public List<MovieVO> boxOfficeListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/9.0) FROM springBoxOffice "
		  + "WHERE cateno=#{cateno} ")
	public int boxOfficeTotalPage(int cateno);
	
	@Select("SELECT title, score, rownum "
		  + "FROM (SELECT title, score "
		  + "FROM springMovie WHERE cateno=1 ORDER BY score DESC) "
		  + "WHERE rownum<=10 ")
	public List<GraphVO> movieScoreData();
	
	@Select("SELECT * FROM springMovie "
		  + "WHERE mno=#{mno} ")
	public MovieVO movieDetailData(int mno);
	
	@Select("SELECT * FROM springBoxOffice "
		  + "WHERE mno=#{mno} ")
	public MovieVO boxDetailData(int mno);
	
	@Select("SELECT mno, title, score, poster, genre, actor, director, regdate, story, grade "
		  + "FROM springMovie ")
	public List<MovieVO> movieAllData();
	
	// 로그인
	@Select("SELECT COUNT(*) FROM member "
		   +"WHERE id=#{id}")
	public int memberIdCount(String id);
	
	@Select ("SELECT pwd FROM member "
		  +"WHERE id=#{id}")
	public String memberGetPwd(String id);
	///////////////////////////////////
	
	@Select("SELECT * FROM springBoxOffice")
	public List<MovieVO> movieBoxOfficeAllData();
	
	@Select("SELECT * FROM springBoxOffice "
		  + "WHERE mno=#{mno}")
	public MovieVO movieBoxOfficeDetailData(int mno);
	
	@Select("SELECT DISTINCT SUBSTR(genre, 1, INSTR(genre, '/')-1) FROM springMovie")
	public List<String> movieGenreAllData();
	
	@Select("SELECT SUBSTR(RTRIM(SUBSTR(title, 1, INSTR(title, '(')-1)), 1, INSTR(RTRIM(SUBSTR(title, 1, INSTR(title, ':')-1)))) FROM springBoxOffice")
	public List<String> movieTitleAllData();
}












