package controller.board;

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

import data.interested.Interested;
import data.user.User;

/*
 * 중고거래 게시글 관심 등록 (관심상품)
 */

@WebServlet("/board/interest-task")
public class BoardInterestController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("logonUser");

		String userId = user.getId();
		String code = req.getParameter("code");
		
		Map<String, Object> params = new HashMap<>();
		params.put("boardCode", code);
		params.put("userId", userId);

		Interested i = sqlSession.selectOne("boards.checkByInterested", params);
		if (i == null) {

			int r = sqlSession.insert("boards.createInterest", params);	

			if (r == 1) {
				int countInterested = sqlSession.selectOne("boards.countInterested", code);

				Map<String, Object> param = new HashMap<>();
				param.put("code", code);
				param.put("count", countInterested);

				int rr = sqlSession.update("boards.updateInterestCount", param);
				sqlSession.close();
				if (rr == 1) {
					resp.sendRedirect("/board/detail?code=" + code);
				}
			}
		} else {
			int d = sqlSession.delete("boards.deleteInterested", params);
			if (d == 1) {
				int countInterested = sqlSession.selectOne("boards.countInterested", code);

				Map<String, Object> param = new HashMap<>();
				param.put("code", code);
				param.put("count", countInterested);

				int rr = sqlSession.update("boards.updateInterestCount", param);
				sqlSession.close();
				if(rr == 1) {
					resp.sendRedirect("/board/detail?code=" + code);					
				}
			}
		}
	}
}
