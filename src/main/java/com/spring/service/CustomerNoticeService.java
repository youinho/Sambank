package com.spring.service;

import java.util.List;


import com.spring.domain.AttachFileDTO;
import com.spring.domain.Criteria;
import com.spring.domain.Customer_noticeVO;

public interface CustomerNoticeService {
	
	public List<Customer_noticeVO> notice_getList(Criteria cri);
	//리스트 출력문
	public int totalRows(Criteria cri);
	
	public boolean notice_insert(Customer_noticeVO vo);
	//게시글 추가
	public Customer_noticeVO notice_getRow(int notice_bno);
	//bno로 select 
	public boolean notice_delete(int notice_bno);
	//삭제
	public boolean notice_update(Customer_noticeVO vo);
	//수정
	public List<AttachFileDTO> getAttachList(String notice_bno);
	//어제 날짜의 첨부파일 목록 가져오기
	public AttachFileDTO get_oneFile(AttachFileDTO dto);
	//uuid,파일찾기 구문
}
