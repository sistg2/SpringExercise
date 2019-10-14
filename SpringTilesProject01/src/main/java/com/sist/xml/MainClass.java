package com.sist.xml;
import java.net.*;
import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;


public class MainClass {
	public static void main(String[] args) {
		try {
			URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=dcc4cb20899fc90834a625d0f87fab47&itemPerPage=100");
			JAXBContext jc = JAXBContext.newInstance(MovieListResult.class);
			Unmarshaller un = jc.createUnmarshaller();
			MovieListResult mr = (MovieListResult)un.unmarshal(url);
			List<Movie> list = mr.getMovieList().getMovie();
			
			int i = 1;
			for(Movie m : list) {
				System.out.printf("번호 : %d\n", i);
				System.out.printf("영화명 : %s\n", m.getMovieNm());
				System.out.printf("장르 : %s\n", m.getGenreAlt());
				System.out.printf("개봉국가 : %s\n", m.getNationAlt());
				System.out.printf("유형 : %s\n", m.getTypeNm());
				try {
					System.out.printf("감독 : %s\n", m.getDirectors().getDirector().getPeopleNm());
				} catch (Exception e) {}
				System.out.println();
				i++;
			}
			
		} catch (Exception ex) {ex.printStackTrace();}
	}
	
}
