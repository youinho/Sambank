package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CardVO {
	private String card_no;
	private String ano;
	private int c_type;
	private String exp_date;
	private String security_key;
	private int condition;
	private Date createdate;
	private Date updatedate;
	private long limit;
	private long limit_month;
	private String password;
	
	private String confirm_password;
}
