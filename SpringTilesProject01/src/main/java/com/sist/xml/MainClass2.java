package com.sist.xml;
import java.io.*;
import java.net.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class MainClass2 {
	public static void main(String[] args) {
		try {
			URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=dcc4cb20899fc90834a625d0f87fab47&itemPerPage=100");
			StringBuffer sb = new StringBuffer();
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			if(conn != null) {
				BufferedReader br = new BufferedReader(
						new InputStreamReader(conn.getInputStream(), "utf-8"));
				String line;
				while((line = br.readLine()) != null) {
					sb.append(line);
				}
				br.close();
			}
			//System.out.println(sb.toString());
			
			Document doc = Jsoup.connect("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=dcc4cb20899fc90834a625d0f87fab47&itemPerPage=100").get();
			System.out.println();
			
			JSONParser jp = new JSONParser();
			JSONObject root = (JSONObject)jp.parse(sb.toString());
			JSONObject list = (JSONObject)root.get("movieListResult");
			JSONArray movieList = (JSONArray)list.get("movieList");
			for(int i = 0; i < movieList.size(); i++) {
				JSONObject obj = (JSONObject)movieList.get(i);
				//System.out.println(obj.toJSONString());
				System.out.printf("번호 : %d\n", i+1);
				System.out.printf("제작국 : %s\n", obj.get("repNationNm"));
				System.out.printf("장르 : %s\n", obj.get("repGenreNm"));
				System.out.printf("제목 : %s\n", obj.get("movieNm"));
				System.out.printf("유형 : %s\n", obj.get("typeNm"));
				
				JSONArray dirs = (JSONArray)obj.get("directors");
				for(int j = 0; j < dirs.size(); j++) {
					JSONObject o = (JSONObject)dirs.get(j);
					System.out.printf("감독 : %s\n", o.get("peopleNm"));
				}
				System.out.println();
			}
			
		} catch (Exception ex) {ex.printStackTrace();}
	}

}
