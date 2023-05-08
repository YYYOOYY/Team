package controller.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.board.Board;
import data.comment.Comments;
import data.interested.Interested;
import data.user.User;

@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		HttpSession session = req.getSession();
		
		session.setAttribute("cate", 3);
		String code = req.getParameter("code");
		User user = (User) session.getAttribute("logonUser");
		String userId = null;

		if (user != null) {
			userId = user.getId();

			Map<String, Object> params = new HashMap<>();
			params.put("boardCode", code);
			params.put("userId", userId);

			Interested i = sqlSession.selectOne("boards.checkByInterested", params);

			if (i == null) {
				req.setAttribute("heart", false);
			} else {
				req.setAttribute("heart", true);
			}

			int r = sqlSession.update("boards.updateViewCount", code);
			if (r == 1) {
				Board detailBoard = sqlSession.selectOne("boards.findByBoardCode", code);
				req.setAttribute("detail", detailBoard);
				req.setAttribute("code", code);
			}
			List<Comments> list = sqlSession.selectList("comments.findByComments", code);
			req.setAttribute("list", list);
			req.setAttribute("countComments", list.size());
			sqlSession.close();
			req.getRequestDispatcher("/WEB-INF/views/board/board-detail.jsp").forward(req, resp);
		} else {
			Board detailBoard = sqlSession.selectOne("boards.findByBoardCode", code);
			List<Comments> list = sqlSession.selectList("comments.findByComments", code);
			Comments comments = sqlSession.selectOne("comments.countComments", code);
			req.setAttribute("detail", detailBoard);
			req.setAttribute("code", code);
			req.setAttribute("list", list);
			req.setAttribute("countComments", list.size());


			sqlSession.close();

			req.getRequestDispatcher("/WEB-INF/views/board/board-detail.jsp").forward(req, resp);
		}

	}
}
