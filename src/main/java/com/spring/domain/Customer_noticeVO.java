package com.spring.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class Customer_noticeVO {
	private String notice_bno;
	private String id;
	private String auth;
	private String title;	//200
	private String content;	//2000
	private String writer;	//50
	private Date regdate;
	private Date updatedate;
	private String notice_type;
	
	
	private String rank;
	private String branch;
	//첨부파일 목록
	private List<AttachFileDTO> attachList;
}
