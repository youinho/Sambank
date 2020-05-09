package security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Admin_AuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private Admin_UserDetailService admin_UserDetailService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        
        
        Admin_UserDetails user = (Admin_UserDetails) admin_UserDetailService.loadUserByUsername(username);
        
        if(!passwordEncoder.matches(password, user.getPassword())) {
        
            throw new BadCredentialsException(username);
        }
        
        if(!user.isEnabled()) {
            throw new BadCredentialsException(username);
        }
        
        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());

		
	}

	@Override
	public boolean supports(Class<?> authentication) {
	
		return true;
	}

}
