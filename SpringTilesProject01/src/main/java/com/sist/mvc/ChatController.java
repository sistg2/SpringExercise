package com.sist.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("chat")
public class ChatController {
	@RequestMapping("react_chat.do")
	public String chat_react(Model model) {
		
		MainController.realData(model);
		return "chat/react_chat";
	}
}
