package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CustomerVO;
import com.spring.mapper.RegisterMapper;


@Service
public class RegisterServiceImpl implements RegisterService {
	
	@Autowired
	private RegisterMapper mapper;
	
//	@Override
//	public RegisterVO dupId(String userid) {
//		return mapper.selectById(userid);
//	}
	
	@Override
	public boolean registMember(CustomerVO vo) {
	
		return mapper.insertMember(vo)>0?true:false;
	}
//	@Override
//	public AuthInfo login(LoginVO vo) {
//	
//		return mapper.login(vo);
//	}
//	
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
