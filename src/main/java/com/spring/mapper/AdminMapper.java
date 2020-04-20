package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;

public interface AdminMapper {
	public AdminVO selectOne(AdminVO vo);
	public void register_account(@Param("num") String num);
	public int insert_account(Admin_registerVO vo);
	public int create_deposit(@Param("cno") int cno,@Param("ano") String ano);
	public int register_customer(CustomerVO vo);
	public List<DepositVO> get_deposit_list();
	public CustomerVO select_by_cno(int cno);
	public List<CustomerVO> search_customer(@Param("name") String name,@Param("birth") String birth,@Param("mobile") String mobile);
	
	public int test1(int value);
	public int test2(int value);
	
	
}
