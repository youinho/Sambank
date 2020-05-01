package com.spring.service;

import java.util.List;


import com.spring.domain.AttachFileDTO;
import com.spring.domain.Criteria;
import com.spring.domain.Customer_noticeVO;

public interface CustomerNoticeService {
	public List<Customer_noticeVO> notice_getList(Criteria cri);
	public int totalRows(Criteria cri);
	
	public boolean notice_insert(Customer_noticeVO vo);
	
	public Customer_noticeVO notice_getRow(int notice_bno);
	
	public boolean notice_delete(int notice_bno);
	
	public boolean notice_update(Customer_noticeVO vo);
	
	public List<AttachFileDTO> getAttachList(String notice_bno);
	public AttachFileDTO get_oneFile(AttachFileDTO dto);
}
