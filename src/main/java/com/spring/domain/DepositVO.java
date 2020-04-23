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
	private int balance;
	private int card_apply;
	private String card_no;
	private int day_withdraw;
	private int max_withdraw;
	private String branch;
	private Date createdate;
	private Date updatedate;
}
