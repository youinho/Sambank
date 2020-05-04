package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	
	@GetMapping("/chatLoader.do")
	public String chat(){		
		log.info("채팅시작");
		
		return "admin/chat/chatLoader";
	}
	
	
	@GetMapping("/userChatAutoComplete.do")
	public String userChatAutoComplete(){		
		log.info("userChatAutoComplete");
		
		return "admin/chat/userChatAutoComplete";
	}
	
	
	@GetMapping("/userChat.do")
	public String userChat(){		
		log.info("userChat");
		
		return "admin/chat/userChat";
	}
}
