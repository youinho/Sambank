package com.spring.mapper;

import java.util.List;

import com.spring.domain.CardVO;
import com.spring.domain.Card_conditionVO;
import com.spring.domain.Card_productVO;

public interface CardMapper {
	
	public List<Card_productVO> get_product();
	public int check_card_no(String card_no);
	public List<CardVO> get_cardList(String ano);
	public int register_card(CardVO vo);
	public CardVO get_cardInfo(String card_no);
	
	public List<Card_conditionVO> get_condition();
	
	public int update_password(CardVO vo);
	public int update_cardInfo(CardVO vo);
	public int request_card(CardVO vo);
	public List<CardVO> select_card_requested();
	public int set_request(String card_no);
}
