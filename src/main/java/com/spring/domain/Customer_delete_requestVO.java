package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class Customer_delete_requestVO {
	private String name;						//고객 성함
	private String birth;						//고객 생일
	private String id;							//아이디
	private String ano;							//계좌번호
	private long balance;						//계좌잔액
	private String password;					//비밀번호
	private int type;							//계좌타입
	private String p_name;						//상품종류
	private Date createDate;					//계좌생성 날짜

	private String confirm_password;
	

	
}
