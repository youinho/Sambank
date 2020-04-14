package com.spring.service;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_registerVO;

public interface AdminService {
	public AdminVO selectOne(AdminVO vo);
	public void register(String num);
	public int test(int value);
}
