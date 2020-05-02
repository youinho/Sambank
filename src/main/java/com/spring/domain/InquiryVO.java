package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class InquiryVO {
	private String inquiry_no;
	private String customer_id;
	private String customer_name;
	private String title;
	private String content;
	private String answer_id;
	private String answer_branch;
	private String answer_rank;
	private String answer_name;
	private String condition;
	private Date regDate;
	private Date updateDate;
}
