package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UploadController {
	//uploadForm 蹂댁뿬二쇨린
	
	//첨부파일 다운로드
	@GetMapping("/member/download")
	@ResponseBody
	public ResponseEntity<Resource> download(String fileName,@RequestHeader("user-Agent")String userAgent){
		log.info("파일 다운로드 "+fileName);
		fileName="1.txt";
		Resource resource = new FileSystemResource("c:\\upload\\"+fileName);
		
		if(!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		
		String resourceUidName = resource.getFilename();
		String resourceName = 
				resourceUidName.substring(resourceUidName.indexOf("_")+1);
		
		HttpHeaders headers = new HttpHeaders();
		
		String downloadName = "1.txt";
		
		if(userAgent.contains("Trident") || userAgent.contains("Edge")) {
			try {
				downloadName = URLEncoder.encode(resourceName,"utf-8").replaceAll("\\+"," ");				
			} catch (UnsupportedEncodingException e) {				
				e.printStackTrace();
			}
		}else {
			try {
				downloadName = new String(resourceName.getBytes("utf-8"),"ISO-8859-1");
			} catch (UnsupportedEncodingException e) {				
				e.printStackTrace();
			}
		}
		headers.add("Content-Disposition", "attachment;filename="+downloadName);
		
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}
}













