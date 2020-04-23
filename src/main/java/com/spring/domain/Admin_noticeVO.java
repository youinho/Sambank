package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Admin_noticeVO {
	private String admin_bno;
	private String admin_no;
	private String title;	//200
	private String content;	//2000
	private String writer;	//50
	private Date regdate;
	private Date updatedate;
}
