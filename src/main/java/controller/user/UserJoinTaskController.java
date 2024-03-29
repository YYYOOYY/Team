package controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

@WebServlet("/user/join-task")
public class UserJoinTaskController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String nick = req.getParameter("nick");
		String hashpw = "";

		// 비밀번호 암호화 (영어 + 숫자가 6글자 이상이 되도록)
		// 아이디 (영어 + 숫자가 10글자 이하가 되도록)
		if (id.matches("[a-z0-9]+") && id.length() <= 10 && pass.matches("[a-z0-9]+") && pass.length() >= 6) {
			hashpw = BCrypt.hashpw(pass, BCrypt.gensalt());
			Map<String, Object> params = new HashMap<>();
			params.put("id", id);
			params.put("pass", hashpw);
			params.put("nick", nick);

			Map<String, Object> obj = new HashMap<>();
			obj.put("id", id);
			obj.put("nick", nick);

			User user = sqlSession.selectOne("users.findByUser", obj);
			User userId = sqlSession.selectOne("users.findById", id);
			User userNick = sqlSession.selectOne("users.findByNick", nick);

			if (user != null || userId != null || userNick != null) {
				HttpSession session = req.getSession();

				if (session.getAttribute("cate") == null) {
					resp.sendRedirect("/index?fail");
				} else {
					int r = (int) session.getAttribute("cate");
					if (r == 1) {
						resp.sendRedirect("/search?fail");
					} else if (r == 2 || r == 3) {
						resp.sendRedirect("/board/market?fail");
					} else if (r == 4) {
						resp.sendRedirect("/notice/noticeBoard?fail");
					} else {
						resp.sendRedirect("/index?fail");
					}
				}
				sqlSession.close();
				return;
			}

			int e = sqlSession.update("users.create", params);
			if (e == 1) {
				HttpSession session = req.getSession();

				if (session.getAttribute("cate") == null) {
					resp.sendRedirect("/index");
				} else {
					int r = (int) session.getAttribute("cate");
					if (r == 1) {
						resp.sendRedirect("/search");
					} else if (r == 2 || r == 3) {
						resp.sendRedirect("/board/market");
					} else if (r == 4) {
						resp.sendRedirect("/notice/noticeBoard");
					} else {
						resp.sendRedirect("/index");
					}
				}
			} else {
				HttpSession session = req.getSession();

				if (session.getAttribute("cate") == null) {
					resp.sendRedirect("/index?fail");
				} else {
					int r = (int) session.getAttribute("cate");
					if (r == 1) {
						resp.sendRedirect("/search?fail");
					} else if (r == 2 || r == 3) {
						resp.sendRedirect("/board/market?fail");
					} else if (r == 4) {
						resp.sendRedirect("/notice/noticeBoard?fail");
					} else {
						resp.sendRedirect("/index?fail");
					}
				}
			}
		} else {
			HttpSession session = req.getSession();

			if (session.getAttribute("cate") == null) {
				resp.sendRedirect("/index?error");
			} else {
				int r = (int) session.getAttribute("cate");
				if (r == 1) {
					resp.sendRedirect("/search?error");
				} else if (r == 2 || r == 3) {
					resp.sendRedirect("/board/market?error");
				} else if (r == 4) {
					resp.sendRedirect("/notice/noticeBoard?error");
				} else {
					resp.sendRedirect("/index?error");
				}
			}
		}

		sqlSession.close();
	}
}
