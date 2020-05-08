package security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AdminVO;
import com.spring.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Admin_LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	
	public static String DEFAULT_TARGET_PARAMETER = "spring-security-redirect-login-failure";
	private String targetUrlParameter = DEFAULT_TARGET_PARAMETER;
	
	@Autowired
	private AdminService adminService;
	
	
	public String getTargetUrlParameter() {
		return targetUrlParameter;
	}

	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("failed_login_count");
		session.removeAttribute("enabled");
		
		log.info("로그인 실패 핸들러 id : "+request.getParameter("id"));
		String id = request.getParameter("id");
		AdminVO vo = adminService.selectOne(id);
		if(vo==null) {
			session.setAttribute("id", "not_found");
		}else {
			if(vo.getEnabled()!=1) {
				session.setAttribute("enabled", "false");
			}else {
				
				adminService.update_login_failure_count(id);
				int failed_count = adminService.check_login_failure_count(id); 
				if(failed_count>=5) {
					adminService.set_disabled(id);
					adminService.init_login_failure_count(id);
				}
				session.setAttribute("failed_login_count", failed_count);
			}
		}

		super.onAuthenticationFailure(request, response, exception);
	}
}