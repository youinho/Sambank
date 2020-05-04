package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CustomerVO;
import com.spring.service.RegisterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value= "/register/*",method = {RequestMethod.GET, RequestMethod.POST})
public class RegisterController {

	@Autowired
	private RegisterService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/step1")
	public void step1() {
		log.info("step1 요청");
	
	}
	
	@PostMapping("/step2")
	public String step2(@RequestParam(value="agree", defaultValue="false") boolean agree, RedirectAttributes rttr) {
	
		log.info("step2 요청 : "+agree);

		if(!agree) {
			rttr.addFlashAttribute("check", "false");
			return "redirect:/register/step1";
		}
		
		return "/register/step2";
	}
	

	
	

}
