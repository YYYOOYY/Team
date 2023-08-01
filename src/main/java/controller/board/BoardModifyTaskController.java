package controller.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.oreilly.servlet.MultipartRequest;

import data.board.Board;
import data.user.User;

/*
 * 중고거래 게시글 수정
 * (로그인 시 수정 가능)
 */

@WebServlet("/board/modify-task")
public class BoardModifyTaskController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		SqlSessionFactory factory =
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		HttpSession session = req.getSession();
		User found = (User) session.getAttribute("logonUser"); // 작성자
		String writer = found.getNick();
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resource/img/" + "writer"); // 웹 uri 를 작성
		File pathFile = new File(path);
		if (!pathFile.exists()) { // 파일이 있는지 없는지 확인하는
			pathFile.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(req, path, 1024 * 1024 * 20, "UTF-8"); // 3번째에 들어간 숫자는 파일의 최대 크기를
		String code = multi.getParameter("code");
		String title = multi.getParameter("title");
		String body = multi.getParameter("body");
		String price = multi.getParameter("price");

		req.setAttribute("code", code);
		boolean user = (boolean)req.getSession().getAttribute("logon");
		int r = sqlSession.update("boards.updateViewCount", code);
		if(r == 1) {
			Board detailBoard = sqlSession.selectOne("boards.findByBoardCode", code);
			req.setAttribute("detail", detailBoard);
			req.setAttribute("code", code);
		}	
		Map<String, Object> params = new HashMap<>();
		if(user) {
			String genCode = Long.toString(System.currentTimeMillis());
			String img = "/resource/img/" + writer + "/" + genCode;
			multi.getFile("img").renameTo(new File(path, genCode));
			
			params.put("img", img);
			params.put("title", title);
			params.put("body", body);
			params.put("price", price);
			params.put("code", code);
			sqlSession.update("boards.modify", params);
			
			req.getRequestDispatcher("/WEB-INF/views/board/board-detail.jsp").forward(req, resp);
			
		} else {
			req.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(req, resp);
		}
		sqlSession.close();
	}
}
