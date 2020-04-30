package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_groupVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;

public interface AdminMapper {
	public AdminVO selectOne(String id);
	
	public String get_password(String id);
	
	public List<AdminVO> search_admins(AdminVO vo);
	
	public int get_groupID(String id);
	
	public AdminVO get_adminInfo(String id);
	
	public List<Admin_groupVO> get_groupList(String id);
	
	public int admin_update_password(AdminVO vo);
	
	public int insert_admin(AdminVO vo);
	public int insert_admin_group(AdminVO vo);
	
	public int update_admin(AdminVO vo);
	public int update_admin_member(AdminVO vo);
	
	public int check_adminId(String id);
	
	
	
	
	
}
