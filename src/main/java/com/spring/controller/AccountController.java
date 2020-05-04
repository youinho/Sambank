package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CustomerVO;
import com.spring.domain.Deposit_historyVO;
import com.spring.service.AccountService;
import com.spring.service.AdminService;
import com.spring.service.RegisterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/member/account/*",method = {RequestMethod.GET, RequestMethod.POST})
public class AccountController {
	
	@Autowired
	private AccountService service;
	
	@GetMapping("/account")
	public void account() {
		log.info("account 요청");
	}

	
	
	@PostMapping("/balance")
	public void get_balance(ModelMap modelMap) {
		String ano="10235034475230";
		
		long c_balance=service.balnce(ano);
		
		modelMap.addAttribute("c_balance",c_balance);
//		return "/member/balance"; 
	}

}

