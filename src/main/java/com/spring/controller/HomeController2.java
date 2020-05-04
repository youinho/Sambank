package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CustomerVO;
import com.spring.service.AdminService;
import com.spring.service.SBValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController2 {

	@Autowired
	private AdminService service;
	@Autowired
	private SBValidator vali;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	//고객 아이디 중복 확인
	@ResponseBody
	@PostMapping("/customer/checkId")
	public String checkId(String id, HttpServletRequest req) {
	
		if(service.checkId(id)) {
			//log.info("id 중복");
			return "false";
		}else {
			//log.info("id 가능");
			return "true";
		}
	}
	
	
	@PostMapping("/register/step3")
	public String step3(CustomerVO vo, RedirectAttributes rttr) {
		//step2.jsp에서 회원가입정보 가져오기
		log.info("회원가입요청"+vo);
		
		
		
		boolean result = false;
		if(vali.check_customer(vo)) {
			vo.setPassword(passwordEncoder.encode(vo.getPassword()));
			result = service.register_customer(vo);
		}else {
			//log.info("validate 결과 : "+result);
		}
		if(result) {
			rttr.addFlashAttribute("registered", "success");
			rttr.addFlashAttribute("name", vo.getName());
		}else {
			rttr.addFlashAttribute("registered", "failed");
			return "/register/step2";
		}
		return "redirect:/";
	}
	//주소 검색 팝업
	@GetMapping("/popup/jusopopup")
	public String juso_popup(HttpServletRequest req) {
		
		log.info("jusopopup 요청");
		return "/popup/jusopopup";
	}
	@PostMapping("/popup/jusopopup")
	public String juso_popup_post(HttpServletRequest req) {
		
		log.info("jusopopup_post 요청");
		return "/popup/jusopopup";
	}
}
