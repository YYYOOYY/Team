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
import data.comment.Comments;
import data.interested.Interested;
import data.user.User;
import util.GoCampingAPI;

@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		HttpSession session = req.getSession();
		
		session.setAttribute("cate", 3);
		
		int p;
		if (req.getParameter("pageNo") == null) {
			p = 1;
		} else {
			p = Integer.parseInt(req.getParameter("pageNo"));
		}
		
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
			
			String pageNo = req.getParameter("pageNo");
			
			int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
			
			int from = (page - 1) * 10;
			int to = page == (list.size() / 10 + 1) ? from + (list.size() % 10) : page * 10;
			
			req.setAttribute("list", list.subList(from, to));
			req.setAttribute("countComments", list.size());
			
			sqlSession.close();
			
			
			int total = list.size();
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
			
			req.getRequestDispatcher("/WEB-INF/views/board/board-detail.jsp").forward(req, resp);
		}else {	
			Board detailBoard = sqlSession.selectOne("boards.findByBoardCode", code);
			
			List<Comments> list = sqlSession.selectList("comments.findByComments", code);
			Comments comments = sqlSession.selectOne("comments.countComments", code);
			
			String pageNo = req.getParameter("pageNo");
			
			int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
			
			int from = (page - 1) * 10;
			int to = page == (list.size() / 10 + 1) ? from + (list.size() % 10) : page * 10;
			
			
			req.setAttribute("detail", detailBoard);
			req.setAttribute("code", code);
			
			req.setAttribute("list", list.subList(from, to));
			req.setAttribute("countComments", list.size());


			sqlSession.close();
			
			int total = list.size();
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
			
			req.getRequestDispatcher("/WEB-INF/views/board/board-detail.jsp").forward(req, resp);
		}
	}
}
