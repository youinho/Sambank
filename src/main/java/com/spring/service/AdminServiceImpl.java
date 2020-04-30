package com.spring.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.Acc_info;
import com.spring.domain.AdminVO;
import com.spring.domain.Admin_groupVO;
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.AttachFileDTO;
import com.spring.domain.CardVO;
import com.spring.domain.Card_conditionVO;
import com.spring.domain.Card_productVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historyVO;
import com.spring.domain.ProductVO;
import com.spring.mapper.AccountMapper;
import com.spring.mapper.AdminMapper;
import com.spring.mapper.AdminNoticeMapper;
import com.spring.mapper.CardMapper;
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
	
	@Autowired
	private CardMapper cardMapper;
	
	@Override
	public AdminVO selectOne(String id) {
	
		return adminMapper.selectOne(id);
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
		if(noticeMapper.insert(vo)!=1) {
			return false;
		}
		
		//첨부파일이 null이 아니면 첨부파일 등록
		if(vo.getAttachList() == null ||vo.getAttachList().size() <= 0) {
			return true;
		}
		
		vo.getAttachList().forEach(attach1 ->{
			attach1.setAdmin_bno(vo.getAdmin_bno());
			noticeMapper.insertFile(attach1);
			
		});
		return true;
	}


	@Override
	public Admin_noticeVO notice_getRow(int admin_bno) {

		return noticeMapper.getRow(admin_bno);
	}
	
	@Override
	public boolean notice_delete(int admin_bno) {
		boolean result = true;
		if(noticeMapper.deleteAllFiles(""+admin_bno)==1) {
			result = noticeMapper.delete(admin_bno)==1;
		}
		
		
		return result;
	}


	@Transactional
	@Override
	public boolean notice_update(Admin_noticeVO vo) {

		boolean modifyresult = noticeMapper.update(vo)==1;
		
		
		if(vo.getAttachList() != null) {
			if(modifyresult && vo.getAttachList().size() > 0) {
				noticeMapper.deleteAllFiles(vo.getAdmin_bno());
				for(AttachFileDTO dto : vo.getAttachList()) {
					dto.setAdmin_bno(vo.getAdmin_bno());
					noticeMapper.insertFile(dto);
				}
			}
		}
		return modifyresult;
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


	@Override
	public boolean check_admin_password(AdminVO vo) {

		return passwordEncoder.matches(vo.getPassword(), adminMapper.get_password(vo.getId()));
	}


	@Override
	public boolean delete_deposit(DepositVO vo) {
		if(accountMapper.get_balance(vo.getAno())!=0)
			return false;
		
		
		return accountMapper.delete(vo)==1;
	}


	@Override
	public DepositVO check_ano(String ano) {

		return accountMapper.check_ano(ano);
	}

	@Transactional
	@Override
	public boolean deposit(Deposit_historyVO vo) {
		
		if(accountMapper.deposit_hist(vo)!=1) {
			return false;
		}
		if(accountMapper.updateBalance_after(vo)!=1) {
			return false;
		}
		
		
		return true;
	}

	@Transactional
	@Override
	public boolean withdraw(Deposit_historyVO vo) {

		if((accountMapper.get_balance(vo.getAno())-vo.getBalance())<0) {
			return false;
		}
		
		
		if(accountMapper.withdraw_hist(vo)!=1) {
			return false;
		}
		if(accountMapper.updateBalance_after(vo)!=1) {
			return false;
		}
		return true;
	}


	@Override
	public List<Card_productVO> get_card_product() {

		return cardMapper.get_product();
	}


	@Override
	public int check_card_no(String card_no) {

		return cardMapper.check_card_no(card_no);
	}


	@Override
	public List<CardVO> get_cardList_by_ano(String ano) {

		return cardMapper.get_cardList(ano);
	}


	@Override
	public boolean register_card(CardVO vo) {
		
		return cardMapper.register_card(vo)==1;
	}


	@Override
	public CardVO get_cardInfo(String card_no) {

		return cardMapper.get_cardInfo(card_no);
	}


	@Override
	public List<Card_conditionVO> get_condition() {

		return cardMapper.get_condition();
	}


	@Override
	public boolean update_card_password(CardVO vo) {

		return cardMapper.update_password(vo)==1;
	}


	@Override
	public boolean update_cardInfo(CardVO vo) {

		return cardMapper.update_cardInfo(vo)==1;
	}


	@Override
	public List<AdminVO> get_admins(AdminVO vo) {

		return adminMapper.search_admins(vo);
	}


	@Override
	public int get_groupID(String id) {

		return adminMapper.get_groupID(id);
	}


	@Override
	public AdminVO get_adminInfo(String id) {

		return adminMapper.get_adminInfo(id);
	}


	@Override
	public List<Admin_groupVO> get_groupList(String id) {

		return adminMapper.get_groupList(id);
	}


	@Override
	public boolean admin_update_password(AdminVO vo) {

		return adminMapper.admin_update_password(vo)==1;
	}

	@Transactional
	@Override
	public boolean admin_insert(AdminVO vo) {
		if(adminMapper.insert_admin(vo)==1) {
			if(adminMapper.insert_admin_group(vo)==1) {
				return true;
			}
		}
		
		
		return false;
	}

	@Transactional
	@Override
	public boolean update_admin(AdminVO vo) {
		
		if(adminMapper.update_admin(vo)==1) {
			if(adminMapper.update_admin_member(vo)==1) {
				return true;
			}
		}
		
		
		
		return false;
	}


	@Override
	public boolean check_adminId(String id) {

		return adminMapper.check_adminId(id)>0;
	}


	@Override
	public List<Deposit_historyVO> get_history(String ano, Date start_date, Date end_date) {

		return accountMapper.get_history(ano, start_date, end_date);
	}


	@Override
	public List<AttachFileDTO> getAttachList(String admin_bno) {

		return noticeMapper.selectFile(admin_bno);
	}


	@Override
	public AttachFileDTO get_oneFile(AttachFileDTO dto) {

		return noticeMapper.get_oneFile(dto);
	}
	
}
