package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Inquiry_replyVO {
	private String inquiry_reply_no;
	private String inquiry_no;
	private String answer_id;
	private String answer_branch;
	private String answer_rank;
	private String answer_name;
	private String content;
	private Date regDate;
}
