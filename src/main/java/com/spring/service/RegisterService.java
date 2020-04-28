package com.spring.service;

import com.spring.domain.CustomerVO;

public interface RegisterService {
	//	중복아이디 검사
	public CustomerVO dupId(String id);
	//	회원가입
	public boolean registMember(CustomerVO vo);//회원가입
	
	//로그인
	public CustomerVO customer_login(CustomerVO vo);
	
	//회원탈퇴
//	public boolean leaveMember(LoginVO vo);
	
//	public boolean changePwd(changePwdVO vo);
}
