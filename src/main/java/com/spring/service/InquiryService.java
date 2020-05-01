package com.spring.service;

import java.util.List;

import com.spring.domain.InquiryVO;

public interface InquiryService {
	
	public List<InquiryVO> getList();
	public List<InquiryVO> getList_by_answer(String answer_id);
	public InquiryVO getRow(String inquiry_no);
	
	public boolean charge_inquiry(InquiryVO vo);
	
}
