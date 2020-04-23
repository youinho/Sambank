package com.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Criteria {
	private int pageNum;	//페이지 번호
	private int amount;		//한 페이지당 보여줄 게시물 수
	
	//검색과 관련된 정보 추가
	private String type;	//검색조건
	private String keyword;	//검색어 : TC, TCW..
	
	
	public Criteria() {
		this(1,10);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type==null?new String[] {} : type.split("");
	}
	
	
}
