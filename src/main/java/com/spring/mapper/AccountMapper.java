package com.spring.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historyVO;
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
	public long get_balance(String ano);		//금액은 long으로 할것
	public String get_cno(String id);	//id로 cno가져오기
	public DepositVO check_ano(String ano);
	
	public int deposit_hist(Deposit_historyVO vo);
	public int withdraw_hist(Deposit_historyVO vo);
	public int updateBalance_after(Deposit_historyVO vo);
	
	public List<Deposit_historyVO> get_history(@Param("ano") String ano,@Param("start_date") Date start_date,@Param("end_date") Date end_date);
}
