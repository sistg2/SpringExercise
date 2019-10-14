package com.sist.news.dao;
import java.text.SimpleDateFormat;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

@Component("nm")
public class NewsManager {
	@Autowired
	private NewsDAO dao;
	
	public static void main(String[] args) {
		ApplicationContext app = new ClassPathXmlApplicationContext("application-datasource.xml");
		NewsManager n = (NewsManager)app.getBean("nm");
		/*List<NewsVO> list = n.newsListData();
		int k = 1;
		for(NewsVO vo : list) {
			n.dao.newsInsert(vo);
			System.out.println("k = " + k);
			k++;
		}*/
		System.out.println("Save end...");
	}
	
	public List<NewsVO> newsListData() {
		List<NewsVO> list = new ArrayList<NewsVO>();
		Date date = new Date();
		String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
		try {
			
			int no = 1;
			// 연결
			for(int i = 1; i <= 6; i++) {
				try {
					Document doc = Jsoup.connect("https://movie.daum.net/magazine/new?tab=nws&regdate=" + today + "&page=" + i).get();
					Elements title = doc.select("div.wrap_news span.cont_line strong.tit_line");
					Elements link = doc.select("div.wrap_news span.cont_line strong.tit_line a.link_txt");
					Elements content = doc.select("div.wrap_news span.cont_line a.desc_line");
					Elements etc = doc.select("div.wrap_news span.cont_line span.state_line");
					Elements poster = doc.select("div.wrap_news a.thumb_line span.thumb_img");
					/*Elements regdate = doc.select("");
					Elements poster = doc.select("");*/
					for(int j = 0; j < title.size(); j++) {
						/*
						System.out.println(title.get(j).text());
						System.out.println(link.get(j).attr("href"));
						System.out.println(content.get(j).text());
						System.out.println(str.substring(0, str.indexOf("발")-1));
						System.out.println(str.substring(str.indexOf("자")+1));
						System.out.println(img);
						System.out.println();
						*/
						String str = etc.get(j).text();
						String img = poster.get(j).attr("style");
						img = img.substring(img.indexOf("(")+1, img.lastIndexOf(")"));
						
						NewsVO vo = new NewsVO();
						vo.setNo(no);
						vo.setTitle(title.get(j).text());
						vo.setLink(link.get(j).attr("href"));
						vo.setContent(content.get(j).text() + "...");
						vo.setAuthor(str.substring(0, str.indexOf("발")-1));
						vo.setRegdate(str.substring(str.indexOf("자")+1));
						vo.setPoster(img);
						
						//System.out.println("뉴스 저장... " + vo.getTitle());
						list.add(vo);
						no++;
					}
				} catch (Exception ex) {ex.printStackTrace();}
			}
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public String newsDetailData(String link) {
		String result = "";
		try {
			Document doc = Jsoup.connect(link).get();
			Element elem = doc.selectFirst("div#mArticle");
			result = elem.html();
		} catch (Exception ex) {}		
		return result;
	}
}
