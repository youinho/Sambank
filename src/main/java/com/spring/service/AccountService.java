package com.spring.service;

import java.util.List;

import com.spring.domain.Customer_delete_requestVO;
import com.spring.domain.Customer_requestVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historySumVO;

public interface AccountService {
	public long balnce(String ano);

	public String getCno(String id);
	
	public DepositVO get_row(String ano);
	
	public List<DepositVO> cnoDeposit(int cno);
	
	public long cnoSumBalnce(int cno);
	
	public boolean create_customer_request(Customer_requestVO vo);

	public boolean create_customer_D_request(Customer_delete_requestVO vo);
	
	public Customer_delete_requestVO ano_deposit_customer(String ano);

	public Deposit_historySumVO sum_deposit_withdrawal(String ano);
	
	public boolean delete_account(String ano);
}
