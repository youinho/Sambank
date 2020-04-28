package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Deposit_historyVO {
	private int hno;
	private String ano;
	private String from_ano;
	private String name;
	private long deposit;
	private long withdrawal;
	private long balance;
	private Date depositdate;
	
	
	
	private long amount;
}
