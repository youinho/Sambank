package com.spring.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Acc_info;
import com.spring.domain.Admin_logVO;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historyVO;
import com.spring.service.AccountService;
import com.spring.service.AdminService;
import com.spring.service.RegisterService;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/account/*")
public class AccountController {
	
	@Autowired
	private AccountService service;
	@Autowired
	private AdminService admin_service;
	
	//둘중 하나는 지울거
	//계좌 정보 불러오기
	@ResponseBody
	@PostMapping("/customer_get_depositInfo")
	public ResponseEntity<DepositVO> get_depositInfo(String ano, HttpServletRequest req){
		logging(req);
		ano=ano.trim();
		DepositVO vo = admin_service.get_deposit(ano);
		
		
		return new ResponseEntity<DepositVO>(vo, vo==null?HttpStatus.BAD_REQUEST:HttpStatus.OK);
		
	}
	
	//계좌검색
	@ResponseBody
	@PostMapping("/transfer/check_ano")
	public ResponseEntity<DepositVO> check_ano(String ano, HttpServletRequest req){
		logging(req);
		DepositVO vo = admin_service.check_ano(ano);
		//log.info("check_ano vo : "+vo);
		if(vo != null) {
			return new ResponseEntity<DepositVO>(vo, HttpStatus.OK);
		}else {
			return new ResponseEntity<DepositVO>(vo, HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/account")
	public void account(ModelMap modelMap,HttpServletRequest req) {
		logging(req);
		log.info("account 요청");
		String id = req.getRemoteUser();

		int cno=Integer.parseInt(service.getCno(id));
		CustomerVO vo=admin_service.select_by_cno(cno);
		String name=vo.getName();
		List<Acc_info> list = admin_service.select_acc_info(cno);
	
		modelMap.addAttribute("list",list);
		modelMap.addAttribute("cno",cno);
		modelMap.addAttribute("name",name);
//		log.info(cno+"");
//		log.info(list+"");
	}

	
	//계좌 내역 정보
	@ResponseBody
	@PostMapping("/account/customer_get_history")
	public ResponseEntity<List<Deposit_historyVO>> get_history(String ano, String start_date, String end_date, HttpServletRequest req){
		logging(req);
		log.info("get_history 요청 ano : "+ano);
		//log.info("get_history 요청 sDates : "+start_date);
		//log.info("get_history 요청 eDates : "+end_date);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		log.info("계좌 내역 정보 완료");
		Calendar cal = Calendar.getInstance();
		Date start = null;
		Date end = null;
		Date end2 = null;
		List<Deposit_historyVO> list = null;
		try {
			start = transFormat.parse(start_date);
			end = transFormat.parse(end_date);
			cal.setTime(end);
			cal.add(Calendar.DATE, 1);
			end2 = transFormat.parse(transFormat.format(cal.getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
			return new ResponseEntity<List<Deposit_historyVO>>(list, HttpStatus.BAD_REQUEST);
		}
		//log.info("get_history 요청 sDate : "+start);
		//log.info("get_history 요청 eDate : "+end2);
//		ano=ano.trim();
		list = admin_service.get_history(ano, start, end2);
		log.info("history : "+list);
		return new ResponseEntity<List<Deposit_historyVO>>(list, HttpStatus.OK);
	}
	
	//계좌이체
	@GetMapping("/transfer")
	public void transfer_pre(ModelMap modelMap, HttpServletRequest req) {
		logging(req);
		String id = req.getRemoteUser();
		int cno=Integer.parseInt(service.getCno(id));
		CustomerVO vo=admin_service.select_by_cno(cno);
		String name=vo.getName();
		List<Acc_info> list = admin_service.select_acc_info(cno);
	
		modelMap.addAttribute("list",list);
		modelMap.addAttribute("cno",cno);
		modelMap.addAttribute("name",name);
	
//		log.info("계좌이체 준비완료");
	}

	
	//계좌 이체
	@PostMapping("/transfer")
	public String transfer_action(Deposit_historyVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		log.info(vo+"");
		logging(req);
		if(admin_service.withdraw(vo)) {
			rttr.addFlashAttribute("success", "true");
			rttr.addFlashAttribute("from_name", vo.getFrom_name());
			rttr.addFlashAttribute("amount", vo.getAmount());
			log.info("출금 성공");
			Deposit_historyVO other_vo;
			other_vo=vo;
			other_vo.setAno(vo.getFrom_ano());
			other_vo.setName(vo.getFrom_name());
			if(admin_service.deposit(other_vo)) {
				log.info("입금 성공");
			}else {
				
				log.info("입금 실패");
			}
		}else {
			rttr.addFlashAttribute("success", "false");
			log.info("출금 실패");
		}
		
		return "redirect:/member/account/transfer";
	}
	//계좌확인
	@GetMapping("/balance")
	public void get_balance(ModelMap modelMap, HttpServletRequest req) {
		logging(req);
		log.info("account 요청");
		String id = req.getRemoteUser();

		int cno=Integer.parseInt(service.getCno(id));
		CustomerVO vo=admin_service.select_by_cno(cno);
		String name=vo.getName();
		List<Acc_info> list = admin_service.select_acc_info(cno);
	
		modelMap.addAttribute("list",list);
		modelMap.addAttribute("cno",cno);
		modelMap.addAttribute("name",name);
	
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
		return admin_service.insertLog_customer(vo);
	}
}