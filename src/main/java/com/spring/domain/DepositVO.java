package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class DepositVO {
	private int dno;
	private int cno;
	private String ano;
	private int balance;
	private Date createdate;
	private Date updatedate;
}
