package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AccountMapper;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountMapper mapper;
	
	
	@Override
	public long balnce(String ano) {
		// TODO Auto-generated method stub
		return mapper.get_balance(ano);
	}
}
