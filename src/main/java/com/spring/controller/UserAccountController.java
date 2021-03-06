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
import org.springframework.ui.Model;
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
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.Customer_delete_requestVO;
import com.spring.domain.Customer_requestVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historySumVO;
import com.spring.domain.Deposit_historyVO;
import com.spring.domain.PageVO;
import com.spring.domain.ProductVO;
import com.spring.service.AccountService;
import com.spring.service.AdminService;
import com.spring.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/useraccount/*")
public class UserAccountController {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private UserService usc;
	
	@Autowired
	private AdminService admin_service;
	
	@Autowired
	private AccountService account_service;
	
	
	@ResponseBody
	@PostMapping("/get_depositInfo")
	public ResponseEntity<DepositVO> get_depositInfo(String ano, HttpServletRequest req){
		logging(req);
		ano=ano.trim();
//		log.info("계좌확인중");
		
		DepositVO vo = admin_service.get_deposit(ano);
//		log.info(vo+"");
//		log.info("선택된 계좌번호 :"+vo.getAno());
		return new ResponseEntity<DepositVO>(vo, vo==null?HttpStatus.BAD_REQUEST:HttpStatus.OK);
		
	}
	
//	@ResponseBody
//	@PostMapping("/get_customerInfo")
//	public ResponseEntity<DepositVO> get_customerInfo(String cno){
//		ano=ano.trim();
//		log.info("계좌확인중");
//		
//		DepositVO vo = admin_service.get_deposit(ano);
////		log.info(vo+"");
////		log.info("선택된 계좌번호 :"+vo.getAno());
//		return new ResponseEntity<DepositVO>(vo, vo==null?HttpStatus.BAD_REQUEST:HttpStatus.OK);
//		
//	}
	
	@ResponseBody
	@PostMapping("/get_depositHistorySum")
	public ResponseEntity<Deposit_historySumVO> get_depositHistorySum(String ano, HttpServletRequest req){
		logging(req);
//		log.info("입출금 내역");
		
		Deposit_historySumVO vo = account_service.sum_deposit_withdrawal(ano);
//		log.info("입출금 내역"+vo+"");
//		log.info("선택된 계좌번호 :"+vo.getAno());
		return new ResponseEntity<Deposit_historySumVO>(vo, vo==null?HttpStatus.BAD_REQUEST:HttpStatus.OK);
		
	}
	
	//계좌검색
	@ResponseBody
	@PostMapping("/get_row")
	public ResponseEntity<DepositVO> get_row(String ano, HttpServletRequest req){
		logging(req);
		DepositVO vo = account_service.get_row(ano);
		
		if(vo != null) {
			return new ResponseEntity<DepositVO>(vo, HttpStatus.OK);
		}else {
			return new ResponseEntity<DepositVO>(vo, HttpStatus.BAD_REQUEST);
		}
	}
	//계좌 존재 유뮤 확인
	@ResponseBody
	@PostMapping("/exists_deposit_ano")
	public boolean exists_deposit_ano(String ano, HttpServletRequest req){
		logging(req);
		return admin_service.exists_deposit_ano(ano);
}
	
	@GetMapping("/deposit")
	public void deposit(Model modelMap,HttpServletRequest req) {
		logging(req);
//		log.info("계좌이체");	
		String id = req.getRemoteUser();
		int cno=Integer.parseInt(account_service.getCno(id));
		CustomerVO vo=admin_service.select_by_cno(cno);
		List<Acc_info> list = admin_service.select_acc_info(cno);
		modelMap.addAttribute("list",list);
//		return "useraccount/deposit";
	}
	
	//계좌 이체
	@PostMapping("/deposit")
	public String transfer_action(Deposit_historyVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
//		log.info("이체 진행중 "+ vo);
		String name=admin_service.check_ano(vo.getAno()).getName();
		String from_name=admin_service.check_ano(vo.getFrom_ano()).getName();
		vo.setName("인터넷");
		vo.setFrom_name(from_name);
		if(vo.getMessage()=="") 
			vo.setMessage(vo.getFrom_name());
		if(admin_service.withdraw(vo)) {
			rttr.addFlashAttribute("success", "true");
			rttr.addFlashAttribute("amount", vo.getAmount());
//			log.info("출금 성공");
			Deposit_historyVO other_vo;
			other_vo=vo;
			other_vo.setAno(vo.getFrom_ano());
			other_vo.setName("인터넷");
			String other_name=admin_service.check_ano(other_vo.getAno()).getName();
//			vo.setName(other_name);
			rttr.addFlashAttribute("from_name", vo.getFrom_name());
			if(vo.getMessage()=="") 
				other_vo.setMessage(vo.getFrom_name());
			if(admin_service.deposit(other_vo)) {
				log.info("입금 성공");
			}else {
				log.info("입금 실패");
			}
		}else {
			rttr.addFlashAttribute("success", "false");
			log.info("출금 실패");
		}
		
		return "redirect:/member/useraccount/deposit";
	}
		
	@GetMapping("/depositList")
	public void depositList(Model modelMap,HttpServletRequest req) {
		logging(req);
//		log.info("입출금확인");	
		String id = req.getRemoteUser();
		int cno=Integer.parseInt(account_service.getCno(id));
		CustomerVO vo=admin_service.select_by_cno(cno);
		List<Acc_info> list = admin_service.select_acc_info(cno);
		modelMap.addAttribute("list",list);
	
//		return "depositList";
	}
	
	//계좌 내역 정보
	@ResponseBody
	@PostMapping("/depositList/customer_get_history")
	public ResponseEntity<List<Deposit_historyVO>> get_history(String ano, String start_date, String end_date, HttpServletRequest req){
		logging(req);
//		log.info("get_history 요청 ano : "+ano);
//		log.info("get_history 요청 sDates : "+start_date);
//		log.info("get_history 요청 eDates : "+end_date);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		log.info("계좌 내역 정보 완료");
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
//			ano=ano.trim();
		list = admin_service.get_history(ano, start, end2);
//		log.info("history : "+list);
		return new ResponseEntity<List<Deposit_historyVO>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/accountCreate")
	public void accountCreate(Model modelMap,HttpServletRequest req) {
		logging(req);
//		log.info("계좌신청");	
		String id = req.getRemoteUser();
		int cno=Integer.parseInt(account_service.getCno(id));
		CustomerVO vo=admin_service.select_by_cno(cno);
		modelMap.addAttribute("vo",vo);
//		return "useraccount/accountCreate";
	}
	
	@PostMapping("/accountCreate")
	public String insertCreateRequest(Customer_requestVO vo, RedirectAttributes rttr,HttpServletRequest req){
		logging(req);
		String id = req.getRemoteUser();
		vo.setId(id);
		
//		log.info("입력중"+vo.getName());
//		log.info("type"+vo.getType());
//		log.info("product"+vo.getProduct());
//		log.info("방문일자 "+vo.getVisitDate());
		
		if(account_service.create_customer_request(vo)) {
			rttr.addFlashAttribute("success", "true");
		}
		else {
			rttr.addFlashAttribute("success", "false");
		}
		return "redirect:/member/useraccount/accountCreate";
	}

	//계좌삭제 신청
	@GetMapping("/accountDelete")
	public void accountDelete(Model modelMap,HttpServletRequest req) {
		logging(req);
		String id = req.getRemoteUser();
		int cno=Integer.parseInt(account_service.getCno(id));
		CustomerVO vo=admin_service.select_by_cno(cno);
		List<Acc_info> list = admin_service.select_acc_info(cno);
		modelMap.addAttribute("list",list);
		log.info("계좌삭제신청");	
		
//		return "/member/useraccount/accountDelete";
	}
	
	@PostMapping("/accountDelete")
	public String insertCreateDRequest(String ano, RedirectAttributes rttr,HttpServletRequest req){
		logging(req);
		String id = req.getRemoteUser();
//		vo.setId(id);
//		log.info("vo"+vo);
//		log.info("입력중"+vo.getName());
//		log.info("type"+vo.getType());
//		account_service.delete_account(ano);
//		account_service.create_customer_D_request(vo);
		if(account_service.delete_account(ano)) {
			rttr.addFlashAttribute("success", "true");
			
		}
		else {
			rttr.addFlashAttribute("success", "false");
			
		}
		return "redirect:/member/useraccount/accountDelete";
	}
	@ResponseBody
	@PostMapping("/get_deposit_customerInfo")
	public ResponseEntity<Customer_delete_requestVO> get_deposit_customerInfo(String ano, HttpServletRequest req){
		logging(req);
		ano=ano.trim();
		log.info("계좌확인중");
		
		Customer_delete_requestVO vo = account_service.ano_deposit_customer(ano);
		log.info(vo+"");
		log.info("선택된 계좌번호 :"+vo.getAno());
		return new ResponseEntity<Customer_delete_requestVO>(vo, vo==null?HttpStatus.BAD_REQUEST:HttpStatus.OK);
		
	}
	
	@GetMapping("/accountList")
	public void accountList(Model modelMap,HttpServletRequest req) {
		logging(req);
		String id = req.getRemoteUser();
		int cno=Integer.parseInt(account_service.getCno(id));
		List<DepositVO> list=account_service.cnoDeposit(cno);
		
		long sumBalance=account_service.cnoSumBalnce(cno);
		modelMap.addAttribute("list",list);
		modelMap.addAttribute("sumBalance",sumBalance);
		log.info("계좌목록");	
//		return "useraccount/accountList";
	}

	@PostMapping("/depositListAll")
	public String depositListAll(String ano, String start_date, String end_date, Model modelMap,HttpServletRequest req) {
		logging(req);
		log.info("계좌 전체 보기"+ano+""+start_date);
		modelMap.addAttribute("ano",ano);
		modelMap.addAttribute("start_date",start_date);
		modelMap.addAttribute("end_date",end_date);
		return "/member/useraccount/depositListAll";
	}
	//계좌 상품 불러오기
	@ResponseBody
	@PostMapping("/getProduct")
	public ResponseEntity<List<ProductVO>> getProduct(int type, HttpServletRequest req){
		logging(req);
		List<ProductVO> list = admin_service.acc_getProduct(type);
		if(list.isEmpty()) {
			return new ResponseEntity<List<ProductVO>>(list, HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<List<ProductVO>>(list, HttpStatus.OK);
	}
	
	
//주소 검색 팝업
	@GetMapping("/jusopopup")
	public String juso_popup(HttpServletRequest req) {
		logging(req);
		log.info("jusopopup 요청");
		return "/member/useraccount/jusopopup";
	}
	@PostMapping("/jusopopup")
	public String juso_popup_post(HttpServletRequest req) {
		logging(req);
		log.info("jusopopup_post 요청");
		return "/member/useraccount/jusopopup";
	}
	//비밀번호 입력 팝업
	@GetMapping("/passpopup")
	public String passpopup(Model model, HttpServletRequest req) {
		
		//logging(req);
		//log.info("passpopup 요청");
		model.addAttribute("wInput", "password");
		return "member/useraccount/passpopup2";
	}

	
	@GetMapping("/passpopup_c")
	public String passpopup_c(Model model, HttpServletRequest req) {
		//logging(req);
		//log.info("passpopup_c 요청");
		model.addAttribute("wInput", "confirm_password");
		return "/member/useraccount/passpopup";
	}
	
	@ResponseBody
	@PostMapping("card_count")
	public ResponseEntity<Integer> card_count(String ano){
		int cardCount=account_service.ano_card_count(ano);
		return new ResponseEntity<Integer>(cardCount, cardCount<0?HttpStatus.BAD_REQUEST:HttpStatus.OK);
	}
	//계좌 비밀번호 확인
	@ResponseBody
	@PostMapping("/check_password")
	public ResponseEntity<String> check_account_password(DepositVO vo, @RequestParam("password") String password, HttpServletRequest req){
		logging(req);
		log.info("비번확인중");
		log.info("ano "+vo.getAno());
		if(vo.getPassword()==null)
			return new ResponseEntity<String>("false", HttpStatus.BAD_REQUEST);
		if(!vo.getPassword().equals(password)||vo.getPassword().length()!=4) {
			return new ResponseEntity<String>("false", HttpStatus.BAD_REQUEST);
		}
		try {
			Integer.parseInt(vo.getPassword());
		} catch (Exception e) {
			return new ResponseEntity<String>("false", HttpStatus.BAD_REQUEST);
		}
		if(admin_service.check_deposit_password(vo)) {
			return new ResponseEntity<String>("true", HttpStatus.OK);
		}
		return new ResponseEntity<String>("false", HttpStatus.BAD_REQUEST);
		}
		
	/*
	 * @GetMapping("/popup/jusopopup") public String juso_popup(HttpServletRequest
	 * req) { //logging(req); //log.info("jusopopup 요청"); return
	 * "/useraccount/jusopopup"; }
	 * 
	 * @PostMapping("/popup/jusopopup") public String
	 * juso_popup_post(HttpServletRequest req) { //logging(req);
	 * //log.info("jusopopup_post 요청"); return "/useraccount/jusopopup"; }
	 */
	
	
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
