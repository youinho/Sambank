package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CustomerVO {
	private int cno;
	private String name;
	private String gender;
	private String mobile;
	private String id;
	private String password;
	private String passhint;
	private Date createdate;
}
