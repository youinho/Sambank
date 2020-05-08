package com.spring.service;

import org.springframework.stereotype.Service;

import security.Customer_UserDetails;


public interface CustomerService {
	public boolean update_login_failure_count(String id);
	public boolean init_login_failure_count(String id);
	public int check_login_failure_count(String id);
	
	public boolean set_disabled(String id);
	
	public Customer_UserDetails security_get_customer(String id);
}
