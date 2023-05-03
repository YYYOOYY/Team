package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.board.Board;

@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory =
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		String code = req.getParameter("code");
		req.setAttribute("code", code);
		
		int r = sqlSession.update("boards.updateViewCount", code);
		if(r == 1) {
			Board detailBoard = sqlSession.selectOne("boards.findByBoardCode", code);
			req.setAttribute("detail", detailBoard);
			req.setAttribute("code", code);
		}
		sqlSession.close();
		req.getRequestDispatcher("/WEB-INF/views/board/board-detail.jsp").forward(req, resp);
	}
}
