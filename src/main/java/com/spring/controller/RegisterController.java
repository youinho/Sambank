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
import com.spring.service.AdminService;
import com.spring.service.RegisterService;
import com.spring.service.SBValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value= "/register/*",method = {RequestMethod.GET, RequestMethod.POST})
public class RegisterController {

	@Autowired
	private RegisterService service;
	@Autowired
	private SBValidator vali;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/agree")
	public String step1() {
		log.info("step1 요청");
		return "register/step1";
	}
	
	@PostMapping("/register")
	public String step2(@RequestParam(value="agree", defaultValue="false") boolean agree, RedirectAttributes rttr) {
	
		log.info("step2 요청 : "+agree);

		if(!agree) {
			rttr.addFlashAttribute("check", "false");
			return "redirect:/register/agree";
		}
		
		return "/register/step2";
	}
	
	@PostMapping("/register2")
	public String step3(CustomerVO vo, RedirectAttributes rttr) {
		//step2.jsp에서 회원가입정보 가져오기
		log.info("회원가입요청"+vo);
		
		
		
		boolean result = false;
		if(vali.check_customer(vo)) {
			vo.setPassword(passwordEncoder.encode(vo.getPassword()));
			result = adminService.register_customer(vo);
		}else {
			//log.info("validate 결과 : "+result);
		}
		if(result) {
			rttr.addFlashAttribute("registered", "success");
			rttr.addFlashAttribute("email", vo.getEmail());
			rttr.addFlashAttribute("name", vo.getName());
		}else {
			rttr.addFlashAttribute("registered", "failed");
			return "/register/step2";
		}
		return "redirect:/";
	}

}
