package com.spring.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.Acc_info;
import com.spring.domain.AdminVO;
import com.spring.domain.Admin_groupVO;
import com.spring.domain.Admin_logVO;
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
import com.spring.domain.Profile_imageVO;
import com.spring.email.Email;
import com.spring.email.EmailSender;
import com.spring.mapper.AccountMapper;
import com.spring.mapper.AdminMapper;
import com.spring.mapper.AdminNoticeMapper;
import com.spring.mapper.CardMapper;
import com.spring.mapper.CustomerMapper;

import security.Admin_UserDetails;

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
	

	@Autowired
	private EmailSender emailSender;
	
	
	@Override
	public AdminVO selectOne(String id) {
	
		return adminMapper.selectOne(id);
	}


	@Override
	public boolean create_deposit(DepositVO vo) {

		return accountMapper.create_deposit(vo)==1;
	}

	@Transactional
	@Override
	public boolean register_customer(CustomerVO vo) {
		if(customerMapper.register_customer(vo)==1) {
			return send_verify_mail(vo);
		}
		
		
		return false;
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
	@Transactional
	@Override
	public boolean notice_delete(int admin_bno) {
		boolean result = true;
		noticeMapper.deleteAllFiles(""+admin_bno);
		result = noticeMapper.delete(admin_bno)==1;
		
		
		
		return result;
	}


	@Transactional
	@Override
	public boolean notice_update(Admin_noticeVO vo) {

		boolean modifyresult = noticeMapper.update(vo)==1;
		
		
		noticeMapper.deleteAllFiles(vo.getAdmin_bno());
		if(vo.getAttachList() != null) {
			if(modifyresult && vo.getAttachList().size() > 0) {
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
	public boolean check_customer_password(CustomerVO vo) {

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


	@Override
	public boolean insertLog(Admin_logVO vo) {

		return adminMapper.insertLog(vo)==1;
	}


	@Override
	public boolean saveImage(String id, byte[] profile_image, String profile_image_type) {

		return adminMapper.saveImage(id, profile_image, profile_image_type)==1;
	}


	@Override
	public Profile_imageVO get_profile_image(String id) {

		return adminMapper.get_profile_image(id);
	}


	@Override
	public CustomerVO select_by_id(String id) {

		return customerMapper.select_by_id(id);
	}


	@Override
	public boolean customer_update_password(CustomerVO vo) {

		return customerMapper.update_password(vo)==1;
	}


	@Override
	public boolean update_login_failure_count(String id) {

		return adminMapper.update_login_failure_count(id)==1;
	}


	@Override
	public boolean init_login_failure_count(String id) {

		return adminMapper.init_login_failure_count(id)==1;
	}


	@Override
	public int check_login_failure_count(String id) {

		return adminMapper.check_login_failure_count(id);
	}
	
	
	@Override
	public boolean set_disabled(String id) {
	
		return adminMapper.set_disabled(id)==1;
	}


	@Override
	public AdminVO get_group_authority(String id) {
		
		return adminMapper.get_group_authority(id);
	}


	@Override
	public Admin_UserDetails security_get_admin(String id) {

		return adminMapper.security_get_admin(id);
	}
	
	@Override
	public AdminVO get_authority(String id) {
	
		return adminMapper.get_authority(id);
	}
	
	
	
	
	
	
	
	
	public boolean send_verify_mail(CustomerVO vo) {
		
		Email email = new Email();
		String key = UUID.randomUUID().toString();
		vo.setVerifyKey(key);
		if(customerMapper.insert_verifyKey(vo)==1) {
			
			String link = "https://sambank.net/verify_email?id="+vo.getId()+"&verifyKey="+key;
			String content = "";
			content += vo.getName()+" 님의 가입을 진심으로 감사드립니다.\n";
			content += "이 메일을 받으셨다면 아래의 링크를 클릭하여\n";
			content += "이메일 인증을 완료할 수 있습니다.\n";
			content += link+"";
			
			email.setSubject("SamBank Email Verification - 삼뱅크 이메일 인증 ");
			email.setContent(content);
			email.setReceiver(vo.getEmail());
			try {
				emailSender.SendEmail(email);
				customerMapper.update_sendCount(vo.getId());
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			return true;
		}
		
		return false;
	}
	
	@Override
	public List<CardVO> select_card_requested() {

		return cardMapper.select_card_requested();
	}


	@Override
	public boolean set_card_request(String card_no) {

		return cardMapper.set_request(card_no)==1;
	}


	@Override
	public int get_history_total(String ano, Date start_date, Date end_date) {

		return accountMapper.get_history_total(ano, start_date, end_date);
	}


	@Override
	public List<Deposit_historyVO> get_history_limit(String ano, Date start_date, Date end_date, int list_count) {

		return accountMapper.get_history_limit(ano, start_date, end_date, list_count);
	}


	@Override
	public boolean insertLog_customer(Admin_logVO vo) {

		return adminMapper.insertLog_customer(vo)==1;
	}
	
}
