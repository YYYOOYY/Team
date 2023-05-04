package controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.board.Board;

/*
 * 중고거래 게시글 수정
 * (로그인 시 수정 가능)
 */

@WebServlet("/board/modify-task")
public class BoardModifyTaskController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory =
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		String code = req.getParameter("code");
		
		req.setAttribute("code", code);
		boolean user = (boolean)req.getSession().getAttribute("logon");
		int r = sqlSession.update("boards.updateViewCount", code);
		if(r == 1) {
			Board detailBoard = sqlSession.selectOne("boards.findByBoardCode", code);
			req.setAttribute("detail", detailBoard);
			req.setAttribute("code", code);
		}	
		Map<String, Object> params = new HashMap<>();
		// 회원일 때 글 작성
		if(user) {
			String title = req.getParameter("title");
			String body = req.getParameter("body");
			String price = req.getParameter("price");
			String img = req.getParameter("img");
			String area = req.getParameter("area");
			String city = req.getParameter("city");
			
			params.put("title", title);
			params.put("body", body);
			params.put("price", price);
			params.put("img", img);
			params.put("code", code);
			sqlSession.update("boards.modify", params);
			
			req.getRequestDispatcher("/WEB-INF/views/board/board-detail.jsp").forward(req, resp);
			
		} else {
			req.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(req, resp);
		}
		sqlSession.close();
	}
}
