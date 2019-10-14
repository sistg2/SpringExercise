package com.sist.movie.recommand;
import java.io.*;
import java.util.*;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sist.movie.dao.*;

//@Component
public class RecommandManager {
	/*
	public static void main(String[] args) {
		NaverBlogManager nbm = new NaverBlogManager();
		nbm.recommandNamverData("가을");
		RecommandManager rm = new RecommandManager();
		rm.getData();
	}
	@Autowired
	NaverBlogManager mgr;
	
	@Autowired
	MovieDAO dao;
	
	public void getData() {
		try {
			JAXBContext jc = JAXBContext.newInstance(Rss.class);
			Unmarshaller un = jc.createUnmarshaller();
			Rss rss = (Rss)un.unmarshal(new File("c:\\naver_data\\movie.xml"));
			List<Item> list = rss.getChannel().getItem();
			StringBuffer sb = new StringBuffer();
			for(Item i : list) {
				sb.append(i.getDescription() + "\n");
			}
			StringBuffer s = new StringBuffer();
			int i = 0;
			FileReader fr = new FileReader("c:\\naver_data\\movie.json");
			while((i=fr.read()) != -1) {
				s.append(String.valueOf((char)i));
			}
			fr.close();
			System.out.println(s.toString());
			
			JSONParser jp = new JSONParser();
			JSONObject root = (JSONObject)jp.parse(s.toString());
			JSONArray arr = (JSONArray)root.get("items");
			StringBuffer sb = new StringBuffer();
			for(int j = 0; j < arr.size(); j++) {
				JSONObject obj = (JSONObject)arr.get(j);
				System.out.println(obj.get("description"));
				sb.append(obj.get("description") + "\n");
			}
			
			
			FileWriter fw = new FileWriter("c:\\naver_data\\movie.txt");
			fw.write(sb.toString());
			fw.close();
		} catch (Exception ex) {}
	}
	
	public List<RecommandVO> recommand_find(String fd) {
		List<RecommandVO> list = new ArrayList<RecommandVO>();
		mgr.recommandNamverData(fd);
		getData();
		List<String> tList = dao.movieTitleAllData();
		
		
		return list;
	}
	*/
}
