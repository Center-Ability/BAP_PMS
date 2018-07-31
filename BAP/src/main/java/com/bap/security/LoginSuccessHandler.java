package com.bap.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.bap.domain.MemVO;
import com.bap.service.LoginService;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) throws ServletException, IOException {
		
		
		
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String targetUrl = null;
		if(savedRequest != null) {
			savedRequest.getRedirectUrl();
		}
		
		HttpSession session = request.getSession();
		String successID = authentication.getName();
		
		ApplicationContext ctx = new GenericXmlApplicationContext("classpath:context/root-context.xml");
		
		LoginService service = (LoginService)ctx.getBean("loginService");
		
		try {
			MemVO memVO = service.loginData(successID);
			
			String rank=memVO.getMem_rank();
			if(rank.equals("관리자")) {
				setDefaultTargetUrl("/home/manager");
			} else if(rank.equals("품질관리팀")) {
				setDefaultTargetUrl("/home/qm");
			} else if(rank.equals("팀장")) {
				setDefaultTargetUrl("/home/pm");
			} else {
				setDefaultTargetUrl("/home/mem");
			}
			
			session.setAttribute("loginUser", memVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String accept = request.getHeader("accept");
		String retUrl = null;
		
		if(targetUrl == null || targetUrl.isEmpty()){
			retUrl = request.getContextPath() + getDefaultTargetUrl();
		} else {
			retUrl = targetUrl.substring(
					targetUrl.indexOf(request.getContextPath()));
		}
		
		if(accept.indexOf("html") > -1) {
			super.onAuthenticationSuccess(request, response, authentication);
		} else if(accept.indexOf("json") >- 1) {
			response.setContentType("application/json;charset=utf-8");
			String data="{\"message\":\"로그인하였습니다.\","
						+ "\"retUrl\":\""+retUrl+"\","
						+ "\"error\":false"
						+ "}";
			
			PrintWriter out = response.getWriter();
			out.println(data);
			out.flush();
			out.close();
		}
			
	}

}