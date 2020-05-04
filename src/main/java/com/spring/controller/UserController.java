package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.spring.domain.Criteria;
import com.spring.domain.PageVO;
import com.spring.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	
	@Autowired
	private UserService usc;
	
	
	@GetMapping("/Q")
	public String User_Q_notice() {
		log.info("문의사항 게시판");	
		return "/user/Questions/Questions";
	}
	@GetMapping("/E")
	public String User_E_Event() {
		log.info("문의사항 게시판");	
		return "/user/Event/Event";
	}
	@GetMapping("/N")
	public String User_N_News() {
		log.info("문의사항 게시판");	
		return "/user/News/News";
	}
	
	
	@GetMapping("/no")
	public String Notice(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req ) {
		
		
		model.addAttribute("list", usc.listmap(cri));
		model.addAttribute("pageVO",new PageVO(cri, usc.totalRows(cri)));
		return "/user/Notice/Notice";
	}
	
	@GetMapping("/N-1")
	public String NEW() {
		log.info("양식 게시판");	
		return "N-test1";
	}
//	@GetMapping("/U-1")
//	public String User_Set() {
//		log.info("문의사항 게시판");	
//		return "/user/UserSet";
//	}
//	@GetMapping("/U-2")
//	public String User_Update() {
//		log.info("문의사항 게시판");	
//		return "/user/UserUpdate";
//	}
//	@GetMapping("/U-3")
//	public String User_Delete() {
//		log.info("문의사항 게시판");	
//		return "/user/UserDelete";
//	}
	
	
	
	
}
