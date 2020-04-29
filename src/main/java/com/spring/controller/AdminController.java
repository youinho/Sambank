package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException.BadRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Acc_info;
import com.spring.domain.AdminVO;
import com.spring.domain.Admin_groupVO;
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.CardVO;
import com.spring.domain.Card_productVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historyVO;
import com.spring.domain.PageVO;
import com.spring.domain.ProductVO;
import com.spring.service.AdminService;
import com.spring.service.SBValidator;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Slf4j
@RequestMapping(value="/admin/*")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@Autowired
	private SBValidator vali;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	
	
	
	
	
	
	
	//admin -------------------------------
	@ResponseBody
	@PostMapping("/searchAD")
	public ResponseEntity<List<AdminVO>> get_admins(AdminVO vo, HttpServletRequest req){
		log.info("searchAD 요청"+vo);
		if(vo.getBranch()==null) {
			vo.setBranch("");
		}
		if(vo.getName()==null) {
			vo.setName("");
		}
		if(vo.getId()==null) {
			vo.setId("");
		}
		vo.setAuthority(service.get_groupID(req.getRemoteUser()));
		
		

		
		List<AdminVO> list = service.get_admins(vo);
		
		if(list.size()==0) {
			return new ResponseEntity<List<AdminVO>>(list, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<List<AdminVO>>(list, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/login")
	public String admin_login() {
		log.info("admin_login 페이지 요청");
		
		
		return "/admin/login";
	}
	
	@ResponseBody
	@PostMapping("/getAdminInfo")
	public ResponseEntity<AdminVO> get_adminInfo(String id){
		AdminVO vo = service.get_adminInfo(id);
		vo.setPassword("");
		
		
		log.info("return vo : "+vo);
		return new ResponseEntity<AdminVO>(vo, HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/get_adminInfo")
	public ResponseEntity<AdminVO> get_adminInfo(HttpServletRequest req){
		AdminVO vo = service.selectOne(req.getRemoteUser());
		vo.setPassword("");
		vo.setMobile("");
		
		log.info("return vo : "+vo);
		return new ResponseEntity<AdminVO>(vo, HttpStatus.OK);
	}
	
	@GetMapping("/header")
	public void header() {
		log.info("header 요청");
	}
	
	@GetMapping("/manage")
	public void admin_manage(HttpServletRequest req, Model model) {
		log.info("admin manage 요청");
		List<Admin_groupVO> list = service.get_groupList(req.getRemoteUser());
		model.addAttribute("groups", list);
	}
	
	@PostMapping("/admin_update_password")
	@ResponseBody
	public ResponseEntity<String> admin_update_password(AdminVO vo){
		if(vali.check(SBValidator.REG_PWD, vo.getPassword())) {
			if(vo.getPassword().equals(vo.getConfirm_password())) {
				if(vo.getId()!=null) {
					vo.setPassword(passwordEncoder.encode(vo.getPassword()));
					if(service.admin_update_password(vo)) {
						return new ResponseEntity<String>("success", HttpStatus.OK);						
					}
				}
			}
		}
		return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		
	}
	
	@PostMapping("/registerAdmin")
	public String insert_admin(AdminVO vo, RedirectAttributes rttr) {
		
		
		
		if(vali.check(SBValidator.REG_PWD, vo.getPassword())) {
			if(vo.getPassword().equals(vo.getConfirm_password())) {
				if(vo.getId()!=null && vo.getBranch()!=null && vo.getRank()!= null && vo.getMobile()!=null && !vo.getGroup_id().equals("-1") && vo.getName()!=null && vo.getEnabled()!=-1) {
					vo.setPassword(passwordEncoder.encode(vo.getPassword()));
					if(service.admin_insert(vo)) {
						rttr.addFlashAttribute("registered", "true");
						rttr.addFlashAttribute("name", vo.getName());
						return "redirect:/admin/manage";
					}
				}
			}
		}
		rttr.addFlashAttribute("registered", "false");
		return "redirect:/admin/manage";
	}
	
	
	
	
	
	// account
	@ResponseBody
	@PostMapping("/account/check_ano")
	public ResponseEntity<DepositVO> check_ano(String ano){
		
		DepositVO vo = service.check_ano(ano);
		log.info("check_ano vo : "+vo);
		if(vo != null) {
			return new ResponseEntity<DepositVO>(vo, HttpStatus.OK);
		}else {
			return new ResponseEntity<DepositVO>(vo, HttpStatus.BAD_REQUEST);
		}
		
		
	}
	
	
	
	
	@PostMapping("/account/deposit")
	public String deposit(Deposit_historyVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		vo.setName(service.selectOne(req.getRemoteUser()).getBranch()+" 입금");
		vo.setFrom_ano("");
		if(service.deposit(vo)) {
			rttr.addFlashAttribute("success", "true");
			rttr.addFlashAttribute("ano", vo.getAno());
			rttr.addFlashAttribute("amount", vo.getAmount());
		}else {
			rttr.addFlashAttribute("success", "false");
		}
		
		
		return "redirect:/admin/account/deposit";
	}
	
	@PostMapping("/account/withdraw")
	public String withdraw(Deposit_historyVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		vo.setName(service.selectOne(req.getRemoteUser()).getBranch()+" 출금");
		vo.setFrom_ano("");
		if(service.withdraw(vo)) {
			rttr.addFlashAttribute("success", "true");
			rttr.addFlashAttribute("ano", vo.getAno());
			rttr.addFlashAttribute("amount", vo.getAmount());
			log.info("출금 성공");
		}else {
			rttr.addFlashAttribute("success", "false");
			log.info("출금 실패");
		}
		
		
		return "redirect:/admin/account/withdraw";
	}
	
	
	@GetMapping("/account/deposit")
	public void deposit_get() {
		log.info("deposit get 요청");
	}
	
	@GetMapping("/account/withdraw")
	public void withdraw_get() {
		log.info("withdraw get 요청");
	}
	
	
	@GetMapping("/account/delete")
	public String delete_account() {
		log.info("delete_account_get 요청");
		return "/admin/account/delete";
	}
	
	@PostMapping("/account/delete")
	public String delete_account_post(DepositVO vo, @RequestParam("confirm_password") String confirm_password, RedirectAttributes rttr) {
		log.info("계좌 삭제 요청"+confirm_password+vo);
		if(!vo.getPassword().equals(confirm_password) || !service.check_deposit_password(vo)) {
			rttr.addFlashAttribute("deleted", "false");
			return "redirect:/admin/account/delete";
		}
		
		if(service.delete_deposit(vo)) {
			rttr.addFlashAttribute("ano", vo.getAno());
			rttr.addFlashAttribute("deleted", "true");
			return "redirect:/admin/account/delete";
		}
		
		rttr.addFlashAttribute("deleted", "false");
		return "redirect:/admin/account/delete";
	}
	
	
	
	
	@GetMapping("/account/modify")
	public String modify_account() {
		log.info("modifyaccount 요청");
		return "/admin/account/modify";
		
	}
	
	@PostMapping("/account/modify")
	public String update_account(DepositVO vo, RedirectAttributes attr, Model model) {
		log.info("update_account 요청");
		
		if(!vali.check_account_update(vo)) {
			model.addAttribute("updated", "false");
			return "/admin/account/modify";
		}
		
		
		if(service.update_withdraw(vo)) {
			
			attr.addFlashAttribute("updated", "true");
			attr.addFlashAttribute("ano", vo.getAno());
			
			return "redirect:/admin/account/modify";
		}
		model.addAttribute("updated", "false");
		return "/admin/account/modify";
		
	}
	
	
	
	
	@PostMapping("/account/create")
	public String create_account_post(DepositVO vo,@RequestParam("confirm_password") String confirm_password, RedirectAttributes rttr, HttpServletRequest req) {
		
		if(vo.getPassword()==null) {
			rttr.addFlashAttribute("created", "false");
			return "redirect:/admin/account/create";
		}
		
		if(!vo.getPassword().equals(confirm_password)||vo.getPassword().length()!=4) {
			rttr.addFlashAttribute("created", "false");
			return "redirect:/admin/account/create";
		}
		try {
			Integer.parseInt(vo.getPassword());
		} catch (Exception e) {
			rttr.addFlashAttribute("created", "false");
			return "redirect:/admin/account/create";
		}
		AdminVO admin_vo = service.selectOne(req.getRemoteUser());
		vo.setBranch(admin_vo.getBranch());
		if(!vali.check_account_register(vo)) {
			rttr.addFlashAttribute("created", "false");
			return "redirect:/admin/account/create";
		}
			
		
		log.info("create_account_post 요청 "+vo);
		
		CustomerVO cs_vo = service.select_by_cno(vo.getCno());
		log.info("select by cno : "+cs_vo);
		
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		
		if(service.create_deposit(vo)) {
			rttr.addFlashAttribute("created", "true");
			rttr.addFlashAttribute("name", cs_vo.getName());
		}else {
			rttr.addFlashAttribute("created", "false");
		}
		return "redirect:/admin/account/create";
	}
	
	

	@GetMapping("/account/create")
	public String create_account_get() {
		log.info("create_account_get 요청");
		return "/admin/account/create";
	}
	
	@ResponseBody
	@PostMapping("/account/getProduct")
	public ResponseEntity<List<ProductVO>> getProduct(int type){
		
		List<ProductVO> list = service.acc_getProduct(type);
		
		if(list.isEmpty()) {
			return new ResponseEntity<List<ProductVO>>(list, HttpStatus.BAD_REQUEST);
		}
		
		
		return new ResponseEntity<List<ProductVO>>(list, HttpStatus.OK);
		
		
	}
	
	@ResponseBody
	@PostMapping("/account/getAccInfo")
	public ResponseEntity<List<Acc_info>> get_accinfo(int cno){
		
		List<Acc_info> list = service.select_acc_info(cno);
		
		if(list.isEmpty()) {
			return new ResponseEntity<List<Acc_info>>(list, HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<List<Acc_info>>(list, HttpStatus.OK);
	}
	
	
	
	
	@PostMapping("/account/call_ano")
	@ResponseBody
	public ResponseEntity<String> create_ano(int product, int cno) {
		log.info("call_ano 요청");
		CustomerVO vo = service.select_by_cno(cno);
		String name = vo.getName();
		String mobile = vo.getMobile();
		
		
		ResponseEntity<String> res = null;
		
		String ano = "";
		boolean run = true;
		
		// 상품번호 3자리  +  이름 6자리  +  전화번호 3자리  +  랜덤 2자리  => 14자리
		while(run) {
			ano = "";
			ano += product;
			
			String code = name.hashCode() + "";
			
			ano += code.substring(code.length()-6);
		
			ano += mobile.substring(mobile.length()-3);
			
			ano += (int)(Math.random()*10);
			ano += (int)(Math.random()*10);
			if(!service.exists_deposit_ano(ano))
				run = false;
				
		}
		if(ano.length() == 14) {
			res = new ResponseEntity<String>(ano, HttpStatus.OK); 
			
		}
		return res;
	}
	
	
	@GetMapping("/account/list")
	public void deposit_list_get(Model model) {
		log.info("deposit_list_get 요청");
		model.addAttribute("list", service.get_deposit_list());
		
	}
	
	
	
	@ResponseBody
	@PostMapping("/account/get_depositInfo")
	public ResponseEntity<DepositVO> get_depositInfo(String ano){
		
		DepositVO vo = service.get_deposit(ano);
		
		return new ResponseEntity<DepositVO>(vo, vo==null?HttpStatus.BAD_REQUEST:HttpStatus.OK);
		
	}
	
	
	
	
	@ResponseBody
	@PostMapping("/account/update_password")
	public ResponseEntity<String> update_deposit_password(DepositVO vo, @RequestParam("confirm_password") String confirm_password){
		log.info("비밀번호 변경 요청con:"+confirm_password+vo);
		if(vo.getPassword()==null)
			return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		
		if(!vo.getPassword().equals(confirm_password)||vo.getPassword().length()!=4) {
			return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		}
		try {
			Integer.parseInt(vo.getPassword());
		} catch (Exception e) {
			return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		}
		
		
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		
		if(service.update_password(vo)) {
			log.info("update password success "+vo);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		
		log.info("update password failed"+vo);
		return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
	}
	@ResponseBody
	@PostMapping("/account/check_password")
	public ResponseEntity<String> check_account_password(DepositVO vo, @RequestParam("confirm_password") String confirm_password){
		if(vo.getPassword()==null)
			return new ResponseEntity<String>("false", HttpStatus.BAD_REQUEST);
		
		if(!vo.getPassword().equals(confirm_password)||vo.getPassword().length()!=4) {
			return new ResponseEntity<String>("false", HttpStatus.BAD_REQUEST);
		}
		try {
			Integer.parseInt(vo.getPassword());
		} catch (Exception e) {
			return new ResponseEntity<String>("false", HttpStatus.BAD_REQUEST);
		}
		if(service.check_deposit_password(vo)) {
			return new ResponseEntity<String>("true", HttpStatus.OK);
		}
		return new ResponseEntity<String>("false", HttpStatus.BAD_REQUEST);
		
	}
	
	// customer @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	
	
	@PostMapping("/customer/register")
	public String register_customer_post(CustomerVO vo, RedirectAttributes rttr) {
		log.info("register_customer_post vo : "+vo);
		boolean result = false;
		
		if(vali.check_customer(vo)) {
			vo.setPassword(passwordEncoder.encode(vo.getPassword()));
			result = service.register_customer(vo);
		}else {
			log.info("validate 결과 : "+result);
		}
		
		
		
		if(result) {
			rttr.addFlashAttribute("registered", "success");
			rttr.addFlashAttribute("name", vo.getName());
		}else {
			rttr.addFlashAttribute("registered", "failed");
		}
		return "redirect:/admin/customer/register";
	}
	
	@GetMapping("/customer/register")
	public void register_customer_get() {
		log.info("register_customer_get 요청");
	}
	
	
	@ResponseBody
	@PostMapping("/customer/checkId")
	public String checkId(String id) {
		if(service.checkId(id)) {
			log.info("id 중복");
			return "false";
		}else {
			log.info("id 가능");
			return "true";
		}
	}
	
	
	
	@PostMapping("/customer/search")
	@ResponseBody
	public ResponseEntity<List<CustomerVO>> search(String name, String birth, String mobile) {
		log.info("search"+name+birth+mobile);
		
		List<CustomerVO> list = service.search_customer(name, birth, mobile);
		if(list.isEmpty()) {
			return new ResponseEntity<List<CustomerVO>>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<List<CustomerVO>>(list, HttpStatus.OK);
		
	}
	
	@GetMapping("/customer/modify")
	public String modify_customer() {
		log.info("modify_customer_get 요청");
		
		return "/admin/customer/modify";
	}
	
	@PostMapping("/customer/modify")
	public String update_customer(CustomerVO vo, RedirectAttributes rttr) {
		
		
		log.info("update_customer_post vo : "+vo);
		boolean result = false;
		if(vali.check_customer_update(vo)) {
			result = service.update_customer(vo);
		}else {
			log.info("validate 결과 : "+result);
		}
		
		
		
		if(result) {
			rttr.addFlashAttribute("updated", "success");
			rttr.addFlashAttribute("name", vo.getName());
		}else {
			rttr.addFlashAttribute("updated", "failed");
		}
		return "redirect:/admin/customer/modify";
		
		
		
		
	}
	
	
	
	@ResponseBody
	@PostMapping("/customer/getCSInfo")
	public ResponseEntity<CustomerVO> getCSInfo(int cno){
		
		CustomerVO vo = service.select_by_cno(cno);
		
		if(vo == null) {
			return new ResponseEntity<CustomerVO>(vo, HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<CustomerVO>(vo,HttpStatus.OK);
		
	}
	
	@GetMapping("/customer/delete")
	public void delete_customer_get() {
		log.info("del_customer 요청");
	}
	
	@PostMapping("/customer/delete")
	public String delete_customer_post(CustomerVO vo, RedirectAttributes rttr) {
		log.info("삭제 요청");
		
		if(service.delete_customer(vo)) {
			rttr.addFlashAttribute("deleted", "success");
			rttr.addFlashAttribute("name", vo.getName());
			return "redirect:/admin/customer/delete";
		}
		rttr.addFlashAttribute("deleted", "failed");
		return "redirect:/admin/customer/delete";
		
	}
	
	
	
	
	
	
	//notice @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	@GetMapping("/notice")
	public String admin_show_main_page(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("notice 요청 -"+cri);
		model.addAttribute("list", service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, service.totalRows(cri)));
		
		return "/admin/notice";
	}
	
	@GetMapping("/notice/register")
	public String notice_register_get() {
		log.info("게시글 등록 페이지 요청");
		
		
		return "/admin/notice/register";
	}
	
	@PostMapping("/notice/register")
	public String notice_register(Admin_noticeVO vo, HttpServletRequest req) {
		log.info("register_post"+vo);
		log.info("게시글 등록. 아이디 : "+req.getRemoteUser());
		vo.setId(req.getRemoteUser());
		vo.setWriter(service.selectOne(req.getRemoteUser()).getName());
		if(service.notice_insert(vo)) {
			return "redirect:/admin/notice";
		}
		
		return "/admin/notice/register";
		
	}
	
	@GetMapping("/notice/read")
	public String notice_read() {
		log.info("read 요청");
		
		return "/admin/notice/read";
	}
	
	@GetMapping("/notice/read/{bno}")
	public String notice_view(@PathVariable("bno") int admin_bno,@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("read 요청"+admin_bno);
		try {
			model.addAttribute("vo", service.notice_getRow(admin_bno));
		}catch (Exception e) {
			return "redirect:/admin/notice";
		}
		
		
		return "/admin/notice/read";
	}
	
	@PostMapping("/notice/delete")
	public String notice_delete(@RequestParam("bno") int admin_bno,@ModelAttribute("cri") Criteria cri,  Model model) {
		log.info("삭제 요청");
		// 권한확인
		
		
		//삭제
		
		if(service.notice_delete(admin_bno)) {
			return "redirect:/admin/notice";
			
		}
		
		
		return "/notice/read/"+admin_bno;
	}
	
	@GetMapping("/notice/modify")
	public String notice_modify(@RequestParam("bno") int admin_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("modify_get 요청");
		
		model.addAttribute("vo", service.notice_getRow(admin_bno));
		
		
		return "/admin/notice/modify";
	}
	
	@PostMapping("/notice/modify")
	public String notice_update(Admin_noticeVO vo,@ModelAttribute("cri") Criteria cri, Model model, RedirectAttributes rttr) {
		log.info("modify_post 요청"+vo);
		
		if(service.notice_update(vo)) {
			rttr.addFlashAttribute("cri", cri);
			return "redirect:/admin/notice";
		}else {
			model.addAttribute("vo", vo);
			return "/admin/notice/modify";			
		}
	}
	
	
	
	
	
	
	
	
	//card
	@GetMapping("/card/register")
	public void register_card_get(Model model) {
		
		log.info("register_card_get 요청");
	}
	@PostMapping("/card/register")
	public String register_card(CardVO vo, RedirectAttributes rttr) {
		log.info("카드 등록 요청"+vo);
		String sec = "";
		sec += (int)(Math.random()*10);
		sec += (int)(Math.random()*10);
		sec += (int)(Math.random()*10);
		vo.setSecurity_key(sec);
		if(!vali.check_card_register(vo)) {
			rttr.addFlashAttribute("registered", "false");
			return "redirect:/admin/card/register";
		}
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		log.info("카드 등록 요청2");
		if(service.register_card(vo)) {
			rttr.addFlashAttribute("registered", "true");
			rttr.addFlashAttribute("ano", vo.getAno());
			rttr.addFlashAttribute("card_no", vo.getCard_no());
		}else {
			rttr.addFlashAttribute("registered", "false");
		}
			 
		
		
		
		return "redirect:/admin/card/register";
	}
	
	@ResponseBody
	@PostMapping("/card/get_card_product")
	public ResponseEntity<List<Card_productVO>> get_card_product(){
		log.info("get_card_product 요청");
		List<Card_productVO> list = service.get_card_product();
		log.info(""+list);
		if(list.size()==0) {
			return new ResponseEntity<List<Card_productVO>>(list, HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<List<Card_productVO>>(list, HttpStatus.OK);
		
	}
	@ResponseBody
	@PostMapping("/card/call_card_no")
	public ResponseEntity<String> call_card_no(int product){
		String card_no = "";
		while(true) {
			card_no = product + "";
			for(int i = 0; i < 13; i++) 
				card_no += (int)(Math.random()*10);
			if(service.check_card_no(card_no)==0)
				break;
		}
		return new ResponseEntity<String>(card_no, HttpStatus.OK);
	}
	@ResponseBody
	@PostMapping("card/get_cardList")
	public ResponseEntity<List<CardVO>> get_cardList(String ano){
		
		List<CardVO> list = service.get_cardList_by_ano(ano);
		
		return new ResponseEntity<List<CardVO>>(list, HttpStatus.OK);
		
	}
	@GetMapping("/card/modify")
	public void card_modify_get(Model model) {
		log.info("card modify get 요청");
		model.addAttribute("condition", service.get_condition());
		
	}
	@ResponseBody
	@PostMapping("/card/get_cardInfo")
	public ResponseEntity<CardVO> get_cardInfo(String card_no){
		
		CardVO vo = service.get_cardInfo(card_no);
		
		if(vo==null) {
			return new ResponseEntity<CardVO>(vo, HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<CardVO>(vo, HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/card/update_password")
	public ResponseEntity<String> update_card_password(CardVO vo){
		log.info("card update password 요청"+vo);
		if(vali.check(SBValidator.REG_CARD_PWD, vo.getPassword())) {
			if(vo.getPassword().equals(vo.getConfirm_password())) {
				vo.setPassword(passwordEncoder.encode(vo.getPassword()));
				if(service.update_card_password(vo)) {
					return new ResponseEntity<String>("success", HttpStatus.OK);
				}
			}
		}
		
		return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		
	}
	
	@PostMapping("/card/modify")
	public String update_cardInfo(CardVO vo, RedirectAttributes rttr) {
		log.info("update cardInfo 요청");
		
		if(service.update_cardInfo(vo)) {
			rttr.addFlashAttribute("updated", "true");
			rttr.addFlashAttribute("card_no", vo.getCard_no());
		}else {
			rttr.addFlashAttribute("updated", "false");
		}
		return "redirect:/admin/card/modify";
		
	}
	
	
	
	
}

