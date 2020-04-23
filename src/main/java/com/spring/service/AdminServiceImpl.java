package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.mapper.AccountMapper;
import com.spring.mapper.AdminMapper;
import com.spring.mapper.AdminNoticeMapper;
import com.spring.mapper.CustomerMapper;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	CustomerMapper customerMapper;
	
	@Autowired
	AccountMapper accountMapper;
	
	@Autowired
	AdminNoticeMapper noticeMapper;
	
	
	@Override
	public AdminVO selectOne(AdminVO vo) {
	
		return adminMapper.selectOne(vo);
	}


	@Override
	public boolean create_deposit(int cno, String ano) {

		return accountMapper.create_deposit(cno, ano)==1;
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
	
}
