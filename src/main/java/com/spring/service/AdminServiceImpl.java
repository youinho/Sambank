package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;
	
	
	@Override
	public AdminVO selectOne(AdminVO vo) {
	
		return adminMapper.selectOne(vo);
	}


	@Transactional
	@Override
	public void register(String num) {
		Admin_registerVO vo = new Admin_registerVO();
		vo.setAno(num);
		vo.setCno(num);
		vo.setSno(num);
		adminMapper.register_account(num);
		adminMapper.insert_account(vo);
	}


	@Override
	@Transactional
	public int test(int value) {
		adminMapper.test2(value);
		adminMapper.test1(value);
		return 0;
	}


	@Override
	public boolean create_deposit(int cno, String ano) {

		return adminMapper.create_deposit(cno, ano)==1;
	}


	@Override
	public boolean register_customer(CustomerVO vo) {

		return adminMapper.register_customer(vo)==1;
	}


	@Override
	public List<DepositVO> get_deposit_list() {

		return adminMapper.get_deposit_list();
	}
	@Override
	public CustomerVO select_by_cno(int cno) {

		return adminMapper.select_by_cno(cno);
	}


	@Override
	public List<CustomerVO> search_customer(String name, String birth, String mobile) {
		
		
		
		return adminMapper.search_customer(name, birth, mobile);
	}


	@Override
	public boolean exists_deposit_ano(String ano) {

		return adminMapper.exists_deposit_ano(ano)>0;
	}
	
}
