package com.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/popup/*")
public class Admin_PopupController {

	@GetMapping("/searchCS")
	public String searchCS() {
		log.info("searchCS 요청");
		return "/popup/search_customer_popup";
	}
	

	@GetMapping("/jusopopup")
	public String juso_popup() {
		log.info("jusopopup 요청");
		return "/popup/jusopopup";
	}
	@PostMapping("/jusopopup")
	public String juso_popup_post() {
		log.info("jusopopup_post 요청");
		return "/popup/jusopopup";
	}
	
	@GetMapping("/passpopup")
	public String passpopup(Model model) {
		log.info("passpopup 요청");
		model.addAttribute("wInput", "password");
		return "/popup/passpopup";
	}
	
	@GetMapping("/passpopup_c")
	public String passpopup_c(Model model) {
		log.info("passpopup_c 요청");
		model.addAttribute("wInput", "confirm_password");
		return "/popup/passpopup";
	}
	
	
	@GetMapping("/searchAD")
	public String popup_searchAD() {
		log.info("popup searchAD 요청");
		return "/popup/search_admin_popup";
	}
	
	
}
