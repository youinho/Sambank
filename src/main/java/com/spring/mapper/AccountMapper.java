package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.DepositVO;
import com.spring.domain.ProductVO;

public interface AccountMapper {
	public int create_deposit(DepositVO vo);
	
	public List<DepositVO> get_deposit_list();
	
	public int exists_deposit_ano(String ano);
	public List<ProductVO> getProduct(int type);
	public DepositVO getRow(String ano);
	
	public int update_withdraw(DepositVO vo);
	public int update_password(DepositVO vo);
	public String get_password(String ano);
	public int delete(DepositVO vo);
	public int get_balance(DepositVO vo);
}
