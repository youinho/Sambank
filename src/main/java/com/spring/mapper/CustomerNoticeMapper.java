package com.spring.mapper;

import java.util.List;


import com.spring.domain.AttachFileDTO;
import com.spring.domain.Criteria;
import com.spring.domain.Customer_noticeVO;

public interface CustomerNoticeMapper {
	public List<Customer_noticeVO> getList(Criteria cri);
	public int getTotalCount(Criteria cri);
	public int insert(Customer_noticeVO vo);
	public Customer_noticeVO getRow(int notice_bno);
	public int delete(int notice_bno);
	public int update(Customer_noticeVO vo);
	
	
	
	public int insertFile(AttachFileDTO attach);
	
	//특정 첨부물 삭제
	public int deleteFile(int uuid);
	public List<AttachFileDTO> selectFile(String notice_bno);
	
	//전체 첨부물 삭제
	
	public int deleteAllFiles(String notice_bno);
	
	//어제 날짜의 첨부물 리스트
	public List<AttachFileDTO> getOldFiles();
	
	public AttachFileDTO get_oneFile(AttachFileDTO dto);
}
