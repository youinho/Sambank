package com.spring.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.CustomerVO;
import com.spring.service.RegisterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j



public class LoginController {
	//login 
	@Autowired
	private RegisterService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
//	@GetMapping("/member/customerlogin")
//	public String registerGet(){		
//		
//		File file=new File("c://sam//1.txt");
//		if (file.exists()) {
//			return "/member/customerlogin";
//		}
//		else {
//			return "/member/downloadForm";
//		}
//	}

	@GetMapping("/member/downloadForm")
	public void download(){
		log.info("download 요청");
	}
	

	
	@PostMapping("/member/customerlogin")
	public String loginPost(CustomerVO vo, HttpSession session) {
		
//		log.info("login "+vo);
//		log.info("확인전 비밀번호"+vo.getPassword());
		CustomerVO info = service.customer_login(vo);
//		log.info("확인후 비밀번호"+info.getPassword());
		String pw=vo.getPassword();
		log.info("db:"+info);
		session.setAttribute("info", info);
		if(passwordEncoder.matches( pw,info.getPassword())) {
			return "redirect:/";
		}
		return "/member/customerlogin";
		
	}
	
}


	

