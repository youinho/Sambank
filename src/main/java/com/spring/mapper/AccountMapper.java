package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.DepositVO;

public interface AccountMapper {
	public int create_deposit(@Param("cno") int cno,@Param("ano") String ano);
	
	public List<DepositVO> get_deposit_list();
	
	public int exists_deposit_ano(String ano);
	
}
