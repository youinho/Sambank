package com.spring.mapper;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.Customer_noticeVO;

public interface UserMapper {
	public List<Customer_noticeVO> listmap(Criteria cri);
	public int getTotalCount(Criteria cri);
	public Customer_noticeVO getRow(int notice_bno);


	
	
}
