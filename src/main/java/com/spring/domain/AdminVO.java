package com.spring.domain;

import lombok.Data;

@Data
public class AdminVO {

	
	
	private int admin_no;
	private String auth;
	private String id;
	private String password;
	private String name;
	private String rank;
	private String branch;
	private String mobile;
	
	private int enabled;
	
	private int authority;
	
	private String confirm_password;
	private String group_id;
}
