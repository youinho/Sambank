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
}
