package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.spring.domain.CustomerVO;
import com.spring.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper usermapper;
	
	
	
	public CustomerVO selectOne(CustomerVO vo) {
		return usermapper.selectOne(vo);
	}
	
}
