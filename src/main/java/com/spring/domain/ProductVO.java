package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int product;
	private String p_name;
	private int interest_rates;
	private long limit;
	private Date exp_date;
	private Date repay_date;
	
}
