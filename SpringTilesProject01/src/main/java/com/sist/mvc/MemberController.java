package com.sist.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {
	@RequestMapping("login.do")
	public String member_login() {
		
		return "login";
	}
}
