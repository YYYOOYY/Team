package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.user.User;

@WebServlet("/board/modify")
public class BoardModifyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String code = req.getParameter("code");
		
		User user = (User)session.getAttribute("logonUser");
		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		String price = req.getParameter("price");
		
		req.setAttribute("writer", writer);
		req.setAttribute("title", title);
		req.setAttribute("body", body);
		req.setAttribute("price", price);
		
		if(user.getNick().equals(writer)) {
			req.setAttribute("code", code);
			req.getRequestDispatcher("/WEB-INF/views/board/board-modify.jsp").forward(req, resp);			
		} else {
			req.getRequestDispatcher("/WEB-INF/views/board/board-detail.jsp").forward(req, resp);
		}
		
	}
}
