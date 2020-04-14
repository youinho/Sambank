package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.Admin_testVO;
import com.spring.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/admin/*")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("/login")
	public String admin_login() {
		log.info("admin_login 페이지 요청");
		
		
		return "/admin/login";
	}
	@PostMapping("/login")
	public String admin_login_post(AdminVO vo) {
		
		AdminVO checkedVO = service.selectOne(vo);
		
		if(checkedVO == null) {
			log.info("로그인 실패");
			return "/admin/login";
			
		}
		
		
		log.info("로그인 성공");
		return "/admin/main";
	}
	
	@GetMapping("/main")
	public String admin_show_main_page() {
		
		return "/admin/main";
	}
	
	
	@GetMapping("/register")
	public void admin_register_get() {
		log.info("register_get 요청");
	}
	
	
	
	@PostMapping(value="/register", consumes="application/json")
	public ResponseEntity<String> admin_register_post(@RequestBody Admin_testVO vos){
		log.info("admin_register_post 요청, num : "+vos.getNum());
		String num = vos.getNum();

		service.register(num);
		
//		service.test(1111111111);
		
		
		
		return new ResponseEntity<String>("성공", HttpStatus.OK);
	}
	
	
	
	
	
	
	
}
