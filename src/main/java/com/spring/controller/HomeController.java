package com.spring.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParser;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.email.Email;
import com.spring.email.EmailSender;
import com.spring.service.AdminService;
import com.spring.service.CustomerNoticeService;
import com.spring.service.CustomerService;
import com.spring.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private CustomerNoticeService cn_service;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping("/")
	public String home(Model model, HttpServletRequest req, HttpSession session) {
		
		int N = 3;	// 몇개 뽑을건지
		Criteria cri = new Criteria(1, N);
		cri.setNotice_types("A");
		model.addAttribute("list_A", cn_service.notice_getList(cri));
		cri.setNotice_types("N");
		model.addAttribute("list_N", cn_service.notice_getList(cri));
		cri.setNotice_types("E");
		model.addAttribute("list_E", cn_service.notice_getList(cri));
		cri.setNotice_types("F");
		model.addAttribute("list_F", cn_service.notice_getList(cri));
		
		model.addAttribute("now", new Date().getTime());
		log.info("main페이지");
		return "main";
	}
	
	//testpage
//	@GetMapping("/ft")
//	public String GuideHeader() {
//		return "footer_Main";
//	}
//	
//	@GetMapping("/hd")
//	public String newmain() {
//		return "header_Main";
//	}
	
//	@GetMapping("/Q")
//	public String Questions() {
//		return "Questions";
//	}
	
//	@PostMapping("/login")
//	public void user_login_post(CustomerVO vo) {
//		
//		CustomerVO checkedVO = service.selectOne(vo);
//		
//		log.info(""+vo);
//		if(checkedVO == null) {
//			log.info("로그인 실패");
//			return "user/login";
//			
//		}
//		
//		
//		log.info("로그인 성공");
//		return "main";
		
//	}
	
	
	
	
	
	
	// 고객 로그인 페이지
	@GetMapping("/member/login")	
	public String customer_test_login(HttpServletRequest req) {
		return "/login";
	}

	//recapcha
	
	@ResponseBody
	@PostMapping("/check_recapcha")
	public ResponseEntity<String> check_recapcha(String token, HttpServletRequest req) {
		log.info("check recapcha"+token);
		
		
		
		String targetURL = "https://www.google.com/recaptcha/api/siteverify";

		URL url;
		HttpURLConnection connection = null;
		boolean isSuccess = false;
		String params = "";
		String jsonData = "";
		String secretKey = "6LenvvQUAAAAALdARp0IiPOdoNRnkmTg4zBv3fT7";
		String remoteip = req.getRemoteAddr();
		
		try {
			params = "secret=" + secretKey + "&response=" + token + "&remoteip=" + remoteip;

			// Create connection
			url = new URL(targetURL);
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setUseCaches(false);
			connection.setDoInput(true);
			connection.setDoOutput(true);

			// Send request
			DataOutputStream os = new DataOutputStream(connection.getOutputStream());
		    os.writeBytes(params);
			os.flush();
			os.close();

			// Get Response
			InputStream is = connection.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			StringBuffer sb = new StringBuffer();

			while ((jsonData = br.readLine()) != null) {
				sb.append(jsonData);
			}
			JSONParser parser = new JSONParser();
			Object resvObj = parser.parse(sb.toString());
			JSONObject jsonObj = (JSONObject) resvObj;
			log.info("get success : "+jsonObj.get("success"));
			isSuccess = (boolean) jsonObj.get("success");
			if(!isSuccess) {
				System.out.println("reCaptcha error  : " + jsonObj.get("error-codes").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		
		if(!isSuccess) {
			req.getSession().setAttribute("capcha_res", "false");
		}
		
		log.info("capcha_ res : "+isSuccess);
		
		return new ResponseEntity<String>(isSuccess?"true":"false", HttpStatus.OK);
	}
	
	
	@Transactional
	@GetMapping("/verify_email")
	public String verify_email(CustomerVO vo, RedirectAttributes rttr) {
		
		
		if(customerService.set_verified(vo)) {
			rttr.addFlashAttribute("registered", "verified");
			return "redirect:/";
		}
		rttr.addFlashAttribute("registered", "verify_failed");
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping("/resend_verify")
	public ResponseEntity<String> resend_verify(String id, String password){
		
		CustomerVO vo = adminService.select_by_id(id);
		if(vo==null) {
			return new ResponseEntity<String>("not_found", HttpStatus.OK);
		}
		if(!passwordEncoder.matches(password, customerService.get_password(vo.getId()))) {
			return new ResponseEntity<String>("failed", HttpStatus.OK);
		}
		if(vo.getSendCount()>10) {
			return new ResponseEntity<String>("muchsend", HttpStatus.OK);
		}
		if(adminService.send_verify_mail(vo)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		return new ResponseEntity<String>("error", HttpStatus.OK);
	}
	
	
	
	@GetMapping("/findpass")
	public String findpass_get() {
		
		return "/findpass";
	}
	
	@ResponseBody
	@PostMapping("/send_tmpPass")
	public ResponseEntity<String> send_tmpPass_post(CustomerVO vo){
		
		return new ResponseEntity<String>(customerService.send_tmpPassword(vo)?"Success":"failed", HttpStatus.OK);
		
	}
	
	
	
	
	
	
	
	
	
	
//	@GetMapping("/member/test")	// 로그인 테스트 페이지
//	public String login_test_success() {
//		log.info("로그인 성공");
//		
//		
//		return "/test_success";
//	}
	
	
	
	
	
	
	
	
	
	//umbrella
	
	@GetMapping("/umbrella")
	public String umbrella() {
//		log.info("umbrella 페이지 요청");
		
		return "umbrella2";
	}
	
	@PostMapping("/umbrella/save_center")
	public void umbrella_save_center(String center_lat, String center_lng, String user_uuid) {
		
		File file = new File("/home/ec2-user/umbrella/"+user_uuid+"center.txt");
		FileWriter writer = null;
		
		try {
			writer = new FileWriter(file, false);
			writer.write(center_lat+" "+center_lng);
			writer.flush();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(writer != null) {
					writer.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("saveCenter_done");
	}
	
	@PostMapping("/umbrella/get_center")
	@ResponseBody
	public String umbrella_get_center(String user_uuid) {
		String latlng = "";
		File file = new File("/home/ec2-user/umbrella/"+user_uuid+"center.txt");
		try(FileReader filereader = new FileReader(file);
			BufferedReader br = new BufferedReader(filereader)
			) {
			latlng = br.readLine();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		System.out.println("getCenter_done"+latlng);
		return latlng;
	}

	
	@PostMapping("/umbrella/save_level")
	public void umbrella_save_level(String level, String user_uuid) {
		
		File file = new File("/home/ec2-user/umbrella/"+user_uuid+"level.txt");
		FileWriter writer = null;
		
		try {
			writer = new FileWriter(file, false);
			writer.write(level);
			writer.flush();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(writer != null) {
					writer.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	@PostMapping("/umbrella/get_level")
	@ResponseBody
	public String umbrella_get_level(String user_uuid) {
		String level = "";
		File file = new File("/home/ec2-user/umbrella/"+user_uuid+"level.txt");
		try(FileReader filereader = new FileReader(file);
			BufferedReader br = new BufferedReader(filereader)
			) {
			level = br.readLine();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return level;
	}
	

}
