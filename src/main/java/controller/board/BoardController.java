package controller.board;

import java.io.IOException;
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
import data.notice.Notice;

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
		
		String search = req.getParameter("search");
		
		List<Board> boardsAll = null;
		
		if(search == null || search.equals("")) {
			boardsAll = sqlSession.selectList("boards.findByBoardsAll");
		}else {
			boardsAll = sqlSession.selectList("boards.search", search);
		}
		
		
		// 공지사항 -----
		Notice notice = sqlSession.selectOne("notice.findByNotice", "81");
		
		req.setAttribute("notice", notice);
		// -----------
		
		int p;
		if (req.getParameter("pageNo") == null) {
			p = 1;
		} else {
			p = Integer.parseInt(req.getParameter("pageNo"));
		}
		
		int total = boardsAll.size();
		int lastPage = total / 10 + (total % 10 > 0 ? 1 : 0);

		int start = p % 10 == 0 ? p - 9 : p - (p % 10) + 1;
		int last = p % 10 == 0 ? p : p - (p % 10) + 10;

		last = last > lastPage ? lastPage : last;

		req.setAttribute("start", start);
		req.setAttribute("last", last);
		req.setAttribute("lastPage", lastPage);

		boolean existPrev = start == 1 ? false : true;
		boolean existNext = last < lastPage - 1 ? true : false;

		req.setAttribute("existPrev", existPrev);
		req.setAttribute("existNext", existNext);
		
		// 중고거래 게시글 불러오기
		String pageNo = req.getParameter("pageNo");
		
		int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
		
		int from = (page - 1) * 10;
		int to = page == (boardsAll.size() / 10 + 1) ? from + (boardsAll.size() % 10) : page * 10;
		
		req.setAttribute("boardsAll", boardsAll.subList(from, to));
		sqlSession.close();
		req.getRequestDispatcher("/WEB-INF/views/board/market.jsp").forward(req, resp);
	}
}