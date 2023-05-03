package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class UserLogoutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.setAttribute("logon", false);
		session.removeAttribute("logonUser");
		
		int r = (int)session.getAttribute("cate");
		
		if (r == 1) {
			resp.sendRedirect("/search");
		} else if (r == 2) {
			resp.sendRedirect("/board/market");
		} else {
			resp.sendRedirect("/index");
		}
	}
}
