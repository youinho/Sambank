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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AttachFileDTO;
import com.spring.domain.Criteria;
import com.spring.domain.InquiryVO;
import com.spring.domain.Inquiry_replyVO;
import com.spring.domain.PageVO;
import com.spring.domain.Profile_imageVO;
import com.spring.service.AdminService;
import com.spring.service.CustomerNoticeService;
import com.spring.service.InquiryService;
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
	
	@Autowired
	private InquiryService inquiry_service;
	
	
	@GetMapping("/member/inquiry")
	public String User_Q_notice(Model model, HttpServletRequest req) {
		
		model.addAttribute("list", inquiry_service.getList_by_customer(req.getRemoteUser()));
		model.addAttribute("title", "1:1 문의");
		
		
		
		return "/member/inquiry/list";
	}
	
	@GetMapping("/member/inquiry/register")
	public String User_inquiry_register(Model model) {
		
		
		model.addAttribute("title", "1:1 문의");
		return "/member/inquiry/register";
	}
	
	@PostMapping("/member/inquiry/register")
	public String User_inquiry_register_post(InquiryVO vo, HttpServletRequest req, RedirectAttributes rttr, Model model) {
		vo.setCustomer_id(req.getRemoteUser());
		vo.setCustomer_name(service.select_by_id(req.getRemoteUser()).getName());
		model.addAttribute("title", "1:1 문의");
		if(inquiry_service.insert_inquiry(vo)) {
			rttr.addFlashAttribute("registered", "true");
		}else {
			rttr.addFlashAttribute("registered", "false");
		}
		
		
		return "redirect:/member/inquiry";
	}
	
	@GetMapping("/member/inquiry/{inquiry_no}")
	public String inquiry_view(@PathVariable("inquiry_no") String inquiry_no, Model model, HttpServletRequest req) {
		
		try {
			Integer.parseInt(inquiry_no);
		}catch(Exception e){
			return "redirect:/member/inquiry";
		}
		
		InquiryVO vo = inquiry_service.getRow(inquiry_no);
		if(vo.getCustomer_id().equals(req.getRemoteUser())) {
			model.addAttribute("vo", vo);
			return "/member/inquiry/read";
		}
		return "redirect:/member/inquiry";
		
		
	}
	
	
	//문의 답변 불러오기
	@ResponseBody
	@PostMapping("/member/inquiry/inquiry_get_reply")
	public ResponseEntity<List<Inquiry_replyVO>> get_inquiry_reply(String inquiry_no, HttpServletRequest req){
		List<Inquiry_replyVO> list = null;
		if(inquiry_service.getRow(inquiry_no).getCustomer_id().equals(req.getRemoteUser())) {
			list  = inquiry_service.get_replyList(inquiry_no);			
			return new ResponseEntity<List<Inquiry_replyVO>>(list, HttpStatus.OK);
		}
		return new ResponseEntity<List<Inquiry_replyVO>>(list, HttpStatus.BAD_REQUEST);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/F")
	public String User_F_File(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("자료실");	
		cri.setNotice_types("F");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		model.addAttribute("title", "자료실");
		return "/user/notice/list";
	}
	@GetMapping("/N")
	public String User_N_News(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("새소식");	
		cri.setNotice_types("N");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		model.addAttribute("title", "새소식");
		return "/user/notice/list";
	}
	
	
	@GetMapping("/E")
	public String User_E_Event(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("이벤트");	
		cri.setNotice_types("E");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		model.addAttribute("title", "이벤트");
		return "/user/notice/list";
	}
	@GetMapping("/A")
	public String User_A_Announce(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("고객 공지 게시판");	
		cri.setNotice_types("A");
		model.addAttribute("list", cn_service.notice_getList(cri));
		model.addAttribute("pageVO", new PageVO(cri, cn_service.totalRows(cri)));
		model.addAttribute("title", "공지사항");
		
		return "/user/notice/list";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//관리자 프로필 이미지 불러오기
	@ResponseBody
	@GetMapping("/member/inquiry/get_profile_image")
	public ResponseEntity<byte[]> getByteImage(String id, HttpServletRequest req) {
		final HttpHeaders headers = new HttpHeaders();
		
		if(id==null) {
			return new ResponseEntity<byte[]>(null, headers, HttpStatus.BAD_REQUEST);
		}
	    Profile_imageVO vo = service.get_profile_image(id);
        byte[] imageContent = vo.getProfile_image();
        String profile_image_type = vo.getProfile_image_type(); 
        
       
        if(profile_image_type.equalsIgnoreCase("jpg") || profile_image_type.equalsIgnoreCase("jpeg")) {
    	    headers.setContentType(MediaType.IMAGE_JPEG);
        }else if(profile_image_type.equalsIgnoreCase("gif")) {
    	    headers.setContentType(MediaType.IMAGE_GIF);
        }else{
    	    headers.setContentType(MediaType.IMAGE_PNG);
        }
        return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}
	
	
	
	
}
