package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.spring.domain.Deposit_historyVO;
import com.spring.service.AdminService;
import com.spring.service.RegisterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/account/*")
public class AccountController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/account")
	public void account() {
		log.info("account 요청");
	}

	
//	@PostMapping("/account")
//	public String accountList(/*HttpServletRequest req*/) {
//		Deposit_historyVO dpVO = service.Deposit_hi(vo);
//		return null;
//	}
}

