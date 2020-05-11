package security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.domain.AdminVO;
import com.spring.mapper.AdminMapper;
import com.spring.service.AdminService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Admin_UserDetailService implements UserDetailsService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Admin_UserDetails user = adminMapper.security_get_admin(username);
		
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		AdminVO vo = adminMapper.get_group_authority(username);
		if(vo!=null) {
			user.addAuthority(vo.getAuthority());
		}
		AdminVO vo2 = adminMapper.get_authority(username);
		if(vo2!=null) {
			user.addAuthority(vo2.getAuthority());
		}
		return user;
		
	}

}
