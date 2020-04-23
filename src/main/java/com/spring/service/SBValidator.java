package com.spring.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

import com.spring.domain.CustomerVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SBValidator {
	public static final String REG_ID = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{5,12}$";
	public static final String REG_PWD = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,15}$";
	public static final String REG_EMAIL = "^([\\w-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
	public static final String REG_GENDER = "^[남,여]{1}$";
	public static final String REG_BIRTH = "^(19[0-9][0-9]|20\\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$";
	public static final String REG_REGNO = "^[1-4][0-9]{6}$";
	public static final String REG_MOBILE = "^01[0,1,6,7,9][0-9]{3,4}[0-9]{4}$";
	
	public static final String REG_NAME = "^[가-힣]{2,}$";
	public static final String REG_ENG_NAME = "^[A-Z,\\s]{3,}$";
	
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
				check(REG_REGNO, vo.getReg_no()),
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
//		boolean check_id = check(REG_ID, vo.getId());
//		boolean check_pwd = check(REG_PWD, vo.getPassword());
//		boolean check_birth = check(REG_BIRTH, vo.getBirth());
//		boolean check_email = check(REG_EMAIL, vo.getEmail());
//		boolean check_gender = check(REG_GENDER, vo.getGender());
//		boolean check_regno = check(REG_REGNO, vo.getReg_no());
//		boolean check_mobile = check(REG_MOBILE, vo.getMobile());
		
		
		return true;
	}
	
//	public static void main(String[] args) {
//		SBValidator aa = new SBValidator();
//		System.out.println(aa.check(SBValidator.REG_EMAIL,"k..a@naver.com"));
//	}
	
}
