package security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Customer_UserDetails implements UserDetails {
	private int cno;							//고객 번호
	private String name;						//고객 성함
	private String eng_name;
	private String gender;						//고객 성별
	private String birth;						//고객 생일
	private String address;						//고객 주소
	private String mobile;						//고객 휴대폰번호
	private String id;							//아이디
	private String password;					//비밀번호
	private String email;						//이메일
	private Date createdate;					//회원가입 날짜
	private Date updatedate;
	private String authority;
	private String confirm_password;
	private String verifyKey;
	private int verified;
	private int failed_login_count;
	private int sendCount;
	private int enabled;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authority));
        return auth;
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
		
		return verified==1;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	@Override
	public boolean isEnabled() {
		
		return enabled==1;
	}

}
