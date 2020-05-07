package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CustomerMapper;
@Service
public class CustomerServiceImpl implements CustomerService {

	
	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public boolean update_login_failure_count(String id) {

		return customerMapper.update_login_failure_count(id)==1;
	}

	@Override
	public boolean init_login_failure_count(String id) {

		return customerMapper.init_login_failure_count(id)==1;
	}

	@Override
	public int check_login_failure_count(String id) {

		return customerMapper.check_login_failure_count(id);
	}

	@Override
	public boolean set_disabled(String id) {

		return customerMapper.set_disabled(id)==1;
	}

}
