package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CustomerVO {
	
	private int cno;
	private int rating;
	private String name;
	private String gender;
	private String birth;
	private String resident_registration_no;
	private String address;
	private String mobile;
	private String id;
	private String password;
	private String passhint;
	private String email;
	private int withdrawal_limits;
	private int check_card;
	private Date createdate;
	
	private String reg_no;
}
