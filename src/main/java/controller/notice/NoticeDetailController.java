package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.notice.Notice;
import data.user.User;
import repository.NoticeDAO;

@WebServlet("/notice/noticeDetail")
public class NoticeDetailController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String code = req.getParameter("code");
		
		Notice notice = NoticeDAO.findByNotice(code);
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("logonUser");
		String userId = null;
		if(user != null) {
			userId = user.getId();			
		}
		
		if(userId == null || !userId.equals("master")) {			
			if(notice.getSecret().equals("public")) {
				NoticeDAO.updateViewCount(code);
				req.setAttribute("code", code);
				req.setAttribute("notice", notice);
				
				req.getRequestDispatcher("/WEB-INF/views/notice/noticeDetail.jsp").forward(req, resp);				
				return;
			}else {
				resp.sendRedirect("/notice/noticeBoard");
				return;
			}
			
		}else {
			req.setAttribute("code", code);
			req.setAttribute("notice", notice);
			
			req.getRequestDispatcher("/WEB-INF/views/notice/noticeDetail.jsp").forward(req, resp);				
		}
	}
}
