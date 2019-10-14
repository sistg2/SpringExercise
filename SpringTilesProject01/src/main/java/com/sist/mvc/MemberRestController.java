package com.sist.mvc;
import com.sist.movie.dao.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberRestController {
	@Autowired
	private MovieDAO dao;
	
	@RequestMapping("member/login_ok.do")
	public String member_login_ok(String id, String pwd, HttpSession session) {
		String result = "";
		// 1=NOID, 2=NOPWD 3=SUCCESS
		result = dao.isLogin(id, pwd);
		if(result.equals(id))
			session.setAttribute("id", id);
		
		return result;
	}
	
	@RequestMapping("member/id_get.do")
	public String member_id_get(HttpSession session) {
		String result = (String)session.getAttribute("id");
		return result;
	}
}
