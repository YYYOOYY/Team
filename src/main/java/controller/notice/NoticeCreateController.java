package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.user.User;

@WebServlet("/notice/noticeCreate")
public class NoticeCreateController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("logonUser");
		if (!user.getId().equals("master")) {
			resp.sendRedirect("/notice/noticeBoard");
			return;
		}
		
		req.getRequestDispatcher("/WEB-INF/views/notice/noticeCreate.jsp").forward(req, resp);
	}
}
