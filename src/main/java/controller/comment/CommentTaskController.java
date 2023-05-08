package controller.comment;

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

import data.user.User;

@WebServlet("/board/comment-task")
public class CommentTaskController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		SqlSessionFactory factory =
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		HttpSession session = req.getSession();
		session.setAttribute("cate", 4);
		User user = (User) session.getAttribute("logonUser");

		String writer = user.getNick();
		String boardCode = req.getParameter("code");
		String body = req.getParameter("body");

		Map<String, Object> params = new HashMap<>();
		params.put("writer", writer);
		params.put("boardCode", boardCode);
		params.put("body", body);
		// System.out.println(params);

		int r = sqlSession.insert("comments.create", params);
		sqlSession.close();
		if(r == 1) {
			resp.sendRedirect("/board/detail?code=" + boardCode); 
		} else {
			resp.sendRedirect("/board/detail?code=" + boardCode + "&error=-1");
		}
	}
}