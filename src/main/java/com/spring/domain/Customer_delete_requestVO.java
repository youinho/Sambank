package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Customer_delete_requestVO {
	private String name;						//고객 성함
	private String birth;						//고객 생일
	private String id;							//아이디
	private String password;					//비밀번호
	private int type;
	private int product;
	private Date LastDate;					//회원가입 날짜

	private String confirm_password;
	

	
}
