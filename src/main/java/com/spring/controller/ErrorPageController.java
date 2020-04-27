package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
@RequestMapping(value="/errorpage/*")
public class ErrorPageController {
	
	
	
	
	// error
	@GetMapping("/404")
	public String error_404() {
		log.info("404 요청");
		return "/errorpage/404";
	}
	@GetMapping("/403")
	public void error_403() {
		log.info("403");
	}
	@GetMapping("/500")
	public void error_500() {
		log.info("500");
	}
	
	@GetMapping("/expired")
	public void expired() {
		log.info("expired");
	}
	
	
}
