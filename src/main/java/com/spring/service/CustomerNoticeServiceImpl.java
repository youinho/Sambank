package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.spring.domain.AttachFileDTO;
import com.spring.domain.Criteria;
import com.spring.domain.Customer_noticeVO;
import com.spring.mapper.AccountMapper;
import com.spring.mapper.AdminMapper;

import com.spring.mapper.CardMapper;
import com.spring.mapper.CustomerMapper;
import com.spring.mapper.CustomerNoticeMapper;
@Service
public class CustomerNoticeServiceImpl implements CustomerNoticeService {
	
	

	@Autowired
	private CustomerNoticeMapper noticeMapper;
	
	
	
	
	@Override
	public List<Customer_noticeVO> notice_getList(Criteria cri) {

		return noticeMapper.getList(cri);
	}


	@Override
	public int totalRows(Criteria cri) {

		return noticeMapper.getTotalCount(cri);
	}


	@Override
	public boolean notice_insert(Customer_noticeVO vo) { 
		if(noticeMapper.insert(vo)!=1) {
			return false;
		}
		
		//첨부파일이 null이 아니면 첨부파일 등록
		if(vo.getAttachList() == null ||vo.getAttachList().size() <= 0) {
			return true;
		}
		
		vo.getAttachList().forEach(attach1 ->{
			
			attach1.setNotice_bno(vo.getNotice_bno());
			noticeMapper.insertFile(attach1);
			
		});
		return true;
	}


	@Override
	public Customer_noticeVO notice_getRow(int notice_bno) {

		return noticeMapper.getRow(notice_bno);
	}
	@Transactional
	@Override
	public boolean notice_delete(int notice_bno) {
		boolean result = true;
		noticeMapper.deleteAllFiles(""+notice_bno);
		result = noticeMapper.delete(notice_bno)==1;
		
		
		
		return result;
	}


	@Transactional
	@Override
	public boolean notice_update(Customer_noticeVO vo) {

		boolean modifyresult = noticeMapper.update(vo)==1;
		
		
		noticeMapper.deleteAllFiles(vo.getNotice_bno());
		if(vo.getAttachList() != null) {
			if(modifyresult && vo.getAttachList().size() > 0) {
				for(AttachFileDTO dto : vo.getAttachList()) {
					dto.setNotice_bno(vo.getNotice_bno());
					noticeMapper.insertFile(dto);
				}
			}
		}
		return modifyresult;
	}
	
	
	
	
	@Override
	public List<AttachFileDTO> getAttachList(String notice_bno) {

		return noticeMapper.selectFile(notice_bno);
	}


	@Override
	public AttachFileDTO get_oneFile(AttachFileDTO dto) {

		return noticeMapper.get_oneFile(dto);
	}


}
