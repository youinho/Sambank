package com.spring.mapper;

import java.util.List;

import com.spring.domain.InquiryVO;

public interface InquiryMapper {
	
	
	public List<InquiryVO> getList();
	public List<InquiryVO> getList_by_answer(String answer_id);
	
	public InquiryVO getRow(String inquiry_no);
	
	public int charge_inquiry(InquiryVO vo);
	
}
