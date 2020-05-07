package com.spring.service;

import com.spring.domain.DepositVO;

public interface AccountService {
	public long balnce(String ano);

	public String getCno(String id);
	
	public DepositVO get_row(String ano);
}
