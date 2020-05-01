package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Admin_logVO {
	private String log_no;
	private String id;
	private String uri;
	private Date logDate;
	private String local_name;
	private String local_addr;
	private String local_port;
	private String remote_addr;
	private String remote_port;
	private String admin_session;
}
