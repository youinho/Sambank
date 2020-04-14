package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_registerVO;
import com.spring.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;
	
	
	@Override
	public AdminVO selectOne(AdminVO vo) {
	
		return adminMapper.selectOne(vo);
	}


	@Transactional
	@Override
	public void register(String num) {
		Admin_registerVO vo = new Admin_registerVO();
		vo.setAno(num);
		vo.setCno(num);
		vo.setSno(num);
		adminMapper.register_account(num);
		adminMapper.insert_account(vo);
	}


	@Override
	@Transactional
	public int test(int value) {
		adminMapper.test2(value);
		adminMapper.test1(value);
		return 0;
	}
	
	
}
