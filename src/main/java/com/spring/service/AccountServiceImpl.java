package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Customer_delete_requestVO;
import com.spring.domain.Customer_requestVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historySumVO;
import com.spring.mapper.AccountMapper;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountMapper mapper;
	
	
	@Override
	public long balnce(String ano) {
		// TODO Auto-generated method stub
		return mapper.get_balance(ano);
	}
	
	@Override
	public String getCno(String id) {
		return mapper.get_cno(id);
	}
	
	@Override
	public DepositVO get_row(String ano) {
		return mapper.getRow(ano);
	}
	
	@Override
	public List<DepositVO> cnoDeposit(int cno) {
		return mapper.cno_deposit(cno);
	}
	
	@Override
	public long cnoSumBalnce(int cno) {
		return mapper.cno_sumBalance(cno);
	}
	
	@Override
	public boolean create_customer_request(Customer_requestVO vo) {

		return mapper.create_customer_request(vo)==1;
	}
	
	@Override
	public Customer_delete_requestVO ano_deposit_customer(String ano) {
		return mapper.ano_deposit_customer(ano);
	}

	@Override
	public boolean create_customer_D_request(Customer_delete_requestVO vo) {
		return mapper.create_customer_D_request(vo)==1;
	}

	@Override
	public Deposit_historySumVO sum_deposit_withdrawal(String ano) {
		// TODO Auto-generated method stub
		return mapper.sum_deposit_withdrawal(ano);
	}

	
	
	
}
