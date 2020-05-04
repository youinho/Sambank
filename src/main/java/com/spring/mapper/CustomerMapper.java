package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.Acc_info;
import com.spring.domain.CustomerVO;

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
}
