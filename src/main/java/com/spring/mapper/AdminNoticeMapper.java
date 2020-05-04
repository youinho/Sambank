package com.spring.mapper;

import java.util.List;

import com.spring.domain.Admin_noticeVO;
import com.spring.domain.AttachFileDTO;
import com.spring.domain.Criteria;

public interface AdminNoticeMapper {
	public List<Admin_noticeVO> getList(Criteria cri);
	public int getTotalCount(Criteria cri);
	public int insert(Admin_noticeVO vo);
	public Admin_noticeVO getRow(int admin_bno);
	public int delete(int admin_bno);
	public int update(Admin_noticeVO vo);
	
	
	
	public int insertFile(AttachFileDTO attach);
	
	//특정 첨부물 삭제
	public int deleteFile(int uuid);
	public List<AttachFileDTO> selectFile(String admin_bno);
	
	//전체 첨부물 삭제
	
	public int deleteAllFiles(String admin_bno);
	
	//어제 날짜의 첨부물 리스트
	public List<AttachFileDTO> getOldFiles();
	
	public AttachFileDTO get_oneFile(AttachFileDTO dto);
}
