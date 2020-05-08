package com.spring.controller;

import java.io.File;


import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Acc_info;
import com.spring.domain.AdminVO;
import com.spring.domain.Admin_groupVO;
import com.spring.domain.Admin_logVO;
import com.spring.domain.Admin_noticeVO;

import com.spring.domain.AttachFileDTO;
import com.spring.domain.CardVO;
import com.spring.domain.Card_productVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.Customer_noticeVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historyVO;
import com.spring.domain.InquiryVO;
import com.spring.domain.Inquiry_replyVO;
import com.spring.domain.PageVO;
import com.spring.domain.ProductVO;
import com.spring.domain.Profile_imageVO;
import com.spring.service.AdminService;
import com.spring.service.CustomerNoticeService;
import com.spring.service.InquiryService;
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
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private CustomerNoticeService cn_service;
	
	@Autowired
	private InquiryService inquiry_service;
	
	//프로필 이미지 이미지타입 확인
	private boolean checkImageMimeType(InputStream file) {
		Tika tika = new Tika(); 
		String mimeType=""; 
		try { 
			mimeType = tika.detect(file); 
		} catch (IOException e) {
			e.printStackTrace(); 
		}
		log.info("mimetype : "+mimeType);
		if (mimeType.startsWith("image")) {
			return true; 
		} else {
			return false; 
		}
	}
	
	//프로필 이미지 저장
	@ResponseBody
	@PostMapping("/save_profile_image")
	public ResponseEntity<String> admin_saveImage(MultipartFile[] uploadFile_header, HttpServletRequest req){
		logging(req);
		try {
			log.info("length : "+uploadFile_header.length);
			log.info("tostring : "+uploadFile_header.toString());
			if(!checkImageMimeType(uploadFile_header[0].getInputStream())||uploadFile_header[0].getSize() > 300000) {
				return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			String file_name = uploadFile_header[0].getOriginalFilename(); 
			String type = file_name.substring(file_name.lastIndexOf(".")+1);
			try {
				if(service.saveImage(req.getRemoteUser(), uploadFile_header[0].getBytes(), type)) {
					return new ResponseEntity<String>("success", HttpStatus.OK);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<String>(" ", HttpStatus.OK);
	}
	
	//프로필 이미지 불러오기
	@ResponseBody
	@GetMapping("/get_profile_image")
	public ResponseEntity<byte[]> getByteImage(String id, HttpServletRequest req) {
	   logging(req);
	   log.info("get profile image id : "+id);
	   log.info("get profile image req : "+req.getRemoteUser());
	   if(id==null) {
		   id = req.getRemoteUser();
	   }
	   Profile_imageVO vo = service.get_profile_image(id);
       byte[] imageContent = vo.getProfile_image();
       String profile_image_type = vo.getProfile_image_type(); 
       final HttpHeaders headers = new HttpHeaders();
       
       if(profile_image_type.equalsIgnoreCase("jpg") || profile_image_type.equalsIgnoreCase("jpeg")) {
    	   headers.setContentType(MediaType.IMAGE_JPEG);
       }else if(profile_image_type.equalsIgnoreCase("gif")) {
    	   headers.setContentType(MediaType.IMAGE_GIF);
       }else{
    	   headers.setContentType(MediaType.IMAGE_PNG);
       }
       return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}

	//관리자_ 고객 공지 페이지
	@GetMapping("/customer_notice")
	public String admin_show_customer_notice(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
		logging(req);
		//log.info("notice 요청 -");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		log.info("cri : @@"+cri);
		return "/admin/customer_notice";
	}
	
	//문의 리스트
	@GetMapping("/inquiry")
	public String admin_inquiry_get(String search,Model model, HttpServletRequest req) {
		logging(req);
		if(search==null) {
			model.addAttribute("list", inquiry_service.getList());
		}else {
			model.addAttribute("list", inquiry_service.getList_by_answer(req.getRemoteUser()));
		}
		return "/admin/inquiry";
	}
	
	//문의 담당자인지 확인
	@ResponseBody
	@PostMapping("/check_inquiry")
	public ResponseEntity<String> inquiry_check(String inquiry_no, HttpServletRequest req){
		logging(req);		
		return new ResponseEntity<String>(req.getRemoteUser().equals(inquiry_service.getRow(inquiry_no).getAnswer_id()+"")+"", HttpStatus.OK);
	}
	
	//문의 담당자 등록
	@ResponseBody
	@PostMapping(value="/charge_inquiry", produces = "application/text; charset=utf8")
	public ResponseEntity<String> charge_inquiry(String inquiry_no, HttpServletRequest req){
		logging(req);
		if(inquiry_service.getRow(inquiry_no).getAnswer_id()==null) {
			AdminVO admin = service.selectOne(req.getRemoteUser());
			InquiryVO vo = new InquiryVO();
			vo.setInquiry_no(inquiry_no);
			vo.setAnswer_id(admin.getId());
			vo.setAnswer_branch(admin.getBranch());
			vo.setAnswer_rank(admin.getRank());
			vo.setAnswer_name(admin.getName());
			if(inquiry_service.charge_inquiry(vo)) {
				log.info("name : "+vo.getAnswer_name());
				return new ResponseEntity<String>(vo.getAnswer_name(), HttpStatus.OK);
			}
		}
		return new ResponseEntity<String>("gg", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//문의답변 보기
	@GetMapping("/inquiry/{inquiry_no}")
	public String inquiry_view(@PathVariable("inquiry_no") String inquiry_no, Model model, HttpServletRequest req) {
		logging(req);
		try {
			Integer.parseInt(inquiry_no);
		}catch(Exception e){
			return "redirect:/admin/inquiry";
		}
		
		
		if(!req.getRemoteUser().equals(inquiry_service.getRow(inquiry_no).getAnswer_id()+"")) {
			return "redirect:/admin/inquiry";
		}
		//log.info("read 요청"+admin_bno);
		try {
			model.addAttribute("vo", inquiry_service.getRow(inquiry_no));
		}catch (Exception e) {
			return "redirect:/admin/inquiry";
		}
		return "/admin/inquiry/read";
	}
	
	//문의 답변 불러오기
	@ResponseBody
	@PostMapping("/inquiry_get_reply")
	public ResponseEntity<List<Inquiry_replyVO>> get_inquiry_reply(String inquiry_no, HttpServletRequest req){
		logging(req);
		List<Inquiry_replyVO> list  = inquiry_service.get_replyList(inquiry_no);
		return new ResponseEntity<List<Inquiry_replyVO>>(list, HttpStatus.OK);
	}
	
	//문의 답변 등록
	@ResponseBody
	@PostMapping("/inquiry_register_reply")
	public ResponseEntity<String> insert_inquiry_reply(Inquiry_replyVO vo, HttpServletRequest req){
		logging(req);
		AdminVO admin = service.selectOne(req.getRemoteUser());
		vo.setAnswer_id(admin.getId());
		vo.setAnswer_branch(admin.getBranch());
		vo.setAnswer_rank(admin.getRank());
		vo.setAnswer_name(admin.getName());
		if(inquiry_service.insert_reply(vo)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 자바스크립트 비활성화일 경우
	@GetMapping("/noscript")
	public String noscript() {
		return "/errorpage/noscript";
	}
	
	//로깅, 로그 남기기
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
		return service.insertLog(vo);
	}
	
	//admin -------------------------------
	
	
	
	
	//그룹 권한 불러오기(로그인한 관리자)
	@ResponseBody
	@PostMapping("/get_groupId")
	public ResponseEntity<String> get_groupId(HttpServletRequest req){
		logging(req);
		return new ResponseEntity<String>(service.get_groupID(req.getRemoteUser())+"", HttpStatus.OK);
	}
	
	//그룹 권한 불러오기(아이디로)
	@ResponseBody
	@PostMapping("/get_groupId_by_id")
	public ResponseEntity<String> get_groupId_by_id(String id, HttpServletRequest req){
		logging(req);
		return new ResponseEntity<String>(service.get_groupID(id)+"", HttpStatus.OK);
	}
	
	//관리자 검색
	@ResponseBody
	@PostMapping("/searchAD")
	public ResponseEntity<List<AdminVO>> get_admins(AdminVO vo, HttpServletRequest req){
		logging(req);
		//log.info("searchAD 요청");
		if(vo.getBranch()==null) {
			vo.setBranch("");
		}
		if(vo.getName()==null) {
			vo.setName("");
		}
		if(vo.getId()==null) {
			vo.setId("");
		}
		vo.setAuth_level(service.get_groupID(req.getRemoteUser()));
		List<AdminVO> list = service.get_admins(vo);
		if(list.size()==0) {
			return new ResponseEntity<List<AdminVO>>(list, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<List<AdminVO>>(list, HttpStatus.OK);
	}
	
	//관리자 로그인 페이지
	@GetMapping("/login")
	public String admin_login(HttpServletRequest req) {
		logging(req);
		//log.info("admin_login 페이지 요청");
		return "/admin/login";
	}
	
	//관리자 상세 정보 요청
	@ResponseBody
	@PostMapping("/getAdminInfo")
	public ResponseEntity<AdminVO> get_adminInfo(String id, HttpServletRequest req){
		logging(req);
		AdminVO vo = service.get_adminInfo(id);
		vo.setPassword("");
		//log.info("return vo : ");
		return new ResponseEntity<AdminVO>(vo, HttpStatus.OK);
	}
	
	//관리자 기본 정보
	@ResponseBody
	@PostMapping("/get_adminInfo")
	public ResponseEntity<AdminVO> get_adminInfo(HttpServletRequest req){
		//logging(req);
		AdminVO vo = service.selectOne(req.getRemoteUser());
		vo.setPassword("");
		vo.setMobile("");
		//log.info("return vo : "+vo);
		return new ResponseEntity<AdminVO>(vo, HttpStatus.OK);
	}
	//*** 테스트용
	@GetMapping("/header")
	public void header(HttpServletRequest req) {
		logging(req);
		//log.info("header 요청");
	}
	
	//관리자 관리 페이지
	@GetMapping("/manage")
	public void admin_manage(HttpServletRequest req, Model model) {
		logging(req);
		//log.info("admin manage 요청");
		List<Admin_groupVO> list = service.get_groupList(req.getRemoteUser());
		model.addAttribute("groups", list);
	}
	
	//관리자 비밀번호 수정
	@PostMapping("/admin_update_password")
	@ResponseBody
	public ResponseEntity<String> admin_update_password(AdminVO vo, HttpServletRequest req){
		logging(req);
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
	
	//관리자 신규 등록
	@PostMapping("/registerAdmin")
	public String insert_admin(AdminVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
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
	
	//관리자 정보 수정
	@PostMapping("/updateAdmin")
	public String update_admin(AdminVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		if(vo.getId()!=null && vo.getBranch()!=null && vo.getRank()!= null && vo.getMobile()!=null && !vo.getGroup_id().equals("-1") && vo.getName()!=null && vo.getEnabled()!=-1) {
			if(service.update_admin(vo)) {
				rttr.addFlashAttribute("updated", "true");
				rttr.addFlashAttribute("name", vo.getName());
				return "redirect:/admin/manage";
			}
		}
		rttr.addFlashAttribute("updated", "false");
		return "redirect:/admin/manage";
	}
	
	//관리자 아이디 중복 확인
	@ResponseBody
	@PostMapping("/check_adminId")
	public ResponseEntity<String> check_adminId(String id, HttpServletRequest req){
		logging(req);
		if(id!=null) {
			if(!id.equals("")) {
				if(!service.check_adminId(id)) {
					return new ResponseEntity<String>("OK", HttpStatus.OK);
				}				
			}
		}
		return new ResponseEntity<String>("NO", HttpStatus.BAD_REQUEST);
	}
	
	// account
	
	//계좌 내역 페이지
	@GetMapping("/account/history")
	public void account_history_get(HttpServletRequest req) {
		logging(req);
		//log.info("account history 요청");
	}
	
	//계좌 내역 정보
	@ResponseBody
	@PostMapping("/account/get_history")
	public ResponseEntity<List<Deposit_historyVO>> get_history(String ano, String start_date, String end_date, HttpServletRequest req){
		logging(req);
		//log.info("get_history 요청 ano : "+ano);
		//log.info("get_history 요청 sDates : "+start_date);
		//log.info("get_history 요청 eDates : "+end_date);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
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
		list = service.get_history(ano, start, end2);
		//log.info("history : "+list);
		return new ResponseEntity<List<Deposit_historyVO>>(list, HttpStatus.OK);
	}
	
	// 계좌 중복 체크?
	@ResponseBody
	@PostMapping("/account/check_ano")
	public ResponseEntity<DepositVO> check_ano(String ano, HttpServletRequest req){
		logging(req);
		DepositVO vo = service.check_ano( ano);
		//log.info("check_ano vo : "+vo);
		if(vo != null) {
			return new ResponseEntity<DepositVO>(vo, HttpStatus.OK);
		}else {
			return new ResponseEntity<DepositVO>(vo, HttpStatus.BAD_REQUEST);
		}
	}
	
	//계좌 입금
	@PostMapping("/account/deposit")
	public String deposit(Deposit_historyVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
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
	
	//계좌 출금
	@PostMapping("/account/withdraw")
	public String withdraw(Deposit_historyVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		vo.setName(service.selectOne(req.getRemoteUser()).getBranch()+" 출금");
		vo.setFrom_ano("");
		if(service.withdraw(vo)) {
			rttr.addFlashAttribute("success", "true");
			rttr.addFlashAttribute("ano", vo.getAno());
			rttr.addFlashAttribute("amount", vo.getAmount());
			//log.info("출금 성공");
		}else {
			rttr.addFlashAttribute("success", "false");
			//log.info("출금 실패");
		}
		return "redirect:/admin/account/withdraw";
	}
	
	//계좌 입금 페이지
	@GetMapping("/account/deposit")
	public void deposit_get(HttpServletRequest req) {
		logging(req);
		//log.info("deposit get 요청");
	}
	//계좌 출금 페이지
	@GetMapping("/account/withdraw")
	public void withdraw_get(HttpServletRequest req) {
		logging(req);
		//log.info("withdraw get 요청");
	}
	
	//계좌 삭제 페이지
	@GetMapping("/account/delete")
	public String delete_account(HttpServletRequest req) {
		logging(req);
		//log.info("delete_account_get 요청");
		return "/admin/account/delete";
	}
	//계좌 삭제
	@PostMapping("/account/delete")
	public String delete_account_post(DepositVO vo, @RequestParam("confirm_password") String confirm_password, RedirectAttributes rttr, HttpServletRequest req) {
		//log.info("계좌 삭제 요청"+confirm_password+vo);
		logging(req);
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
	
	//계좌 수정 페이지
	@GetMapping("/account/modify")
	public String modify_account(HttpServletRequest req) {
		logging(req);
		//log.info("modifyaccount 요청");
		return "/admin/account/modify";
	}
	//계좌 정보 수정
	@PostMapping("/account/modify")
	public String update_account(DepositVO vo, RedirectAttributes attr, Model model, HttpServletRequest req) {
		logging(req);
		//log.info("update_account 요청");
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
	
	//계좌 신규 개설
	@PostMapping("/account/create")
	public String create_account_post(DepositVO vo,@RequestParam("confirm_password") String confirm_password, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
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
		//log.info("create_account_post 요청 "+vo);
		CustomerVO cs_vo = service.select_by_cno(vo.getCno());
		//log.info("select by cno : "+cs_vo);
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		if(service.create_deposit(vo)) {
			rttr.addFlashAttribute("created", "true");
			rttr.addFlashAttribute("name", cs_vo.getName());
		}else {
			rttr.addFlashAttribute("created", "false");
		}
		return "redirect:/admin/account/create";
	}
	
	//계좌 개설 페이지
	@GetMapping("/account/create")
	public String create_account_get(HttpServletRequest req) {
		logging(req);
		//log.info("create_account_get 요청");
		return "/admin/account/create";
	}
	
	//계좌 상품 불러오기
	@ResponseBody
	@PostMapping("/account/getProduct")
	public ResponseEntity<List<ProductVO>> getProduct(int type, HttpServletRequest req){
		logging(req);
		List<ProductVO> list = service.acc_getProduct(type);
		if(list.isEmpty()) {
			return new ResponseEntity<List<ProductVO>>(list, HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<List<ProductVO>>(list, HttpStatus.OK);
	}
	
	//계좌 정보 불러오기
	@ResponseBody
	@PostMapping("/account/getAccInfo")
	public ResponseEntity<List<Acc_info>> get_accinfo(int cno, HttpServletRequest req){
		logging(req);
		List<Acc_info> list = service.select_acc_info(cno);
		if(list.isEmpty()) {
			return new ResponseEntity<List<Acc_info>>(list, HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<List<Acc_info>>(list, HttpStatus.OK);
	}
	
	//새로운 계좌번호 요청
	@PostMapping("/account/call_ano")
	@ResponseBody
	public ResponseEntity<String> create_ano(int product, int cno, HttpServletRequest req) {
		logging(req);
		//log.info("call_ano 요청");
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
	
	//계좌 정보 불러오기
	@ResponseBody
	@PostMapping("/account/get_depositInfo")
	public ResponseEntity<DepositVO> get_depositInfo(String ano, HttpServletRequest req){
		logging(req);
		DepositVO vo = service.get_deposit(ano);
		return new ResponseEntity<DepositVO>(vo, vo==null?HttpStatus.BAD_REQUEST:HttpStatus.OK);
		
	}
	
	//계좌 비밀번호 변경
	@ResponseBody
	@PostMapping("/account/update_password")
	public ResponseEntity<String> update_deposit_password(DepositVO vo, @RequestParam("confirm_password") String confirm_password, HttpServletRequest req){
		logging(req);
		//log.info("비밀번호 변경 요청con:"+confirm_password+vo);
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
			//log.info("update password success "+vo);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		//log.info("update password failed"+vo);
		return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
	}
	
	//계좌 비밀번호 확인
	@ResponseBody
	@PostMapping("/account/check_password")
	public ResponseEntity<String> check_account_password(DepositVO vo, @RequestParam("confirm_password") String confirm_password, HttpServletRequest req){
		logging(req);
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
	
	//고객 등록
	@PostMapping("/customer/register")
	public String register_customer_post(CustomerVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		log.info("register_customer_post vo : "+vo);
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
		}
		return "redirect:/admin/customer/register";
	}
	
	//고객 등록 페이지
	@GetMapping("/customer/register")
	public void register_customer_get(HttpServletRequest req) {
		logging(req);
		//log.info("register_customer_get 요청");
	}
	
	//고객 아이디 중복 확인
	@ResponseBody
	@PostMapping("/customer/checkId")
	public String checkId(String id, HttpServletRequest req) {
		logging(req);
		if(service.checkId(id)) {
			//log.info("id 중복");
			return "false";
		}else {
			//log.info("id 가능");
			return "true";
		}
	}
	
	//고객 검색
	@PostMapping("/customer/search")
	@ResponseBody
	public ResponseEntity<List<CustomerVO>> search(String name, String birth, String mobile, HttpServletRequest req) {
		logging(req);
		//log.info("search"+name+birth+mobile);
		List<CustomerVO> list = service.search_customer(name, birth, mobile);
		if(list.isEmpty()) {
			return new ResponseEntity<List<CustomerVO>>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<List<CustomerVO>>(list, HttpStatus.OK);
	}
	
	//고객 정보 수정 페이지
	@GetMapping("/customer/modify")
	public String modify_customer(HttpServletRequest req) {
		logging(req);
		//log.info("modify_customer_get 요청");
		return "/admin/customer/modify";
	}
	
	//고객 정보 수정
	@PostMapping("/customer/modify")
	public String update_customer(CustomerVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		//log.info("update_customer_post vo : "+vo);
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
		return "redirect:/admin/customer/modify";
	}
	
	//고객 정보 불러오기
	@ResponseBody
	@PostMapping("/customer/getCSInfo")
	public ResponseEntity<CustomerVO> getCSInfo(int cno, HttpServletRequest req){
		logging(req);
		CustomerVO vo = service.select_by_cno(cno);
		if(vo == null) {
			return new ResponseEntity<CustomerVO>(vo, HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<CustomerVO>(vo,HttpStatus.OK);
	}
	
	//고객 삭제 페이지
	@GetMapping("/customer/delete")
	public void delete_customer_get(HttpServletRequest req) {
		logging(req);
		//log.info("del_customer 요청");
	}
	
	//고객 삭제
	@PostMapping("/customer/delete")
	public String delete_customer_post(CustomerVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		//log.info("삭제 요청");
		if(service.delete_customer(vo)) {
			rttr.addFlashAttribute("deleted", "success");
			rttr.addFlashAttribute("name", vo.getName());
			return "redirect:/admin/customer/delete";
		}
		rttr.addFlashAttribute("deleted", "failed");
		return "redirect:/admin/customer/delete";
	}
	
	//notice @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);		
	}
	
	//첨부파일 다운로드
//	@PostMapping("/notice/downloadFile")
	@GetMapping("/notice/downloadFile")
	@ResponseBody
	public ResponseEntity<Resource> download(AttachFileDTO dto, @RequestHeader("user-Agent") String userAgent, HttpServletRequest req){
		logging(req);
		//log.info("파일 다운로드"+dto);
		//log.info("파일 user : "+req.getRemoteUser());
		if(service.selectOne(req.getRemoteUser())==null){
			return new ResponseEntity<Resource>(HttpStatus.BAD_REQUEST);
		}
		AttachFileDTO data = service.get_oneFile(dto);
		if(data==null) {
			return new ResponseEntity<Resource>(HttpStatus.BAD_REQUEST);
		}
		//log.info("data :"+data);
		String fileName = data.getUploadPath()+"\\"+data.getUuid()+"_"+data.getFileName();
		Resource resource = new FileSystemResource("c:\\upload\\"+fileName);
		if(!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		String resourceUidName = resource.getFilename();
		String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		String downloadName = null;
		if(userAgent.contains("Trident") || userAgent.contains("Edge")) {
			try {
				downloadName = URLEncoder.encode(resourceName, "utf-8").replaceAll("\\+", " ");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}else {
			try {
				downloadName = new String(resourceName.getBytes("utf-8"), "ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		headers.add("Content-Disposition", "attachment;filename="+downloadName);
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	//첨부파일 불러오기
	@PostMapping("/notice/get_attachList")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> getAttachList(String admin_bno, HttpServletRequest req){
		logging(req);
		//log.info(admin_bno+" 첨부물 가져오기");
		return new ResponseEntity<List<AttachFileDTO>>(service.getAttachList(admin_bno), HttpStatus.OK);
	}
	
	//첨부파일 업로드
	@PostMapping("/notice/upload")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadPost(MultipartFile[] uploadFile, HttpServletRequest req) {
		logging(req);
		//log.info("upload"+uploadFile);
		String uploadFolder = "c:\\upload";
		String uploadFileName = null;
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		List<AttachFileDTO> attachList = new ArrayList<AttachFileDTO>();
		for(MultipartFile multipartFile : uploadFile) {
			//log.info("upload 요청 "+multipartFile.getOriginalFilename());
			//log.info("upload 파일 크기"+multipartFile.getSize());
			uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			AttachFileDTO attach = new AttachFileDTO();
			attach.setFileName(multipartFile.getOriginalFilename());
			attach.setUploadPath(uploadFolderPath);
			attach.setUuid(uuid.toString());
			Path pathFile = Paths.get(uploadPath.getPath(), uploadFileName);
			try {
				multipartFile.transferTo(pathFile);
				attachList.add(attach);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<List<AttachFileDTO>>(attachList, HttpStatus.OK);
	}
	
	//파일 삭제하기
	@PostMapping("/notice/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type, HttpServletRequest req){
		logging(req);
		//log.info("파일 삭제 : ");
		File file = null;
		try {
			String file_p = "c:\\upload\\"+URLDecoder.decode(fileName, "utf-8");
			file = new File(file_p);
			file.delete();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	//사내 공지 페이지
	@GetMapping("/notice")
	public String admin_show_main_page(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req, HttpSession session) {
		logging(req);
		//log.info("notice 요청 -");
//		if(session.getAttribute("admin_branch")==null) {
//			AdminVO vo = service.selectOne(req.getRemoteUser());	
//			session.setAttribute("admin_branch", vo.getBranch());
//			session.setAttribute("admin_rank", vo.getRank());
//			session.setAttribute("admin_name", vo.getName());
//		}
		model.addAttribute("list", service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, service.totalRows(cri)));
		return "/admin/notice";
	}
	
	//사내 공지 등록 페이지
	@GetMapping("/notice/register")
	public String notice_register_get(HttpServletRequest req) {
		logging(req);
		//log.info("게시글 등록 페이지 요청");
		return "/admin/notice/register";
	}
	
	//사내 공지 등록
	@PostMapping("/notice/register")
	public String notice_register(Admin_noticeVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		logging(req);
		if(vo.getTitle()==null || vo.getTitle().equals("") || vo.getContent()==null || vo.getContent().equals("")) {
			return "/admin/notice/register";
		}
		// 권한이 5아래 일경우 작성못함
		int permit_level = 5;
		if(service.get_groupID(req.getRemoteUser()) < permit_level){
			return "/admin/notice/register";
		}
		//log.info("register_post"+vo);
		//log.info("게시글 등록. 아이디 : "+req.getRemoteUser());
		vo.setId(req.getRemoteUser());
		vo.setWriter(service.selectOne(req.getRemoteUser()).getName());
		if(service.notice_insert(vo)) {
			rttr.addFlashAttribute("registered", "true");
			rttr.addFlashAttribute("admin_bno", vo.getAdmin_bno());
			return "redirect:/admin/notice";
		}
		return "/admin/notice/register";
	}
	
	//사내 공지 게시글 페이지 (빈 페이지)
	@GetMapping("/notice/read")
	public String notice_read(HttpServletRequest req) {
		logging(req);
		//log.info("read 요청");
		return "/admin/notice/read";
	}

	//사내 공지 게시글 페이지
	@GetMapping("/notice/read/{bno}")
	public String notice_view(@PathVariable("bno") int admin_bno,@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
		logging(req);
		
		//log.info("read 요청"+admin_bno);
		try {
			Admin_noticeVO vo = service.notice_getRow(admin_bno);
			AdminVO admin = service.selectOne(req.getRemoteUser());
			vo.setBranch(admin.getBranch());
			vo.setRank(admin.getRank());
			model.addAttribute("vo", vo);
		}catch (Exception e) {
			return "redirect:/admin/notice";
		}
		return "/admin/notice/read";
	}
	
	//사내 공지 삭제
	@PostMapping("/notice/delete")
	public String notice_delete(@RequestParam("bno") int admin_bno, String id,@ModelAttribute("cri") Criteria cri,  Model model, HttpServletRequest req) {
		logging(req);
		//log.info("삭제 요청");
		// 권한확인
		if(service.get_groupID(req.getRemoteUser()) < service.get_groupID((service.notice_getRow(admin_bno).getId()))) {
			return "redirect:/admin/notice/read/"+admin_bno;
		}
		//삭제
		if(service.notice_delete(admin_bno)) {
			return "redirect:/admin/notice";
		}
		return "/admin/notice/read/"+admin_bno;
	}
	
	//사내 공지 수정 페이지
	@GetMapping("/notice/modify")
	public String notice_modify(@RequestParam("bno") int admin_bno, @ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
		logging(req);
		//log.info("modify_get 요청");
		
		if(service.get_groupID(req.getRemoteUser()) < service.get_groupID((service.notice_getRow(admin_bno).getId()))) {
			return "redirect:/admin/notice/read/"+admin_bno;
		}
		
		model.addAttribute("vo", service.notice_getRow(admin_bno));
		return "/admin/notice/modify";
	}
	
	//사내 공지 수정
	@PostMapping("/notice/modify")
	public String notice_update(Admin_noticeVO vo,@ModelAttribute("cri") Criteria cri, Model model, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		//log.info("modify_post 요청"+vo);
		if(service.notice_update(vo)) {
			rttr.addFlashAttribute("cri", cri);
			return "redirect:/admin/notice";
		}else {
			model.addAttribute("vo", vo);
			return "/admin/notice/modify";			
		}
	}
	
	//card
	//카드 등록 페이지
	@GetMapping("/card/register")
	public void register_card_get(Model model, HttpServletRequest req) {
		logging(req);
		//log.info("register_card_get 요청");
	}

	//카드 등록
	@PostMapping("/card/register")
	public String register_card(CardVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		//log.info("카드 등록 요청"+vo);
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
		//log.info("카드 등록 요청2");
		if(service.register_card(vo)) {
			rttr.addFlashAttribute("registered", "true");
			rttr.addFlashAttribute("ano", vo.getAno());
			rttr.addFlashAttribute("card_no", vo.getCard_no());
		}else {
			rttr.addFlashAttribute("registered", "false");
		}
		return "redirect:/admin/card/register";
	}
	
	//카드 상품 불러오기
	@ResponseBody
	@PostMapping("/card/get_card_product")
	public ResponseEntity<List<Card_productVO>> get_card_product(HttpServletRequest req){
		logging(req);
		//log.info("get_card_product 요청");
		List<Card_productVO> list = service.get_card_product();
		//log.info(""+list);
		if(list.size()==0) {
			return new ResponseEntity<List<Card_productVO>>(list, HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<List<Card_productVO>>(list, HttpStatus.OK);
	}
	
	//카드 번호 생성
	@ResponseBody
	@PostMapping("/card/call_card_no")
	public ResponseEntity<String> call_card_no(int product, HttpServletRequest req){
		logging(req);
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
	
	//카드 목록 불러오기 (ano)
	@ResponseBody
	@PostMapping("card/get_cardList")
	public ResponseEntity<List<CardVO>> get_cardList(String ano, HttpServletRequest req){
		logging(req);
		List<CardVO> list = service.get_cardList_by_ano(ano);
		return new ResponseEntity<List<CardVO>>(list, HttpStatus.OK);
	}
	
	//카드 수정 페이지
	@GetMapping("/card/modify")
	public void card_modify_get(Model model, HttpServletRequest req) {
		logging(req);
		//log.info("card modify get 요청");
		model.addAttribute("condition", service.get_condition());
	}
	
	//카드 정보 불러오기
	@ResponseBody
	@PostMapping("/card/get_cardInfo")
	public ResponseEntity<CardVO> get_cardInfo(String card_no, HttpServletRequest req){
		logging(req);
		CardVO vo = service.get_cardInfo(card_no);
		if(vo==null) {
			return new ResponseEntity<CardVO>(vo, HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<CardVO>(vo, HttpStatus.OK);
	}
	
	//카드 비밀번호 변경
	@ResponseBody
	@PostMapping("/card/update_password")
	public ResponseEntity<String> update_card_password(CardVO vo, HttpServletRequest req){
		logging(req);
		//log.info("card update password 요청"+vo);
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
	
	//카드 정보 수정
	@PostMapping("/card/modify")
	public String update_cardInfo(CardVO vo, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		//log.info("update cardInfo 요청");
		if(service.update_cardInfo(vo)) {
			rttr.addFlashAttribute("updated", "true");
			rttr.addFlashAttribute("card_no", vo.getCard_no());
		}else {
			rttr.addFlashAttribute("updated", "false");
		}
		return "redirect:/admin/card/modify";
	}
	
	// 팝업
	//고객 검색 팝업
	@GetMapping("/popup/searchCS")
	public String searchCS(HttpServletRequest req) {
		logging(req);
		//log.info("searchCS 요청");
		return "/admin/popup/search_customer_popup";
	}
	
	//주소 검색 팝업
	@GetMapping("/popup/jusopopup")
	public String juso_popup(HttpServletRequest req) {
		logging(req);
		//log.info("jusopopup 요청");
		return "/admin/popup/jusopopup";
	}
	@PostMapping("/popup/jusopopup")
	public String juso_popup_post(HttpServletRequest req) {
		logging(req);
		//log.info("jusopopup_post 요청");
		return "/admin/popup/jusopopup";
	}
	
	//비밀번호 입력 팝업
	@GetMapping("/popup/passpopup")
	public String passpopup(Model model, HttpServletRequest req) {
		logging(req);
		//log.info("passpopup 요청");
		model.addAttribute("wInput", "password");
		return "/admin/popup/passpopup";
	}
	
	//비밀번호 확인 입력 팝업
	@GetMapping("/popup/passpopup_c")
	public String passpopup_c(Model model, HttpServletRequest req) {
		logging(req);
		//log.info("passpopup_c 요청");
		model.addAttribute("wInput", "confirm_password");
		return "/admin/popup/passpopup";
	}
	
	//관리자 검색 팝업
	@GetMapping("/popup/searchAD")
	public String popup_searchAD(HttpServletRequest req) {
		logging(req);
		//log.info("popup searchAD 요청");
		return "/admin/popup/search_admin_popup";
	}
	
	// customer_notice
	
	//첨부파일 다운로드
	@GetMapping("/customer_notice/downloadFile")
	@ResponseBody
	public ResponseEntity<Resource> customer_download(AttachFileDTO dto, @RequestHeader("user-Agent") String userAgent, HttpServletRequest req){
		logging(req);
		//log.info("파일 다운로드"+dto);
		//log.info("파일 user : "+req.getRemoteUser());
		if(service.selectOne(req.getRemoteUser())==null){
			return new ResponseEntity<Resource>(HttpStatus.BAD_REQUEST);
		}
		AttachFileDTO data = cn_service.get_oneFile(dto);
		if(data==null) {
			return new ResponseEntity<Resource>(HttpStatus.BAD_REQUEST);
		}
		//log.info("data :"+data);
		String fileName = data.getUploadPath()+"\\"+data.getUuid()+"_"+data.getFileName();
		Resource resource = new FileSystemResource("c:\\upload_customer\\"+fileName);
		if(!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		String resourceUidName = resource.getFilename();
		String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		String downloadName = null;
		if(userAgent.contains("Trident") || userAgent.contains("Edge")) {
			try {
				downloadName = URLEncoder.encode(resourceName, "utf-8").replaceAll("\\+", " ");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}else {
			try {
				downloadName = new String(resourceName.getBytes("utf-8"), "ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		headers.add("Content-Disposition", "attachment;filename="+downloadName);
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	//첨부파일 불러오기
	@PostMapping("/customer_notice/get_attachList")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> customer_getAttachList(String notice_bno, HttpServletRequest req){
		logging(req);
		//log.info(admin_bno+" 첨부물 가져오기");
		return new ResponseEntity<List<AttachFileDTO>>(cn_service.getAttachList(notice_bno), HttpStatus.OK);
	}
	
	//첨부파일 업로드
	@PostMapping("/customer_notice/upload")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> customer_uploadPost(MultipartFile[] uploadFile, HttpServletRequest req) {
		logging(req);
		String uploadFolder = "c:\\upload_customer";
		String uploadFileName = null;
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		List<AttachFileDTO> attachList = new ArrayList<AttachFileDTO>();
		for(MultipartFile multipartFile : uploadFile) {
			//log.info("upload 요청 "+multipartFile.getOriginalFilename());
			//log.info("upload 파일 크기"+multipartFile.getSize());
			uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			AttachFileDTO attach = new AttachFileDTO();
			attach.setFileName(multipartFile.getOriginalFilename());
			attach.setUploadPath(uploadFolderPath);
			attach.setUuid(uuid.toString());
			Path pathFile = Paths.get(uploadPath.getPath(), uploadFileName);
			try {
				multipartFile.transferTo(pathFile);
				attachList.add(attach);
			} catch (IllegalStateException e) {
	
				e.printStackTrace();
			} catch (IOException e) {
	
				e.printStackTrace();
			}
		}
		return new ResponseEntity<List<AttachFileDTO>>(attachList, HttpStatus.OK);
	}
	
	//파일 삭제하기
	@PostMapping("/customer_notice/deleteFile")
	@ResponseBody
	public ResponseEntity<String> customer_deleteFile(String fileName, String type, HttpServletRequest req){
		logging(req);
		//log.info("파일 삭제 : ");
		File file = null;
		try {
			String file_p = "c:\\upload_customer\\"+URLDecoder.decode(fileName, "utf-8");
			file = new File(file_p);
			file.delete();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	//고객 공지 등록 페이지
	@GetMapping("/customer_notice/register")
	public String customer_notice_register_get(HttpServletRequest req) {
		logging(req);
		//log.info("게시글 등록 페이지 요청");
		return "/admin/customer_notice/register";
	}
	
	//고객 공지 등록
	@PostMapping("/customer_notice/register")
	public String notice_register(Customer_noticeVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		logging(req);
		if(vo.getTitle()==null || vo.getTitle().equals("") || vo.getContent()==null || vo.getContent().equals("")) {
			return "/admin/customer_notice/register";
		}
		// 권한이 5아래 일경우 작성못함
		int permit_level = 5;
		if(service.get_groupID(req.getRemoteUser()) < permit_level){
			return "/admin/customer_notice/register";
		}
		//log.info("register_post"+vo);
		//log.info("게시글 등록. 아이디 : "+req.getRemoteUser());
		vo.setId(req.getRemoteUser());
		vo.setWriter(service.selectOne(req.getRemoteUser()).getName());
		if(cn_service.notice_insert(vo)) {
			rttr.addFlashAttribute("registered", "true");
			rttr.addFlashAttribute("notice_bno", vo.getNotice_bno());
			return "redirect:/admin/customer_notice";
		}
		return "/admin/customer_notice/register";
	}
	
	//고객 공지 게시글 페이지 (빈 페이지)
	@GetMapping("/customer_notice/read")
	public String customer_notice_read(HttpServletRequest req) {
		logging(req);
		//log.info("read 요청");
		return "/admin/customer_notice/read";
	}
	
	//고객 공지 게시글 페이지
	@GetMapping("/customer_notice/read/{bno}")
	public String customer_notice_view(@PathVariable("bno") int notice_bno,@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
		logging(req);
		//log.info("read 요청"+admin_bno);
		try {
			model.addAttribute("vo", cn_service.notice_getRow(notice_bno));
			
		}catch (Exception e) {
			return "redirect:/admin/customer_notice";
		}
		return "/admin/customer_notice/read";
	}
	
	//고객 공지 삭제
	@PostMapping("/customer_notice/delete")
	public String customer_notice_delete(@RequestParam("bno") int notice_bno, String id,@ModelAttribute("cri") Criteria cri,  Model model, HttpServletRequest req) {
		logging(req);
		//log.info("삭제 요청");
		// 권한확인
		if(service.get_groupID(req.getRemoteUser())< service.get_groupID(id)) {
			return "/customer_notice/read/"+notice_bno;
		}
		//삭제
		if(cn_service.notice_delete(notice_bno)) {
			return "redirect:/admin/customer_notice";
		}
		return "/customer_notice/read/"+notice_bno;
	}
	
	//고객 공지 수정 페이지
	@GetMapping("/customer_notice/modify")
	public String customer_notice_modify(@RequestParam("bno") int notice_bno, @ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
		logging(req);
		//log.info("modify_get 요청");
		if(service.get_groupID(req.getRemoteUser()) < service.get_groupID((cn_service.notice_getRow(notice_bno).getId()))) {
			return "redirect:/admin/customer_notice";
		}
		model.addAttribute("vo", cn_service.notice_getRow(notice_bno));
		return "/admin/customer_notice/modify";
	}
	
	//고객 공지 수정
	@PostMapping("/customer_notice/modify")
	public String notice_update(Customer_noticeVO vo,@ModelAttribute("cri") Criteria cri, Model model, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		if(service.get_groupID(req.getRemoteUser()) < service.get_groupID((cn_service.notice_getRow(Integer.parseInt(vo.getNotice_bno())).getId()))) {
			return "redirect:/admin/customer_notice";
		}
		log.info("modify_post 요청"+vo);
		if(cn_service.notice_update(vo)) {
			rttr.addFlashAttribute("cri", cri);
			return "redirect:/admin/customer_notice/read/"+vo.getNotice_bno();
		}else {
			model.addAttribute("vo", vo);
			return "/admin/customer_notice/modify";			
		}
	}
	
}