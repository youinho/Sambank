package com.spring.mapper;

import java.util.List;

import com.spring.domain.InquiryVO;
import com.spring.domain.Inquiry_replyVO;

public interface InquiryMapper {
	
	
	public List<InquiryVO> getList();
	public List<InquiryVO> getList_by_answer(String answer_id);
	
	public InquiryVO getRow(String inquiry_no);
	
	public int charge_inquiry(InquiryVO vo);
	
	public List<Inquiry_replyVO> get_replyList(String inquiry_no);
	public int insert_reply(Inquiry_replyVO vo);
	
	
	public List<InquiryVO> getList_by_customer(String customer_id);
	
	public int insert_inquiry(InquiryVO vo);
	
	public int update_expdate(InquiryVO vo);
	public int set_expired();
	
}
