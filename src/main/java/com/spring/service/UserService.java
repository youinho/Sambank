package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.Customer_noticeVO;

@Service
public interface UserService {
	
	// 테이블에있는 리스트 출력내용 가져오기
	public List<Customer_noticeVO> listmap(Criteria cri);
	public int totalRows(Criteria cri);
	
	//개인정보관련
	//개인정보 가져오기
	public CustomerVO select_user(String id);
	
	
}
