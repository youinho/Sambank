package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.domain.Criteria;
import com.spring.domain.PageVO;
import com.spring.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserAccountController {
	
	@Autowired
	private UserService usc;
	
	
	@GetMapping("/deposit")
	public String deposit() {
		log.info("계좌이체");	
		return "useraccount/deposit";
	}
	
	@GetMapping("/depositList")
	public String depositList() {
		log.info("입출금확인");	
		return "useraccount/depositList";
	}
	
	@GetMapping("/accountCreate")
	public String accountCreate() {
		log.info("계좌신청");	
		return "useraccount/accountCreate";
	}
	
	@GetMapping("/accountDelete")
	public String accountDelete() {
		log.info("계좌삭제신청");	
		return "useraccount/accountDelete";
	}
	
	@GetMapping("/accountList")
	public String accountList() {
		log.info("계좌목록");	
		return "useraccount/accountList";
	}

	
	
	
	//비밀번호 입력 팝업
	@GetMapping("/popup/passpopup")
	public String passpopup(Model model, HttpServletRequest req) {
		//logging(req);
		//log.info("passpopup 요청");
		model.addAttribute("wInput", "password");
		return "/useraccount/passpopup";
	}

	
	@GetMapping("/popup/passpopup_c")
	public String passpopup_c(Model model, HttpServletRequest req) {
		//logging(req);
		//log.info("passpopup_c 요청");
		model.addAttribute("wInput", "confirm_password");
		return "/useraccount/passpopup";
	}
	/*
	 * @GetMapping("/popup/jusopopup") public String juso_popup(HttpServletRequest
	 * req) { //logging(req); //log.info("jusopopup 요청"); return
	 * "/useraccount/jusopopup"; }
	 * 
	 * @PostMapping("/popup/jusopopup") public String
	 * juso_popup_post(HttpServletRequest req) { //logging(req);
	 * //log.info("jusopopup_post 요청"); return "/useraccount/jusopopup"; }
	 */
}
