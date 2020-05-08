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
import com.spring.service.AdminService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Admin_LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Autowired
	private AdminService adminService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String id = request.getParameter("id");
		adminService.init_login_failure_count(id);
		HttpSession session = request.getSession();
		AdminVO vo = adminService.selectOne(id);
		session.setAttribute("branch", vo.getBranch());
		session.setAttribute("rank", vo.getRank());
		session.setAttribute("name", vo.getName());
		
		response.sendRedirect("/admin/notice");
		
		//super.onAuthenticationSuccess(request, response, authentication);
		
	}
	
	
	
}
