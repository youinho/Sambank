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
	@RequestMapping("/400")
	public String error_400() {
		log.info("400 요청");
		return "/errorpage/400";
	}
	
	@RequestMapping("/404")
	public String error_404() {
		log.info("404 요청");
		return "/errorpage/404";
	}
	@RequestMapping("/403")
	public void error_403() {
		log.info("403");
	}
	@RequestMapping("/405")
	public void error_405() {
		log.info("405");
	}
	@RequestMapping("/500")
	public void error_500() {
		log.info("500");
	}
	
	@RequestMapping("/expired")
	public void expired() {
		log.info("expired");
	}
	
	
}
