package com.sist.mvc;

import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("chart")
public class ChartController {
	@RequestMapping("chart.do")
	public String chart_chart(Model model) {
		
		MainController.realData(model);
		return "chart/chart";
	}
	
	@RequestMapping("recommand.do")
	public String chart_recommand(Model model) {
		
		MainController.realData(model);
		return "chart/recommand";
	}
	
	
}
