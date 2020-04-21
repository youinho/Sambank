package com.spring.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		log.info("main페이지");
	
		return "main(index)";
	}
	@GetMapping("/header")
	public String GuideHeader() {
		
		
		return "header";
	}
	@GetMapping("/mainheader")
	public String getHeader() {
		
		
		return "header_Main";
	}
	
	
}
