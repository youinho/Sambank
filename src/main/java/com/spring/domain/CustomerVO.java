package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CustomerVO {
	
	private int cno;							//고객 번호
	private int rating;							//고객 신용도
	private String name;						//고객 성함
	private String gender;						//고객 성별
	private String birth;						//고객 생일
	private String resident_registration_no;	//고객 주민번호
	private String address;						//고객 주소
	private String mobile;						//고객 휴대폰번호
	private String id;							//아이디
	private String password;					//비밀번호
	private String passhint;					//비밀번호 힌트
	private String email;						//이메일
	private int withdrawal_limits;;				//최대 출금 한도
	private int check_card;						//카드 신청여부
	private Date createdate;					//회원가입 날짜
	
	
}
