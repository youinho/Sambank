package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;

public interface AdminMapper {
	public AdminVO selectOne(AdminVO vo);
	
	public int insert_account(Admin_registerVO vo);
	
	
	
}
