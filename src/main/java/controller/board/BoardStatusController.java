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
 * 중고거래 게시글 거래 상태 확인 컨트롤러
 */
@WebServlet("/board/transaction")
public class BoardStatusController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SqlSessionFactory factory =
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		String code = req.getParameter("code");
		
		String status = sqlSession.selectOne("boards.status", code);
		
		if(Integer.parseInt(status) == 1) {
			int r = sqlSession.update("boards.transactionOn", code);
			
			sqlSession.close();

			if(r == 1) {
				resp.sendRedirect("/board/detail?code="+code);
			}
		}else if(Integer.parseInt(status) == 2) {
			int r = sqlSession.update("boards.transactionOff", code);	
			
			sqlSession.close();

			if(r == 1) {
				resp.sendRedirect("/board/detail?code="+code);
			}
		}
	}

}
