package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.CustomerVO;
import com.spring.mapper.CustomerMapper;

import security.Customer_UserDetails;
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

	@Override
	public Customer_UserDetails security_get_customer(String id) {

		return customerMapper.security_get_customer(id);
	}

	@Override
	public boolean insert_locked_customer(String id) {

		return customerMapper.insert_locked_customer(id)==1;
	}

	@Override
	public boolean delete_locked_customer(String id) {
		
		return customerMapper.delete_locked_customer(id)==1;
	}

	@Override
	public boolean set_enabled(String id) {

		return customerMapper.set_enabled(id)==1;
	}

	@Override
	public List<CustomerVO> select_to_unlock() {

		return customerMapper.select_to_unlock();
	}

	@Transactional
	@Override
	public boolean unlock_customer(String id) {
		if(customerMapper.set_enabled(id)==1) {
			if(customerMapper.delete_locked_customer(id)==1) {
				return true;
			};
		}
		return false;
	}
	
	@Transactional
	@Override
	public boolean lock_customer(String id) {
		
		if(customerMapper.set_disabled(id)==1) {
			if(customerMapper.insert_locked_customer(id)==1) {
				if(customerMapper.init_login_failure_count(id)==1) {
					return true;					
				}
			}
		}
		
		
		return false;
	}

	@Override
	public boolean insert_verifyKey(CustomerVO vo) {

		return customerMapper.insert_verifyKey(vo)==1;
	}

	@Override
	public boolean set_verified(CustomerVO vo) {

		return customerMapper.set_verified(vo)==1;
	}

	@Override
	public boolean update_sendcount(String id) {

		return customerMapper.update_sendCount(id)==1;
	}

	@Override
	public boolean reset_sendcount() {

		return customerMapper.reset_sendCount()>0;
	}

	@Override
	public String get_password(String id) {

		return customerMapper.get_password(id);
	}

}
