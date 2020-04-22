package com.spring.controller;

import java.util.Locale;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.CustomerVO;
import com.spring.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private UserService service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		log.info("main페이지");
	
		return "main(index)";
	}
	
	//testpage
	@GetMapping("/gh")
	public String GuideHeader() {
		return "header_Main";
	}
	
	@GetMapping("/main")
	public String newmain() {
		return "main";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		
		
		return "user/login";
	}
	
	
	@PostMapping("/login")
	public void user_login_post(CustomerVO vo) {
		
		CustomerVO checkedVO = service.selectOne(vo);
		
		log.info(""+vo);
//		if(checkedVO == null) {
//			log.info("로그인 실패");
//			return "user/login";
//			
//		}
//		
//		
//		log.info("로그인 성공");
//		return "main";
		
	}
}
