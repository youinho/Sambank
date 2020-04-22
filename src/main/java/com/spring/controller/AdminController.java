package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.Admin_testVO;
import com.spring.domain.CustomerVO;
import com.spring.service.AdminService;
import com.spring.service.SBValidator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/admin/*")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@Autowired
	private SBValidator vali;
	
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
	
	@GetMapping("/create_account")
	public void create_account_get() {
		log.info("create_account_get 요청");
	}
	
	@GetMapping("/register_customer")
	public void register_customer_get() {
		log.info("register_customer_get 요청");
	}
	
	@PostMapping("/create_account")
	public void create_account_post(int cat, int cno, String ano) {
		log.info("create_account_post 요청, cno, ano : "+cno+" "+ano);
		
		CustomerVO vo = service.select_by_cno(cno);
		log.info("select by cno : "+vo);
		
		
		
		
		service.create_deposit(cno, ano);
	}
	
	
	
	@PostMapping("/register_customer")
	public void register_customer_post(CustomerVO vo) {
		log.info("register_customer_post vo : "+vo);
		boolean result = false;
		if(vali.check_customer(vo)) {
			result = service.register_customer(vo);
		}
		if(result) {
			
		}
		
	}
	@GetMapping("/deposit_list")
	public void deposit_list_get(Model model) {
		log.info("deposit_list_get 요청");
		model.addAttribute("list", service.get_deposit_list());
		
	}
	
	
	@GetMapping("/header")
	public void header() {
		log.info("header 요청");
	}
	
	
	
	
	
	@PostMapping("/search")
	@ResponseBody
	public ResponseEntity<List<CustomerVO>> search(String name, String birth, String mobile) {
		log.info("search"+name+birth+mobile);
		
		List<CustomerVO> list = service.search_customer(name, birth, mobile);
		if(list.isEmpty()) {
			return new ResponseEntity<List<CustomerVO>>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<List<CustomerVO>>(list, HttpStatus.OK);
		
	}
	
	
	
	
	
	
	
	@PostMapping("/call_ano")
	@ResponseBody
	private ResponseEntity<String> create_ano(int cat, int cno) {
		log.info("call_ano 요청");
		CustomerVO vo = service.select_by_cno(cno);
		String name = vo.getName();
		String mobile = vo.getMobile();
		String reg = vo.getResident_registration_no();
		
		
		ResponseEntity<String> res = null;
		
		String ano = "";
		boolean run = true;
		while(run) {
			ano = "";
			ano += cat;
			
			String code = name.hashCode() + "";
			
			ano += code.substring(code.length()-6);
		
			ano += mobile.substring(mobile.length()-4);
		
			ano += reg;
			
			ano += (int)(Math.random()*10);
			if(!service.exists_deposit_ano(ano))
				run = false;
				
		}
		if(ano.length() == 14) {
			res = new ResponseEntity<String>(ano, HttpStatus.OK); 
			
		}
		return res;
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(String id) {
		if(service.checkId(id)) {
			log.info("id 중복");
			return "false";
		}else {
			log.info("id 가능");
			return "true";
		}
	}
	
	
	
	
	
	
	
	
}
