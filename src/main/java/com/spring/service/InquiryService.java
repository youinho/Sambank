package com.spring.service;

import java.util.List;

import com.spring.domain.InquiryVO;
import com.spring.domain.Inquiry_replyVO;

public interface InquiryService {
	
	public List<InquiryVO> getList();
	public List<InquiryVO> getList_by_answer(String answer_id);
	public InquiryVO getRow(String inquiry_no);
	
	public boolean charge_inquiry(InquiryVO vo);
	
	public List<Inquiry_replyVO> get_replyList(String inquiry_no);
	public boolean insert_reply(Inquiry_replyVO vo);
	
	
}
