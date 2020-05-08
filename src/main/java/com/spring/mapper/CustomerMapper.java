package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.Acc_info;
import com.spring.domain.CustomerVO;

import security.Customer_UserDetails;

public interface CustomerMapper {
	
	public CustomerVO select_by_cno(int cno);
	public CustomerVO select_by_id(String id);
	public List<CustomerVO> search_customer(@Param("name") String name,@Param("birth") String birth,@Param("mobile") String mobile);
	public int checkId(String id);
	public int register_customer(CustomerVO vo);
	public List<Acc_info> select_acc_info(int cno);
	public int update_customer(CustomerVO vo);
	public int delete_customer(CustomerVO vo);
	public String get_password(String id);
	
	public int update_password(CustomerVO vo);
	
	
	public int update_login_failure_count(String id);
	public int init_login_failure_count(String id);
	public int check_login_failure_count(String id);
	
	public int set_disabled(String id);
	
	public Customer_UserDetails security_get_customer(String id);
	
	public int insert_locked_customer(String id);
	public int delete_locked_customer(String id);
	public int set_enabled(String id);
	public List<CustomerVO> select_to_unlock();
	
}
