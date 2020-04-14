package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_registerVO;

public interface AdminMapper {
	public AdminVO selectOne(AdminVO vo);
	public void register_account(@Param("num") String num);
	public int insert_account(Admin_registerVO vo);
	public int test1(int value);
	public int test2(int value);
}
