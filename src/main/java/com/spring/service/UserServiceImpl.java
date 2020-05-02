package com.spring.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.Customer_noticeVO;
import com.spring.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper urm;
	



	@Override
	public List<Customer_noticeVO> listmap(Criteria cri) {
		// TODO Auto-generated method stub
		return urm.listmap(cri);
	}

	@Override
	public int totalRows(Criteria cri) {
		// TODO Auto-generated method stub
		return urm.getTotalCount(cri);
	}
	
	
	
	
}
