package com.sist.mvc;
import java.util.*;
import java.io.*;
import java.net.*;
import com.sist.movie.dao.*;
import com.sist.news.dao.*;
import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("movie")
public class MovieController {
	@Autowired
	private MovieDAO dao;
	
	@Autowired
	private NewsDAO nDao;
	
	@Autowired
	private NewsManager mgr;
	
	@RequestMapping("movielist.do")
	public String movie_list(String page, String type, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 9;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;
		
		int cateno = Integer.parseInt(type);
		
		map.put("start", start);
		map.put("end", end);
		map.put("cateno", cateno);
		
		int totalpage = dao.movieTotalPage(cateno);
		List<MovieVO> list = dao.movieListData(map);
		
		for(MovieVO vo : list) {
			if(vo.getStory()==null) {
				vo.setStory(" ");
			}
			
			if(vo.getStory().length() > 50) {
				String story = vo.getStory();
				story = story.substring(0, 50);
				story += "...";
				
				vo.setStory(story);
			}
			
			if(vo.getTitle().length() > 10) {
				String title = vo.getTitle();
				title = title.substring(0, 10);
				title += "...";
				
				vo.setTitle(title);
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("cateno", cateno);
		MainController.realData(model);
		
		return "movie/movielist";
	}
	
	@RequestMapping("boxoffice.do")
	public String movie_boxoffice(String page, String type, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 9;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;
		
		int cateno = Integer.parseInt(type);
		
		map.put("start", start);
		map.put("end", end);
		map.put("cateno", cateno);
		
		int totalpage = dao.boxOfficeTotalPage(cateno);
		List<MovieVO> list = dao.boxOfficeListData(map);
		
		for(MovieVO vo : list) {
			if(vo.getStory()==null) {
				vo.setStory(" ");
			}
			
			if(vo.getStory().length() > 50) {
				String story = vo.getStory();
				story = story.substring(0, 50);
				story += "...";
				
				vo.setStory(story);
			}
			
			if(vo.getTitle().length() > 10) {
				String title = vo.getTitle();
				title = title.substring(0, 10);
				title += "...";
				
				vo.setTitle(title);
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("cateno", cateno);
		MainController.realData(model);
		
		return "movie/boxoffice";
	}
	
	@RequestMapping("detail.do")
	public String movie_detail(int mno, Model model) {
		MovieVO vo = dao.movieDetailData(mno);
		String story = vo.getStory();
		if(story.contains("[")) {
			story = story.substring(0, story.indexOf("["));
			story += "...";
			vo.setStory(story);
		}
		model.addAttribute("vo", vo);
		
		MainController.realData(model);
		return "movie/detail";
	}
	
	@RequestMapping("boxDetail.do")
	public String movie_boxDetail(int mno, Model model) {
		MovieVO vo = dao.boxDetailData(mno);
		String story = vo.getStory();
		if(story.contains("[")) {
			story = story.substring(0, story.indexOf("["));
			story += "...";
			vo.setStory(story);
		}
		model.addAttribute("vo", vo);
		
		MainController.realData(model);
		return "movie/boxDetail";
	}
	
	@RequestMapping("news.do")
	public String movie_news(String page, Model model) {
		nDao.newsDrop();
		List<NewsVO> nlist = mgr.newsListData();
		
		for(NewsVO vo : nlist) {
			nDao.newsInsert(vo);
		}
		
		if(page==null)
			page = "1";
		int curpage = Integer.parseInt(page);
		
		List<NewsVO> list = nDao.newsListData(curpage);
		int totalpage = nDao.newsTotalPage();
		
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		
		MainController.realData(model);
		return "movie/news";
	}
	
	@RequestMapping("newsDetail.do")
	public String movie_news_detail(int no, Model model) {
		NewsVO vo = nDao.newsDetailData(no);
		String data = mgr.newsDetailData(vo.getLink());
		model.addAttribute("news_detail", data);
		
		MainController.realData(model);
		return "movie/newsDetail";
	}
	
	@RequestMapping("boxoffice_r.do")
	public String movie_boxoffice_r(Model model) {
		
		MainController.realData(model);
		return "movie/boxoffice_app";
	}
	
	@RequestMapping("boxoffice1.do")
	public String movie_boxoffice1(Model model) {
		String result = "";
		String s = "http://www.kobis.or.kr/kobis/business/main/searchMainDailyBoxOffice.do";
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
			JSONParser jp = new JSONParser();
			JSONArray arr = (JSONArray)jp.parse(sb.toString());
			result = "[";
			for(int i = 0; i < arr.size(); i++) {
				JSONObject obj = (JSONObject)arr.get(i);
				result += "{name:\"" + obj.get("movieNm") + "\", y:" + obj.get("audiCnt") +"},";
			}
			result = result.substring(0, result.lastIndexOf(","));
			result = result + "]";
		} catch (Exception ex) {}
		model.addAttribute("result", result);
		
		MainController.realData(model);
		return "movie/boxoffice_r";
	}
	
	@RequestMapping("boxoffice2.do")
	public String movie_boxoffice2(Model model) {
		
		MainController.realData(model);
		return "movie/real_reserve";
	}
	
	@RequestMapping("boxoffice3.do")
	public String movie_boxoffice3(Model model) {
		String result = "";
		String s = "http://www.kobis.or.kr/kobis/business/main/searchMainDailySeatTicket.do";
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
			JSONParser jp = new JSONParser();
			JSONArray arr = (JSONArray)jp.parse(sb.toString());
			result = "[";
			for(int i = 0; i < arr.size(); i++) {
				JSONObject obj = (JSONObject)arr.get(i);
				result += "{name:\"" + obj.get("movieNm") + "\", y:" + obj.get("totSeatCntRatio") +"},";
			}
			result = result.substring(0, result.lastIndexOf(","));
			result = result + "]";
		} catch (Exception ex) {}
		model.addAttribute("result", result);
		
		MainController.realData(model);
		return "movie/seat";
	}
	
	@RequestMapping("boxoffice4.do")
	public String movie_boxoffice4(Model model) {
		
		MainController.realData(model);
		return "movie/online";
	}
	
	@RequestMapping("movieFind.do")
	public String movie_find(Model model) {
		
		MainController.realData(model);
		return "movie/movie_find";
	}
}











