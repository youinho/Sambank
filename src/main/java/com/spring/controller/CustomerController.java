package com.spring.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/customer/*")
public class CustomerController {
	@GetMapping("/defense")
	public void defense() {
		log.info("입출금확인");	
		
	
//		return "depositList";
	}
}
