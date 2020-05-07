package security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.spring.domain.AdminVO;
import com.spring.domain.CustomerVO;
import com.spring.service.AdminService;
import com.spring.service.CustomerService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Customer_LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CustomerService customerService;
	
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String id = request.getParameter("id");
		log.info("로그인 성공 핸들러 id : "+id);
		customerService.init_login_failure_count(id);
		
		//CustomerVO vo = adminService.select_by_id(id);
		
		response.sendRedirect("/");
		
		//super.onAuthenticationSuccess(request, response, authentication);
		
	}
	
}
