package com.sist.mvc;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.manager.*;
import com.sist.movie.dao.*;

@Controller
public class MainController {
	@Autowired
	private MovieDAO dao;
	
	@RequestMapping("main/main.do")
	public String main_main(Model model) {
		String[] color = {"#FF0F00", "#FF6600", "#FF9E01", "#FCD202", "#F8FF01", 
						  "#B0DE09", "#04D215", "#0D8ECF", "#0D52D1", "#2A0CD0", 
						  "#8A0CCF", "#CD0D74", "#754DEB", "#DDDDDD", "#999999", 
						  "#333333", "#000000"};
		List<GraphVO> list = dao.movieScoreData();
		
		JSONArray arr = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("country", list.get(i).getTitle());
			obj.put("visits", Integer.parseInt(list.get(i).getScore().replace(".", "")));
			obj.put("color", color[i]);
			arr.add(obj);
		}
		model.addAttribute("data", arr);
		
		realData(model);
		
		return "main";
	}
	
	public static void realData(Model model) {
		WeatherVO wvo = RealManager.weatherData();
		model.addAttribute("wvo", wvo);
		
		StockVO svo = RealManager.stockData();
		model.addAttribute("svo", svo);
	}
	
}
