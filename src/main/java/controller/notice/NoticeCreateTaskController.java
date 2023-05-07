package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.user.User;
import repository.NoticeDAO;

@WebServlet("/notice/noticeCreate-task")
public class NoticeCreateTaskController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		String secret = req.getParameter("secret");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("logonUser");
		if (user.getId().equals("master")) {

			int r = NoticeDAO.create(title, body, secret);

			if (r == 1) {
				resp.sendRedirect("/notice/noticeBoard");
			}
		}else {
			resp.sendRedirect("/notice/noticeBoard");
		}
	}
}
