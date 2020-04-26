package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.Acc_info;
import com.spring.domain.AdminVO;
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.domain.ProductVO;
import com.spring.mapper.AccountMapper;
import com.spring.mapper.AdminMapper;
import com.spring.mapper.AdminNoticeMapper;
import com.spring.mapper.CustomerMapper;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private AccountMapper accountMapper;
	
	@Autowired
	private AdminNoticeMapper noticeMapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public AdminVO selectOne(AdminVO vo) {
	
		return adminMapper.selectOne(vo);
	}


	@Override
	public boolean create_deposit(DepositVO vo) {

		return accountMapper.create_deposit(vo)==1;
	}


	@Override
	public boolean register_customer(CustomerVO vo) {

		return customerMapper.register_customer(vo)==1;
	}


	@Override
	public List<DepositVO> get_deposit_list() {

		return accountMapper.get_deposit_list();
	}
	@Override
	public CustomerVO select_by_cno(int cno) {

		return customerMapper.select_by_cno(cno);
	}


	@Override
	public List<CustomerVO> search_customer(String name, String birth, String mobile) {
		
		
		
		return customerMapper.search_customer(name, birth, mobile);
	}


	@Override
	public boolean exists_deposit_ano(String ano) {

		return accountMapper.exists_deposit_ano(ano)>0;
	}


	@Override
	public boolean checkId(String id) {

		return customerMapper.checkId(id)>0;
	}


	@Override
	public List<Admin_noticeVO> notice_getList(Criteria cri) {

		return noticeMapper.getList(cri);
	}


	@Override
	public int totalRows(Criteria cri) {

		return noticeMapper.getTotalCount(cri);
	}


	@Override
	public boolean notice_insert(Admin_noticeVO vo) {

		return noticeMapper.insert(vo)==1;
	}


	@Override
	public Admin_noticeVO notice_getRow(int admin_bno) {

		return noticeMapper.getRow(admin_bno);
	}
	
	@Override
	public boolean notice_delete(int admin_bno) {
	
		return noticeMapper.delete(admin_bno)==1;
	}


	@Override
	public boolean notice_update(Admin_noticeVO vo) {

		return noticeMapper.update(vo)==1;
	}
	
	
	
	@Override
	public List<ProductVO> acc_getProduct(int type) {
	
		return accountMapper.getProduct(type);
	}


	@Override
	public List<Acc_info> select_acc_info(int cno) {

		return customerMapper.select_acc_info(cno);
	}
	
	@Override
	public boolean update_customer(CustomerVO vo) {
	
		return customerMapper.update_customer(vo)==1;
	}
	
	@Override
	public DepositVO get_deposit(String ano) {
	
		return accountMapper.getRow(ano);
	}


	@Override
	public boolean update_withdraw(DepositVO vo) {

		return accountMapper.update_withdraw(vo)==1;
	}


	@Override
	public boolean update_password(DepositVO vo) {

		return accountMapper.update_password(vo)==1;
	}


	@Override
	public boolean delete_customer(CustomerVO vo) {

		return customerMapper.delete_customer(vo)==1;
	}


	@Override
	public boolean check_deposit_password(DepositVO vo) {
		
		
		
		
		
		return passwordEncoder.matches(vo.getPassword(), accountMapper.get_password(vo.getAno()));
	}


	@Override
	public boolean check_customer_password(DepositVO vo) {

		return passwordEncoder.matches(vo.getPassword(), customerMapper.get_password(vo.getPassword()));
	}
	
}
