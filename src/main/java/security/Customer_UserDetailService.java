package security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.spring.service.CustomerService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Customer_UserDetailService implements UserDetailsService {

	@Autowired
	private CustomerService customerService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Customer_UserDetails user = customerService.security_get_customer(username);
		
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
	
		return user;
	}

}
