package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.domain.PageVO;
import com.spring.domain.ProductVO;
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
	
	
	
	//admin -------------------------------
	
	
	
	
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
	
	
	
	@GetMapping("/header")
	public void header() {
		log.info("header 요청");
	}
	
	
	
	
	
	
	// account
	
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
	public String create_account_post(DepositVO vo,@RequestParam("confirm_password") String confirm_password, RedirectAttributes rttr) {
		
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
		if(!vali.check_account_register(vo)) {
			rttr.addFlashAttribute("created", "false");
			return "redirect:/admin/account/create";
		}
			
		
		log.info("create_account_post 요청 "+vo);
		
		CustomerVO cs_vo = service.select_by_cno(vo.getCno());
		log.info("select by cno : "+cs_vo);
		
		
		
		
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
		
		
		
		if(service.update_password(vo)) {
			log.info("update password success "+vo);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		
		log.info("update password failed"+vo);
		return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
	}
	
	
	
	// customer @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	
	
	@PostMapping("/customer/register")
	public String register_customer_post(CustomerVO vo, RedirectAttributes rttr) {
		log.info("register_customer_post vo : "+vo);
		boolean result = false;
		if(vali.check_customer(vo)) {
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
	public String notice_register(Admin_noticeVO vo) {
		log.info("register_post"+vo);
		
		vo.setAdmin_no("21");
		vo.setWriter("dh");
		vo.setAuth("1");
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
	
	
}

