package com.spring.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.Acc_info;
import com.spring.domain.AdminVO;
import com.spring.domain.Admin_groupVO;
import com.spring.domain.Admin_logVO;
import com.spring.domain.Admin_noticeVO;
import com.spring.domain.Admin_registerVO;
import com.spring.domain.AttachFileDTO;
import com.spring.domain.CardVO;
import com.spring.domain.Card_conditionVO;
import com.spring.domain.Card_productVO;
import com.spring.domain.Criteria;
import com.spring.domain.CustomerVO;
import com.spring.domain.DepositVO;
import com.spring.domain.Deposit_historyVO;
import com.spring.domain.ProductVO;
import com.spring.domain.Profile_imageVO;

public interface AdminService {
	public AdminVO selectOne(String id);
	
	public boolean check_admin_password(AdminVO vo);
	public List<AdminVO> get_admins(AdminVO vo);
	public int get_groupID(String id);
	public AdminVO get_adminInfo(String id);
	public List<Admin_groupVO> get_groupList(String id);
	public boolean admin_update_password(AdminVO vo);
	public boolean admin_insert(AdminVO vo);
	public boolean update_admin(AdminVO vo);
	public boolean check_adminId(String id);
	public boolean insertLog(Admin_logVO vo);
	
	
	public boolean saveImage(String id, byte[] profile_image);
	
	public Profile_imageVO get_profile_image(String id);
	
	
	public boolean register_customer(CustomerVO vo);
	public List<DepositVO> get_deposit_list();
	public CustomerVO select_by_cno(int cno);
	public List<CustomerVO> search_customer(String name, String birth, String mobile);
	public boolean exists_deposit_ano(String ano);
	public boolean checkId(String id);
	
	public boolean update_customer(CustomerVO vo);
	public boolean delete_customer(CustomerVO vo);
	
	public boolean check_deposit_password(DepositVO vo);
	public boolean delete_deposit(DepositVO vo);
	
	//notice
	public List<Admin_noticeVO> notice_getList(Criteria cri);
	public int totalRows(Criteria cri);
	
	public boolean notice_insert(Admin_noticeVO vo);
	
	public Admin_noticeVO notice_getRow(int admin_bno);
	
	public boolean notice_delete(int admin_bno);
	
	public boolean notice_update(Admin_noticeVO vo);
	
	public List<AttachFileDTO> getAttachList(String admin_bno);
	public AttachFileDTO get_oneFile(AttachFileDTO dto);
	
	//account
	
	public List<ProductVO> acc_getProduct(int type);
	public boolean create_deposit(DepositVO vo);
	public List<Acc_info> select_acc_info(int cno);
	
	public DepositVO get_deposit(String ano);
	

	public boolean update_withdraw(DepositVO vo);
	public boolean update_password(DepositVO vo);
	public boolean check_customer_password(DepositVO vo);
	public DepositVO check_ano(String ano);
	
	public boolean deposit(Deposit_historyVO vo);
	public boolean withdraw(Deposit_historyVO vo);
	
	public List<Deposit_historyVO> get_history(String ano, Date start_date, Date end_date);
	
	
	//card
	public List<Card_productVO> get_card_product();
	public int check_card_no(String card_no);
	public List<CardVO> get_cardList_by_ano(String ano);
	public boolean register_card(CardVO vo);
	public CardVO get_cardInfo(String card_no);
	public List<Card_conditionVO> get_condition();
	
	public boolean update_card_password(CardVO vo);
	public boolean update_cardInfo(CardVO vo);
	

}
