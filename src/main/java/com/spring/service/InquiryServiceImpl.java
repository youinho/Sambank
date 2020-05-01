package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.InquiryVO;
import com.spring.mapper.InquiryMapper;
@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	InquiryMapper i_mapper;
	
	@Override
	public List<InquiryVO> getList() {
	
		return i_mapper.getList();
	}

	@Override
	public List<InquiryVO> getList_by_answer(String answer_id) {

		return i_mapper.getList_by_answer(answer_id);
	}

	@Override
	public InquiryVO getRow(String inquiry_no) {

		return i_mapper.getRow(inquiry_no);
	}

	@Override
	public boolean charge_inquiry(InquiryVO vo) {

		return i_mapper.charge_inquiry(vo)==1;
	}

}
