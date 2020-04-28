package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CustomerVO;
import com.spring.mapper.RegisterMapper;


@Service
public class RegisterServiceImpl implements RegisterService {
	
	@Autowired
	private RegisterMapper mapper;
	
	@Override
	public CustomerVO dupId(String userid) {
		return mapper.selectById(userid);
	}
	//회원가입
	@Override
	public boolean registMember(CustomerVO vo) {
	
		return mapper.insertMember(vo)>0?true:false;
	}

	@Override
	public CustomerVO customer_login(CustomerVO vo) {
	
		return mapper.login(vo);
	}
	
//	
//	@Override
//	public boolean leaveMember(LoginVO vo) {	
//		return mapper.leave(vo)>0?true:false;
//	}
//	
//	@Override
//	public boolean changePwd(changePwdVO vo) {
//		
//		return mapper.changePwd(vo)>0?true:false;
//	}
}
