package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.CardVO;
import com.spring.domain.CustomerVO;

import security.Customer_UserDetails;


public interface CustomerService {
	public boolean update_login_failure_count(String id);
	public boolean init_login_failure_count(String id);
	public int check_login_failure_count(String id);
	
	public boolean set_disabled(String id);
	
	public Customer_UserDetails security_get_customer(String id);
	
	public String get_password(String id);
	
	public boolean send_tmpPassword(CustomerVO vo);
	public boolean delete_by_id(String id);
	
	public boolean insert_locked_customer(String id);
	public boolean delete_locked_customer(String id);
	public boolean set_enabled(String id);
	
	public List<CustomerVO> select_to_unlock();
	
	public boolean unlock_customer(String id);
	public boolean lock_customer(String id);
	
	
	public boolean insert_verifyKey(CustomerVO vo);
	public boolean set_verified(CustomerVO vo);
	
	public boolean update_sendcount(String id);
	public boolean reset_sendcount();
	
	public boolean request_card(CardVO vo);
	
	public List<CardVO> requested_count(String cno);
	
}
