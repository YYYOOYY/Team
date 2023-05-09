package controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.notice.Notice;
import data.user.User;
import repository.NoticeDAO;

@WebServlet("/notice/noticeBoard")
public class NoticeBoardController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("logonUser");
		
		session.setAttribute("cate", 4);
		
		List<Notice> noticeList = null;
		
		if(user != null) {
			if(user.getId().equals("master")) {
				noticeList = NoticeDAO.findByAll();
			}else {
				noticeList = NoticeDAO.findByPublic();											
			}
		}else {
			noticeList = NoticeDAO.findByPublic();
		}
		
		int p;
		if (req.getParameter("pageNo") == null) {
			p = 1;
		} else {
			p = Integer.parseInt(req.getParameter("pageNo"));
		}
		
		int total = noticeList.size();
		int lastPage = total / 5 + (total % 5 > 0 ? 1 : 0);

		int start = p % 10 == 0 ? p - 9 : p - (p % 10) + 1;
		int last = p % 10 == 0 ? p : p - (p % 10) + 10;

		last = last > lastPage ? lastPage : last;
		
		last = last > lastPage ? lastPage : last;

		req.setAttribute("start", start);
		req.setAttribute("last", last);
		req.setAttribute("lastPage", lastPage);

		boolean existPrev = start == 1 ? false : true;
		boolean existNext = last < lastPage - 1 ? true : false;

		req.setAttribute("existPrev", existPrev);
		req.setAttribute("existNext", existNext);
		
		String pageNo = req.getParameter("pageNo");
		
		int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
		
		int from = (page - 1) * 5;
		int to = page == (noticeList.size() / 5 + 1) ? from + (noticeList.size() % 5) : page * 5;
		
		req.setAttribute("noticeList", noticeList.subList(from, to));
		
		
		req.getRequestDispatcher("/WEB-INF/views/notice/noticeBoard.jsp").forward(req, resp);
	}
}
