package com.spring.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class Admin_noticeVO {
	private String admin_bno;
	private String id;
	private String auth;
	private String title;	//200
	private String content;	//2000
	private String writer;	//50
	private Date regdate;
	private Date updatedate;
	
	//첨부파일 목록
	private List<AttachFileDTO> attachList;
}
