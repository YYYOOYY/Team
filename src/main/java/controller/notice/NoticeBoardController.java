package controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.notice.Notice;
import repository.NoticeDAO;

@WebServlet("/notice/noticeBoard")
public class NoticeBoardController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Notice> noticeList = NoticeDAO.findByAll();
		
		req.setAttribute("noticeList", noticeList);
		
		List<Notice> noticePublic = NoticeDAO.findByPublic();
		
		req.setAttribute("noticePublic", noticePublic);
		
		req.getRequestDispatcher("/WEB-INF/views/notice/noticeBoard.jsp").forward(req, resp);
	}
}
