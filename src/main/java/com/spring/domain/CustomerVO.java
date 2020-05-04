package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CustomerVO {
	
	private int cno;							//고객 번호
	private String name;						//고객 성함
	private String eng_name;
	private String gender;						//고객 성별
	private String birth;						//고객 생일
	private String address;						//고객 주소
	private String mobile;						//고객 휴대폰번호
	private String id;							//아이디
	private String password;					//비밀번호
	private String email;						//이메일
	private Date createdate;					//회원가입 날짜
	private Date updatedate;
	
	private String confirm_password;
	/*public boolean isPasswordEqualToConfirmPassword() {
		return this.password.equals(passhint);
	}*/
}
