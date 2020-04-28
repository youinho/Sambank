package com.spring.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

import com.spring.domain.CardVO;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SBValidator {
	public static final String REG_ID = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{5,12}$";
	public static final String REG_PWD = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,15}$";
	public static final String REG_EMAIL = "^([\\w-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
	public static final String REG_GENDER = "^[남,여]{1}$";
	public static final String REG_BIRTH = "^(19[0-9][0-9]|20\\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$";
	public static final String REG_MOBILE = "^01[0,1,6,7,9][0-9]{3,4}[0-9]{4}$";
	public static final String REG_NAME = "^[가-힣]{2,}$";
	public static final String REG_ENG_NAME = "^[A-Z,\\s]{3,}$";
	// -- account
	public static final String REG_ACC_PWD = "^[0-9]{4}$";
	public static final String REG_ACC_ANO = "^[1,2,3]{1}[0-9]{13}$";
	public static final String REG_ACC_TYPE = "^[1,2,3]{1}$";
	public static final String REG_ACC_PRODUCT = "^[1,2,3]{1}[0-9]{2}$";
	public static final String REG_ACC_WITHDRAW = "^[0-9]{1,12}$";
	// -- card
	public static final String REG_CARD_PWD = "^[0-9]{4}$";
	public static final String REG_CARD_LIMIT = "^[0-9]{1,12}$";
	public static final String REG_CARD_C_TYPE = "^[1,2,3][0-9]{2}$";
	public static final String REG_CARD_SECURITY_KEY = "^[0-9]{3}$";
	
	
	
	
	
	
	private boolean check(String reg, String value) {
		return Pattern.matches(reg, value);
	}
	
	public boolean check_customer(CustomerVO vo) {
		boolean check_email = true;
		boolean check_address = true;
		if(vo.getEmail().length()>30 || !check(REG_EMAIL, vo.getEmail()))
			check_email = false;
		
		if(vo.getAddress().length()>100)
			check_address = false;
		
		boolean[] check_list = new boolean[] {
				check(REG_ID, vo.getId()),
				check(REG_PWD, vo.getPassword()),
				check(REG_BIRTH, vo.getBirth()),
				check_email,
				check(REG_GENDER, vo.getGender()),
				check(REG_MOBILE, vo.getMobile()),
				check(REG_NAME, vo.getName()),
				check(REG_ENG_NAME, vo.getEng_name()),
				check_address
		};
		int i = 0;
		for(boolean b : check_list) {
			
			if(!b) {
				log.info("invalid : "+i);
				return false;
			}
			i++;
		}
		return true;
	}
	
	
	public boolean check_customer_update(CustomerVO vo) {
		boolean check_email = true;
		boolean check_address = true;
		if(vo.getEmail().length()>30 || !check(REG_EMAIL, vo.getEmail()))
			check_email = false;
		
		if(vo.getAddress().length()>100)
			check_address = false;
		
		boolean[] check_list = new boolean[] {
				check(REG_BIRTH, vo.getBirth()),
				check_email,
				check(REG_GENDER, vo.getGender()),
				check(REG_MOBILE, vo.getMobile()),
				check(REG_NAME, vo.getName()),
				check(REG_ENG_NAME, vo.getEng_name()),
				check_address
		};
		int i = 0;
		for(boolean b : check_list) {
			
			if(!b) {
				log.info("invalid : "+i);
				return false;
			}
			i++;
		}
		return true;
	}
	
	
	
	public boolean check_account_register(DepositVO vo) {
		log.info("vali_acc_reg");
		if(vo.getCno()==0)
			return false;
		
		boolean[] check_list = new boolean[] {
				check(REG_ACC_PWD, vo.getPassword()),
				check(REG_ACC_ANO, vo.getAno()),
				check(REG_ACC_TYPE, ""+vo.getType()),
				check(REG_ACC_PRODUCT, ""+vo.getProduct()),
				check(REG_ACC_WITHDRAW, ""+vo.getDay_withdraw()),
				check(REG_ACC_WITHDRAW, ""+vo.getMax_withdraw())
		};
		int i = 0;
		for(boolean b : check_list) {
			if(!b) {
				System.out.println("vali "+i);
				return false;
			}
		}
		return true;
	}
	
	public boolean check_account_update(DepositVO vo) {
		
		boolean[] check_list = new boolean[] {
				check(REG_ACC_ANO, vo.getAno()),
				check(REG_ACC_WITHDRAW, ""+vo.getDay_withdraw()),
				check(REG_ACC_WITHDRAW, ""+vo.getMax_withdraw())
		};
		
		
		for(boolean b : check_list)
			if(!b)	
				return false;
			
		return true;
			
	}
	
	public boolean check_card_register(CardVO vo) {
		log.info("vali card start");
		if(!vo.getPassword().equals(vo.getConfirm_password())) {
			log.info("password v");
			return false;
		}
		
		boolean[] check_list = new boolean[] {
				check(REG_CARD_PWD, vo.getPassword()),
				check(REG_CARD_LIMIT, ""+vo.getLimit()),
				check(REG_CARD_LIMIT, ""+vo.getLimit_month()),
				check(REG_CARD_C_TYPE, ""+vo.getC_type()),
				check(REG_CARD_SECURITY_KEY, ""+vo.getSecurity_key())

		};
		
		int i = 0;
		for(boolean b : check_list) {
			if(!b) {	
				System.out.println("vali"+i);
				return false;
			}
			i++;
		}	
		return true;
			
	}
//	public static void main(String[] args) {
//		SBValidator aa = new SBValidator();
//		System.out.println(aa.check(SBValidator.REG_EMAIL,"k..a@naver.com"));
//	}
	
}
