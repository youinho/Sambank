package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Customer_requestVO {
	private String name;						//고객 성함
	private String eng_name;
	private String birth;						//고객 생일
	private String address;						//고객 주소
	private String mobile;						//고객 휴대폰번호
	private String id;							//아이디
//	private String password;					//비밀번호
	private String email;						//이메일
	private int type;
	private int product;
	private String visitAddress;
	private Date visitDate;					//회원가입 날짜

	private String confirm_password;
	

	
}
