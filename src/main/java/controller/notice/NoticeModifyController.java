package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.notice.Notice;
import repository.NoticeDAO;

@WebServlet("/notice/noticeModify")
public class NoticeModifyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String code = req.getParameter("code");
		
		req.setAttribute("code", code);
		
		Notice notice = NoticeDAO.findByNotice(code);
				
		req.setAttribute("notice", notice);
		
		req.getRequestDispatcher("/WEB-INF/views/notice/noticeModify.jsp").forward(req, resp);
	}
}
