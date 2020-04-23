package com.spring.service;

import java.util.List;

import com.spring.domain.Acc_info;
import com.spring.domain.AdminVO;
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.domain.ProductVO;

public interface AdminService {
	public AdminVO selectOne(AdminVO vo);
	
	
	public boolean register_customer(CustomerVO vo);
	public List<DepositVO> get_deposit_list();
	public CustomerVO select_by_cno(int cno);
	public List<CustomerVO> search_customer(String name, String birth, String mobile);
	public boolean exists_deposit_ano(String ano);
	public boolean checkId(String id);
	
	
	
	
	
	
	
	//notice
	public List<Admin_noticeVO> notice_getList(Criteria cri);
	public int totalRows(Criteria cri);
	
	public boolean notice_insert(Admin_noticeVO vo);
	
	public Admin_noticeVO notice_getRow(int admin_bno);
	
	public boolean notice_delete(int admin_bno);
	
	public boolean notice_update(Admin_noticeVO vo);
	
	
	
	//account
	
	public List<ProductVO> acc_getProduct(int type);
	public boolean create_deposit(DepositVO vo);
	public List<Acc_info> select_acc_info(int cno);
	
	
}
