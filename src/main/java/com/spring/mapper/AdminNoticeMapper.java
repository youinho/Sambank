package com.spring.mapper;

import java.util.List;

import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Criteria;

public interface AdminNoticeMapper {
	public List<Admin_noticeVO> getList(Criteria cri);
	public int getTotalCount(Criteria cri);
}