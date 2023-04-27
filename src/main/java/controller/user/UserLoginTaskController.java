package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mindrot.jbcrypt.BCrypt;

import data.user.User;

@WebServlet("/user/login-task")
public class UserLoginTaskController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		User found = sqlSession.selectOne("users.findById", id);
		sqlSession.close();
		if (found != null && BCrypt.checkpw(pass, found.getPass())) {
			HttpSession session = req.getSession();

			session.setAttribute("logon", true);
			session.setAttribute("logonuser", found);

			int r = (int) session.getAttribute("cate");
			if (r == 1) {
				resp.sendRedirect("/search");
			} else if (r == 2) {
				resp.sendRedirect("/board/market");
			} else {
				resp.sendRedirect("/index");
			}
			return;
		} else {
			resp.sendRedirect("/login?cause=error");
			return;
		}
	}
}
