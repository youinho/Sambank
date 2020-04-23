package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CustomerVO;

public interface CustomerMapper {
	
	public CustomerVO select_by_cno(int cno);
	public List<CustomerVO> search_customer(@Param("name") String name,@Param("birth") String birth,@Param("mobile") String mobile);
	public int checkId(String id);
	public int register_customer(CustomerVO vo);
}
