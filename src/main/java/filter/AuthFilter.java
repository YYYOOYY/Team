package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.user.User;

//@WebFilter({"/home/index.jsp", "/home/following.jsp"})
@WebFilter("/board/create")	// 필터대상(주소)
public class AuthFilter extends HttpFilter{
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String uri = request.getRequestURI();
		
		boolean logon = (boolean)request.getSession().getAttribute("logon");
		User logonUser = (User)request.getSession().getAttribute("logonUser");
		// if 를 걸어서
		if(logon && logonUser != null) {
			// 현재 요청을 보낸 사용자의 세션에 logon 값이 true 면 필터 통과
			chain.doFilter(request, response); // 필터 통과시켜주는 ..			
			} else {
			// 그게 아니면 /flow/logon.jsp 로 보내는 필터 작업
			response.sendRedirect("/board/market");			
			}
	}
}
