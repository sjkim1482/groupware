package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.groupware.model.EmpVo;

public class SessionCheckFilter implements Filter {

	private static final Logger logger = LoggerFactory.getLogger(SessionCheckFilter.class);
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//요청 URI가 S_USER 속성이 세션에 있어야 하는 주소인지 체크
		HttpServletRequest req = (HttpServletRequest)request;
		String uri = req.getRequestURI();
		
		logger.debug("필터접근 URI : {}",uri);
		
		//세션 체크가 필요 없는 주소 : login.jsp, loginController
		if(uri.endsWith("loginView") || uri.endsWith("loginProcess")||
				uri.contains("/assets/")||uri.contains("/common/")||
				uri.contains("/fullcalendar/")||uri.contains("/image/")||
				uri.contains("/easyui/")|| uri.contains("/js/") ||
				uri.contains("/jacktrip-webrtc-master/") ) {
			chain.doFilter(request, response);
		}
		//세션 체크가 필요 있는 주소(S_USER속성 확인)
		else {
			EmpVo user = (EmpVo)req.getSession().getAttribute("S_USER");
			
			//user 정보가 NULL ==> 로그인을 안함 ==> 로그인 화면으로 이동
			if(user==null) {
				//request.getRequestDispatcher("/login.jsp").forward(request, response);
				((HttpServletResponse)response).sendRedirect(req.getContextPath()+"/empController/loginView");
			}
			//user 정보가 !NULL ==> 로그인한상태 ==> 요청처리
			else {
				chain.doFilter(request, response);
			}
		}
		
		
	}

	@Override
	public void destroy() {
		
		
	}
	
}
