package com.sist.manager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class RealManager {
	public static WeatherVO weatherData() {
		WeatherVO vo = new WeatherVO();
		try {
			Document doc = Jsoup.connect("https://www.daum.net/").get();
			Element sido = doc.selectFirst("ul.list_weather span.txt_part");
			Element type = doc.selectFirst("ul.list_weather strong.ico_ws");
			Element weather = doc.selectFirst("ul.list_weather em.screen_out");
			
			vo.setSido(sido.text());
			vo.setType(type.text());
			vo.setWeather(weather.text());
			
		} catch (Exception ex) {}
		return vo;
	}
	
	public static StockVO stockData() {
		StockVO vo = new StockVO();
		try {
			Document doc = Jsoup.connect("https://www.daum.net/").get();
			Element kospiStock = doc.select("div.stock_part strong.num_stock").get(0);
			Element kospiStatus = doc.select("div.stock_part em.num_status").get(0);
			Element kosdaqStock = doc.select("div.stock_part strong.num_stock").get(1);
			Element kosdaqStatus = doc.select("div.stock_part em.num_status").get(1);
			
			vo.setKospiNum(kospiStock.text());
			vo.setKospiStatus(kospiStatus.text());
			vo.setKosdaqNum(kosdaqStock.text());
			vo.setKosdaqStatus(kosdaqStatus.text());
			
		} catch (Exception ex) {}
		return vo;
	}
}
/*

<h4 class="screen_out">오늘의 정보</h4>
<div class="stock_part">
<strong class="screen_out">현재 증시</strong>
<a href="https://search.daum.net/search?w=tot&amp;DA=TTS&amp;q=%EC%BD%94%EC%8A%A4%ED%94%BC" class="link_stock stock_up" data-tiaramapper="realtime_issue_stock1">
<span class="tit_stock">코스피</span>
<strong class="num_stock">2,061.43</strong>
<em class="num_status"><span class="ico_pctop ico_arrow"><span aria-hidden="true">&#9652;</span> 전일대비 상승</span>11.5</em>
</a>
<strong class="screen_out">현재 증시</strong>
<a href="https://search.daum.net/search?w=tot&amp;DA=TTS&amp;q=%EC%BD%94%EC%8A%A4%EB%8B%A5" class="link_stock stock_down" data-tiaramapper="realtime_issue_stock2">
<span class="tit_stock">코스닥</span>
<strong class="num_stock">621.42</strong>
<em class="num_status"><span class="ico_pctop ico_arrow"><span aria-hidden="true">&#9662;</span> 전일대비 하락</span>5.51</em>
</a>
</div>
*/