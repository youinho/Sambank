package com.spring.service;

import java.util.List;

import com.spring.domain.Customer_requestVO;
import com.spring.domain.DepositVO;

public interface AccountService {
	public long balnce(String ano);

	public String getCno(String id);
	
	public DepositVO get_row(String ano);
	
	public List<DepositVO> cnoDeposit(int cno);
	
	public long cnoSumBalnce(int cno);
	
	public boolean create_customer_request(Customer_requestVO vo);
}
