package com.spring.mapper;

import com.spring.domain.CustomerVO;

public interface RegisterMapper {
	
	public int insertMember(CustomerVO vo);//회원가입
	
	public CustomerVO selectById(String id);//아이디 중복검사

	public CustomerVO login(CustomerVO vo);
}
