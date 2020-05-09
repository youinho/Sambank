package com.spring.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.domain.CustomerVO;
import com.spring.service.CustomerService;
import com.spring.service.InquiryService;
@Component
public class Customer_Task {
	

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private InquiryService inquiryService;
	
	//매 정각마다 고객 로그인 잠금 해제
	@Scheduled(cron="0 * * * * *")
	public void unlock_customer() {
		List<CustomerVO> list = customerService.select_to_unlock();
		if(list.size()==0) {
			return;
		}
		list.forEach(vo -> customerService.unlock_customer(vo.getId()));
	}
	
	
	//매 정각마다 문의사항 expired
	@Scheduled(cron="0 * * * * *")
	public void set_expired() {
		inquiryService.set_expired();
	}
	
	//매 정각마다 sendcount 초기화
	@Scheduled(cron="0 * * * * *")
	public void reset_sendcount() {
		customerService.reset_sendcount();
	}
	
}
