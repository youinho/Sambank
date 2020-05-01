package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.spring.domain.Admin_logVO;
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.AttachFileDTO;
import com.spring.domain.Criteria;
import com.spring.domain.Customer_noticeVO;
import com.spring.domain.PageVO;
import com.spring.service.AdminService;
import com.spring.service.CustomerNoticeService;
import com.spring.service.SBValidator;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("/admin/customer_notice/*")
@Slf4j
public class Admin_customer_noticeController {
	@Autowired
	private AdminService admin_service;
	
	@Autowired
	private CustomerNoticeService service;
	
	@Autowired
	private SBValidator vali;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	private boolean logging(HttpServletRequest req) {
		
		Admin_logVO vo = new Admin_logVO();
		vo.setId(req.getRemoteUser());
		if(vo.getId()==null) {
			vo.setId("Anonymous");
		}
		vo.setUri(req.getRequestURI());
		vo.setLocal_name(req.getLocalName());
		vo.setLocal_addr(req.getLocalAddr());
		vo.setLocal_port(req.getLocalPort()+"");
		vo.setRemote_addr(req.getRemoteAddr());
		vo.setRemote_port(req.getRemotePort()+"");
		vo.setAdmin_session((req.getSession()+"").substring(49));
		log.info("log vo : "+vo);
		return admin_service.insertLog(vo);
	}
	
	//폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);		
	}
	
	//첨부파일 다운로드
//		@PostMapping("/notice/downloadFile")
	@GetMapping("/downloadFile")
	@ResponseBody
	public ResponseEntity<Resource> download(AttachFileDTO dto, @RequestHeader("user-Agent") String userAgent, HttpServletRequest req){
		logging(req);
		//log.info("파일 다운로드"+dto);
		//log.info("파일 user : "+req.getRemoteUser());
		if(admin_service.selectOne(req.getRemoteUser())==null){
			return new ResponseEntity<Resource>(HttpStatus.BAD_REQUEST);
		}
		AttachFileDTO data = service.get_oneFile(dto);
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
	@PostMapping("/get_attachList")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> getAttachList(String admin_bno, HttpServletRequest req){
		logging(req);
		//log.info(admin_bno+" 첨부물 가져오기");
		return new ResponseEntity<List<AttachFileDTO>>(service.getAttachList(admin_bno), HttpStatus.OK);
	}
	
	//첨부파일 업로드
	@PostMapping("/upload")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadPost(MultipartFile[] uploadFile, HttpServletRequest req) {
		logging(req);
		String uploadFolder = "d:\\upload_customer";
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
	

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type, HttpServletRequest req){
		logging(req);
		//log.info("파일 삭제 : ");
		File file = null;
		try {
			String file_p = "d:\\upload_customer\\"+URLDecoder.decode(fileName, "utf-8");
			file = new File(file_p);
			file.delete();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	

	@GetMapping("/register")
	public String notice_register_get(HttpServletRequest req) {
		logging(req);
		//log.info("게시글 등록 페이지 요청");
		return "/admin/customer_notice/register";
	}
	

	@PostMapping("/register")
	public String notice_register(Customer_noticeVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		logging(req);
		if(vo.getTitle()==null || vo.getTitle().equals("") || vo.getContent()==null || vo.getContent().equals("")) {
			return "/admin/customer_notice/register";
		}
		// 권한이 5아래 일경우 작성못함
		int permit_level = 5;
		if(admin_service.get_groupID(req.getRemoteUser()) < permit_level){
			return "/admin/customer_notice/register";
		}
		//log.info("register_post"+vo);
		//log.info("게시글 등록. 아이디 : "+req.getRemoteUser());
		vo.setId(req.getRemoteUser());
		vo.setWriter(admin_service.selectOne(req.getRemoteUser()).getName());
		if(service.notice_insert(vo)) {
			rttr.addFlashAttribute("registered", "true");
			rttr.addFlashAttribute("notice_bno", vo.getNotice_bno());
			return "redirect:/admin/customer_notice";
		}
		return "/admin/customer_notice/register";
	}

	@GetMapping("/read")
	public String notice_read(HttpServletRequest req) {
		logging(req);
		//log.info("read 요청");
		return "/admin/customer_notice/read";
	}

	//사내 공지 게시글 페이지
	@GetMapping("/read/{bno}")
	public String notice_view(@PathVariable("bno") int notice_bno,@ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
		logging(req);
		//log.info("read 요청"+admin_bno);
		try {
			model.addAttribute("vo", service.notice_getRow(notice_bno));
		}catch (Exception e) {
			return "redirect:/admin/customer_notice";
		}
		return "/admin/customer_notice/read";
	}
	

	@PostMapping("/delete")
	public String notice_delete(@RequestParam("bno") int notice_bno, String id,@ModelAttribute("cri") Criteria cri,  Model model, HttpServletRequest req) {
		logging(req);
		//log.info("삭제 요청");
		// 권한확인
		if(admin_service.get_groupID(req.getRemoteUser())< admin_service.get_groupID(id)) {
			return "/customer_notice/read/"+notice_bno;
		}
		//삭제
		if(service.notice_delete(notice_bno)) {
			return "redirect:/admin/customer_notice";
		}
		return "/customer_notice/read/"+notice_bno;
	}
	

	@GetMapping("/modify")
	public String notice_modify(@RequestParam("bno") int notice_bno, @ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest req) {
		logging(req);
		//log.info("modify_get 요청");
		model.addAttribute("vo", service.notice_getRow(notice_bno));
		return "/admin/customer_notice/modify";
	}
	
	
	@PostMapping("/modify")
	public String notice_update(Customer_noticeVO vo,@ModelAttribute("cri") Criteria cri, Model model, RedirectAttributes rttr, HttpServletRequest req) {
		logging(req);
		log.info("modify_post 요청"+vo);
		if(service.notice_update(vo)) {
			rttr.addFlashAttribute("cri", cri);
			return "redirect:/admin/customer_notice";
		}else {
			model.addAttribute("vo", vo);
			return "/admin/customer_notice/modify";			
		}
	}
	
}
