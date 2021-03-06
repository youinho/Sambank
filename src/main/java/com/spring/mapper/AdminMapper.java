package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.AdminVO;
import com.spring.domain.Admin_groupVO;
import com.spring.domain.Admin_logVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Profile_imageVO;

import security.Admin_UserDetails;

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
	
	public int insertLog(Admin_logVO vo);
	public int insertLog_customer(Admin_logVO vo);
	public int saveImage(@Param("id") String id,@Param("profile_image") byte[] profile_image,@Param("profile_image_type") String profile_image_type);
	
	public Profile_imageVO get_profile_image(String id);
	
	
	
	//로그인 실패 카운트
	public int update_login_failure_count(String id);
	public int init_login_failure_count(String id);
	public int check_login_failure_count(String id);
	
	public int set_disabled(String id);
	
	
	public AdminVO get_group_authority(String id);
	public AdminVO get_authority(String id);
	public Admin_UserDetails security_get_admin(String id);
}
