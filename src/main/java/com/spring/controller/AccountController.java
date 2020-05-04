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
	private AdminService admin_sevice;
	
	
	@GetMapping("/account")
	public void account(ModelMap modelMap,HttpServletRequest req) {
		log.info("account 요청");
		String id = req.getRemoteUser();

		int cno=Integer.parseInt(service.getCno(id));
		CustomerVO vo=admin_sevice.select_by_cno(cno);
		String name=vo.getName();
		List<Acc_info> list = admin_sevice.select_acc_info(cno);
		
		modelMap.addAttribute("list",list);
		modelMap.addAttribute("cno",cno);
		modelMap.addAttribute("name",name);
		log.info(cno+"");
		log.info(list+"");
	}

	
	//계좌 내역 정보
	@ResponseBody
	@PostMapping("/account/customer_get_history")
	public ResponseEntity<List<Deposit_historyVO>> get_history(String ano, String start_date, String end_date, HttpServletRequest req){
		//log.info("get_history 요청 ano : "+ano);
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
		list = admin_sevice.get_history(ano, start, end2);
		//log.info("history : "+list);
		return new ResponseEntity<List<Deposit_historyVO>>(list, HttpStatus.OK);
	}
	



	@GetMapping("/balance")
	public void get_balance(ModelMap modelMap, HttpServletRequest req) {
	
	
	
		String ano="10235034475230";
		String id = req.getRemoteUser();
		
		long c_balance=service.balnce(ano);
		
		modelMap.addAttribute("c_balance",c_balance);
		log.info(c_balance+"");
	}

}