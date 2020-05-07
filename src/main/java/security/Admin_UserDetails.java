package security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.spring.domain.AdminVO;
import com.spring.mapper.AdminMapper;
import com.spring.service.AdminService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Admin_UserDetails implements UserDetails {
	
	
	
	private int admin_no;
	private String auth;
	private String id;
	private String password;
	private String name;
	private String rank;
	private String branch;
	private String mobile;
	
	private int enabled;
	
	private String authority;

	private String group_name;
	private String confirm_password;
	private String group_id;
	
	private int failed_login_count;
	
	ArrayList<GrantedAuthority> auth_arr = new ArrayList<GrantedAuthority>();
	
	
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		
        
		return auth_arr;
	}

	@Override
	public String getPassword() {
		
		return password;
	}

	@Override
	public String getUsername() {
		
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {

		return true;
	}

	@Override
	public boolean isAccountNonLocked() {

		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {

		return true;
	}

	@Override
	public boolean isEnabled() {

		return enabled==1;
	}
	
	public void addAuthority(String authority){
		this.auth_arr.add(new SimpleGrantedAuthority(authority));
	}

}
