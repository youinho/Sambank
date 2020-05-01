package com.spring.domain;

import lombok.Data;

//업로드된 파일의 정보를 담는 객체
@Data
public class AttachFileDTO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private String admin_bno;
	
	private String notice_bno;
}
