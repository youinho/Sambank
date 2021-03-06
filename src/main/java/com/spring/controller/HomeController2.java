package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Acc_info;
import com.spring.domain.AdminVO;
import com.spring.domain.Admin_logVO;
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
	
	
	
	//주소 검색 팝업
	@GetMapping("/popup/jusopopup")
	public String juso_popup(HttpServletRequest req) {
		logging(req);
//		log.info("jusopopup 요청");
		return "/popup/jusopopup";
	}
	@PostMapping("/popup/jusopopup")
	public String juso_popup_post(HttpServletRequest req) {
		logging(req);
//		log.info("jusopopup_post 요청");
		return "/popup/jusopopup";
	}
	
	@GetMapping("/member/customer/modify")
	public void member_customer_modify_get(Model model, HttpServletRequest req) {
//		log.info("memeber customer modify get");
		logging(req);
		model.addAttribute("vo", service.select_by_id(req.getRemoteUser()));
	}
	
	
	//고객 비밀번호 수정
	@PostMapping("/member/customer_update_password")
	@ResponseBody
	public ResponseEntity<String> admin_update_password(CustomerVO vo, HttpServletRequest req){
		logging(req);
		if(vali.check(SBValidator.REG_PWD, vo.getPassword())) {
			if(vo.getPassword().equals(vo.getConfirm_password())) {
				if(vo.getId()!=null) {
					
					vo.setPassword(passwordEncoder.encode(vo.getPassword()));
					if(service.customer_update_password(vo)) {
						return new ResponseEntity<String>("success", HttpStatus.OK);						
					}
				}
			}
		}
		return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
	}
	
	
	//고객 정보 수정
	@PostMapping("/member/customer/modify")
	public String update_customer(CustomerVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
//		log.info("update_customer_post vo : "+vo);
		CustomerVO ori_vo = service.select_by_id(req.getRemoteUser());
//		log.info("ori_vo : "+ori_vo);
		vo.setName(ori_vo.getName());
		vo.setEng_name(ori_vo.getEng_name());
		vo.setGender(ori_vo.getGender());
		vo.setCno(ori_vo.getCno());
		boolean result = false;
		if(vali.check_customer_update(vo)) {
			result = service.update_customer(vo);
		}else {
			//log.info("validate 결과 : "+result);
		}
		if(result) {
			rttr.addFlashAttribute("updated", "success");
			rttr.addFlashAttribute("name", vo.getName());
		}else {
			rttr.addFlashAttribute("updated", "failed");
		}
		return "redirect:/member/customer/modify";
	}

	@GetMapping("/member/customer/delete")
	public void member_customer_delete_get(Model model, HttpServletRequest req) {
		logging(req);
		CustomerVO vo = service.select_by_id(req.getRemoteUser());
		model.addAttribute("vo", vo);
//		log.info("member customer delete get");
	}
	
	
	//고객 정보 삭제
	@PostMapping("/member/customer/delete")
	public String member_customer_delete_post(CustomerVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		logging(req);
		if(vo.getPassword().equals(vo.getConfirm_password())) {
			if(service.check_customer_password(vo)) {
				if(service.delete_customer(vo)) {
					rttr.addFlashAttribute("deleted", "success");
					return "redirect:/";
				}
			}
		}
		rttr.addFlashAttribute("deleted", "failed");
		return "redirect:/admin/customer/delete";
	}
	
	
	
	
	
	
	
	
	
	//계좌 정보 불러오기
	@ResponseBody
	@PostMapping("/member/account/getAccInfo")
	public ResponseEntity<List<Acc_info>> get_accinfo(HttpServletRequest req){
//		log.info("member account getAccInfo");
		logging(req);
		List<Acc_info> list = service.select_acc_info(service.select_by_id(req.getRemoteUser()).getCno());
		if(list.isEmpty()) {
			return new ResponseEntity<List<Acc_info>>(list, HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<List<Acc_info>>(list, HttpStatus.OK);
	}
	
	
	
	
	
	private boolean logging(HttpServletRequest req) {
		Admin_logVO vo = new Admin_logVO();
		String parameter_names="";
		vo.setId(req.getRemoteUser());
		if(vo.getId()==null) {
			vo.setId("Anonymous");
		}
		vo.setUri("["+req.getMethod()+"]"+req.getRequestURI());
		vo.setLocal_name(req.getLocalName());
		vo.setLocal_addr(req.getLocalAddr());
		vo.setLocal_port(req.getLocalPort()+"");
		vo.setRemote_addr(req.getRemoteAddr());
		vo.setRemote_port(req.getRemotePort()+"");
		if(req.getRequestedSessionId()!=null) {
			vo.setAdmin_session(req.getRequestedSessionId());
		}else {
			vo.setAdmin_session("");
		}
		//log.info("log vo : "+vo);
		if(req.getParameterNames().hasMoreElements()) {
			parameter_names=req.getParameterMap().keySet().toString();
		}
		vo.setParameter_names(parameter_names);
		return service.insertLog_customer(vo);
	}
}
