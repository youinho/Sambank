package com.spring.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.CardVO;
import com.spring.domain.CustomerVO;
import com.spring.email.Email;
import com.spring.email.EmailSender;
import com.spring.mapper.CardMapper;
import com.spring.mapper.CustomerMapper;

import security.Customer_UserDetails;
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private CustomerMapper customerMapper;
	@Autowired
	private CardMapper cardMapper;
	

	@Autowired
	private EmailSender emailSender;
	
	@Override
	public boolean update_login_failure_count(String id) {

		return customerMapper.update_login_failure_count(id)==1;
	}

	@Override
	public boolean init_login_failure_count(String id) {

		return customerMapper.init_login_failure_count(id)==1;
	}

	@Override
	public int check_login_failure_count(String id) {

		return customerMapper.check_login_failure_count(id);
	}

	@Override
	public boolean set_disabled(String id) {

		return customerMapper.set_disabled(id)==1;
	}

	@Override
	public Customer_UserDetails security_get_customer(String id) {

		return customerMapper.security_get_customer(id);
	}

	@Override
	public boolean insert_locked_customer(String id) {

		return customerMapper.insert_locked_customer(id)==1;
	}

	@Override
	public boolean delete_locked_customer(String id) {
		
		return customerMapper.delete_locked_customer(id)==1;
	}

	@Override
	public boolean set_enabled(String id) {

		return customerMapper.set_enabled(id)==1;
	}

	@Override
	public List<CustomerVO> select_to_unlock() {

		return customerMapper.select_to_unlock();
	}

	@Transactional
	@Override
	public boolean unlock_customer(String id) {
		if(customerMapper.set_enabled(id)==1) {
			if(customerMapper.delete_locked_customer(id)==1) {
				return true;
			};
		}
		return false;
	}
	
	@Transactional
	@Override
	public boolean lock_customer(String id) {
		
		if(customerMapper.set_disabled(id)==1) {
			if(customerMapper.insert_locked_customer(id)==1) {
				if(customerMapper.init_login_failure_count(id)==1) {
					return true;					
				}
			}
		}
		
		
		return false;
	}

	@Override
	public boolean insert_verifyKey(CustomerVO vo) {

		return customerMapper.insert_verifyKey(vo)==1;
	}

	@Override
	public boolean set_verified(CustomerVO vo) {

		return customerMapper.set_verified(vo)==1;
	}

	@Override
	public boolean update_sendcount(String id) {

		return customerMapper.update_sendCount(id)==1;
	}

	@Override
	public boolean reset_sendcount() {

		return customerMapper.reset_sendCount()>0;
	}

	@Override
	public String get_password(String id) {

		return customerMapper.get_password(id);
	}

	
	@Transactional
	@Override
	public boolean send_tmpPassword(CustomerVO vo) {
		
		CustomerVO info_vo = customerMapper.select_by_id(vo.getId());
		
		String password = randomPw();
		if(info_vo!=null) {
			if(info_vo.getSendCount()<10) {
				if(vo.getEmail().equals(info_vo.getEmail())) {
					vo.setPassword(passwordEncoder.encode(password));
					customerMapper.update_password(vo);
					send_tmpPass(vo.getId(), vo.getEmail(), password);
					return true;
				}
			}
		}
		
		return false;
	}
	
	
	
	
	
	
	public String randomPw(){
	      char pwCollection[] = new char[] {
	                        '1','2','3','4','5','6','7','8','9','0',
	                        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
	                        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
	                        '!','@','#','$','%','^','&','*','(',')'};//배열에 선언

	      String ranPw = "";

	      for (int i = 0; i < 12; i++) {
	        int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다.
	        ranPw += pwCollection[selectRandomPw];
	      }
	    return ranPw;
	}
	
	
	
	public boolean send_tmpPass(String id,String customer_email, String password) {
		Email email = new Email();
		String content = "";
		content += id+" 아이디의 임시 비밀번호를 보내드립니다.\n";
		content += "임시 비밀번호 : "+password;
		content += "\n본인이 요청한 작업이 아닐 경우 즉시 삼뱅크 관리자에게 신고해 주세요.\n감사합니다.";
		
		email.setSubject("SamBank Tmp Password - 삼뱅크 임시 비밀번호 발급 ");
		email.setContent(content);
		email.setReceiver(customer_email);
		try {
			emailSender.SendEmail(email);
			customerMapper.update_sendCount(id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		
	}

	@Override
	public boolean delete_by_id(String id) {

		return customerMapper.delete_by_id(id)==1;
	}

	@Override
	public boolean request_card(CardVO vo) {

		return cardMapper.request_card(vo)==1;
	}

	

	
	
	
	
	
	
	
	
	
	
}
