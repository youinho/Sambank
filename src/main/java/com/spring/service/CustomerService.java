package com.spring.service;

import org.springframework.stereotype.Service;


public interface CustomerService {
	public boolean update_login_failure_count(String id);
	public boolean init_login_failure_count(String id);
	public int check_login_failure_count(String id);
	
	public boolean set_disabled(String id);
}
