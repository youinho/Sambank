package security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.spring.domain.CustomerVO;
import com.spring.service.AdminService;
import com.spring.service.CustomerService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Customer_LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private AdminService adminService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		log.info("로그인 성공 핸들러 id : "+id);
		customerService.init_login_failure_count(id);
		if(id!= null) {
			if(session.getAttribute("name")==null) {
				CustomerVO vo = adminService.select_by_id(id);
				if(vo!=null) {
					session.setAttribute("name", adminService.select_by_id(id).getName());
					session.setAttribute("id", id);
				}
			}
		}
		response.sendRedirect("/");
		
		//super.onAuthenticationSuccess(request, response, authentication);
		
	}
	
}
