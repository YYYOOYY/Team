package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.board.Board;

/*
 * 중고거래 게시판 불러오는 컨트롤러
 * 
 */
@WebServlet("/board/market")
public class BoardController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.setAttribute("cate", 2);
		
		SqlSessionFactory factory =
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		// 중고거래 게시글 불러오기
		List<Board> boardsAll = sqlSession.selectList("boards.findByBoardsAll");
		req.setAttribute("boardsAll", boardsAll);
		sqlSession.close();
		System.out.println(boardsAll);
		req.getRequestDispatcher("/WEB-INF/views/board/market.jsp").forward(req, resp);
	}
}