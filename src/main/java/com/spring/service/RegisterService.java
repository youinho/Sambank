package com.spring.service;

import com.spring.domain.CustomerVO;

public interface RegisterService {
	//중복아이디 검사
//	public RegisterVO dupId(String userid);
	//회원가입
	public boolean registMember(CustomerVO vo);
	
	//로그인
//	public AuthInfo login(LoginVO vo);
	
	//회원탈퇴
//	public boolean leaveMember(LoginVO vo);
	
//	public boolean changePwd(changePwdVO vo);
}
