package com.spring.service;

import java.util.List;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;

public interface AdminService {
	public AdminVO selectOne(AdminVO vo);
	
	public boolean create_deposit(int cno, String ano);
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
	
}
