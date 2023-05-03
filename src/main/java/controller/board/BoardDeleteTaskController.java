package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

/*
 * 중고거래 게시글 삭제 컨트롤러
 * (로그인 시 삭제 가능)
 */
@WebServlet("/board/delete-task")
public class BoardDeleteTaskController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory =
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		String code = req.getParameter("code");
		req.setAttribute("code", code);
		
		int r = sqlSession.delete("boards.delete", code);
		
		sqlSession.close();	
		if(r == 1) {
			resp.sendRedirect("/board/market");	
		}
	}
	
}
