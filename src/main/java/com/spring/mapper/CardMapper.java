package com.spring.mapper;

import java.util.List;

import com.spring.domain.CardVO;
import com.spring.domain.Card_productVO;

public interface CardMapper {
	
	public List<Card_productVO> get_product();
	public int check_card_no(String card_no);
	public List<CardVO> get_cardList(String ano);
	public int register_card(CardVO vo);
}
