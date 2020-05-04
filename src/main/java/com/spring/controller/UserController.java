package com.spring.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.AttachFileDTO;
import com.spring.domain.Criteria;
import com.spring.domain.PageVO;
import com.spring.service.AdminService;
import com.spring.service.CustomerNoticeService;
import com.spring.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	@Autowired
	private AdminService service;
	
	
	@Autowired
	private UserService usc;
	
	@Autowired
	private CustomerNoticeService cn_service;
	
	@GetMapping("/Q")
	public String User_Q_notice(Model model, @ModelAttribute("cri") Criteria cri) {
		
		return "/user/Questions/Questions";
	}
	
	@GetMapping("/F")
	public String User_F_File(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("자료실");	
		cri.setNotice_types("E");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		model.addAttribute("title", "자료실");
		return "/user/News/News";
	}
	@GetMapping("/N")
	public String User_N_News(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("새소식");	
		cri.setNotice_types("N");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		model.addAttribute("title", "새소식");
		return "/user/News/News";
	}
	
	
	@GetMapping("/E")
	public String User_E_Event(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("이벤트");	
		cri.setNotice_types("E");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		model.addAttribute("title", "이벤트");
		return "/user/News/News";
	}
	@GetMapping("/A")
	public String User_A_Announce(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("고객 공지 게시판");	
		cri.setNotice_types("A");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		model.addAttribute("title", "공지사항");
		
		return "/user/News/News";
	}
	
	//고객 공지 read페이지
	@GetMapping("/customer_notice/read/{bno}")
	public String customer_notice_view(@PathVariable("bno") int notice_bno,@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
		
		//log.info("read 요청"+admin_bno);
		try {
			model.addAttribute("vo", cn_service.notice_getRow(notice_bno));
			if(cri.getNotice_types().equals("N"))
				model.addAttribute("title", "새소식");
			if(cri.getNotice_types().equals("A"))
				model.addAttribute("title", "공지사항");
			if(cri.getNotice_types().equals("E"))
				model.addAttribute("title", "이벤트");
			if(cri.getNotice_types().equals("F"))
				model.addAttribute("title", "자료실");
			
		}catch (Exception e) {
			return "redirect:/N";
		}
		return "/user/read";
	}
	
	
	//첨부파일 다운로드
	@GetMapping("/customer_notice/downloadFile")
	@ResponseBody
	public ResponseEntity<Resource> customer_download(AttachFileDTO dto, @RequestHeader("user-Agent") String userAgent, HttpServletRequest req){
		
		//log.info("파일 다운로드"+dto);
		//log.info("파일 user : "+req.getRemoteUser());
		
		AttachFileDTO data = cn_service.get_oneFile(dto);
		if(data==null) {
			return new ResponseEntity<Resource>(HttpStatus.BAD_REQUEST);
		}
		//log.info("data :"+data);
		String fileName = data.getUploadPath()+"\\"+data.getUuid()+"_"+data.getFileName();
		Resource resource = new FileSystemResource("d:\\upload_customer\\"+fileName);
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
		
		//log.info(admin_bno+" 첨부물 가져오기");
		return new ResponseEntity<List<AttachFileDTO>>(cn_service.getAttachList(notice_bno), HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/no")
	public String Notice(@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req ) {
		
		
		model.addAttribute("list", usc.listmap(cri));
		model.addAttribute("pageVO",new PageVO(cri, usc.totalRows(cri)));
		return "/user/Notice/Notice";
	}
	
	@GetMapping("/N-1")
	public String NEW() {
		log.info("양식 게시판");	
		return "N-test1";
	}
//	@GetMapping("/U-1")
//	public String User_Set() {
//		log.info("문의사항 게시판");	
//		return "/user/UserSet";
//	}
//	@GetMapping("/U-2")
//	public String User_Update() {
//		log.info("문의사항 게시판");	
//		return "/user/UserUpdate";
//	}
//	@GetMapping("/U-3")
//	public String User_Delete() {
//		log.info("문의사항 게시판");	
//		return "/user/UserDelete";
//	}
	
	
	
	
}
