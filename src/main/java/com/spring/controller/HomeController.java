package com.spring.controller;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.service.CustomerNoticeService;
import com.spring.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private CustomerNoticeService cn_service;
	
	@GetMapping("/")
	public String home(Model model, HttpServletRequest req, HttpSession session) {
		
		int N = 3;	// 몇개 뽑을건지
		Criteria cri = new Criteria(1, N);
		cri.setNotice_types("A");
		model.addAttribute("list_A", cn_service.notice_getList(cri));
		cri.setNotice_types("N");
		model.addAttribute("list_N", cn_service.notice_getList(cri));
		cri.setNotice_types("E");
		model.addAttribute("list_E", cn_service.notice_getList(cri));
		cri.setNotice_types("F");
		model.addAttribute("list_F", cn_service.notice_getList(cri));
		
		model.addAttribute("now", new Date().getTime());
		log.info("main페이지");
		
		
		
		
		
		
		
		return "main";
	}
	
	//testpage
	@GetMapping("/ft")
	public String GuideHeader() {
		return "footer_Main";
	}
	
	@GetMapping("/hd")
	public String newmain() {
		return "header_Main";
	}
	
//	@GetMapping("/Q")
//	public String Questions() {
//		return "Questions";
//	}
	
//	@GetMapping("/login")
//	public String loginPage() {
//		
//		
//		return "user/login";
//	}
	
	
//	@PostMapping("/login")
//	public void user_login_post(CustomerVO vo) {
//		
//		CustomerVO checkedVO = service.selectOne(vo);
//		
//		log.info(""+vo);
//		if(checkedVO == null) {
//			log.info("로그인 실패");
//			return "user/login";
//			
//		}
//		
//		
//		log.info("로그인 성공");
//		return "main";
		
//	}
	
	
	
	
	
	
	
	@GetMapping("/member/login_test")	// 로그인 테스트 페이지
	public String customer_test_login() {
		log.info("customer test_login 페이지 요청");
		
		
		return "/test_login";
	}
	@GetMapping("/member/test")	// 로그인 테스트 페이지
	public String login_test_success() {
		log.info("로그인 성공");
		
		
		return "/test_success";
	}
	

}
