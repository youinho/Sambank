package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class DepositVO {
	private int cno;
	private String ano;
	private int type;
	private int product;
	private String password;
	private long balance;
	private char card_apply;
	private String card_no;
	private long day_withdraw;
	private long max_withdraw;
	private String branch;
	private Date createdate;
	private Date updatedate;
	
	
	private String name;
	
	private String p_name;
	private Date depositdate;
}
