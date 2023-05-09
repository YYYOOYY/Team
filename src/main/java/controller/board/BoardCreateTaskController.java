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

import data.user.User;

/*
 * 중고거래 게시글 작성 컨트롤러
 * (로그인 시 가능)
 */
@WebServlet("/board/create-task")
public class BoardCreateTaskController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("logonUser"); // 작성자
		String writer = user.getNick();

		// ----------------------------------------------------------------------
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resource/img/" + writer); // 웹 uri 를 작성
		File pathFile = new File(path);
		if (!pathFile.exists()) { // 파일이 있는지 없는지 확인하는
			pathFile.mkdirs();
		}
		// 파일 생성이 되면 --> 실제로 돌아가는 서버에 생성이 되기 때문에 이클립스에서는 생성이 되지않는다.
		MultipartRequest multi = new MultipartRequest(req, path, 1024 * 1024 * 20, "UTF-8"); // 3번째에 들어간 숫자는 파일의 최대 크기를
		String price = multi.getParameter("price");
		String title = multi.getParameter("title");
		String body = multi.getParameter("body");
		String area = multi.getParameter("search_02");

		if (price.matches("[1-9][0-9]{1,6}00") && !title.equals("") && !body.equals("")) {

			if (area.equals("")) {
				resp.sendRedirect("/board/create");
				return; // 의미
			}

			String city = multi.getParameter("search_03");
			// repper 를 이용해서 long 타입을 String 으로 변환(랜덤파일명)
			String genCode = Long.toString(System.currentTimeMillis());
			// 새로운 파일생성(절대경로, 바꿀이름)

			if (title.equals("") || body.equals("") || price.equals("") || multi.getFile("img") == null) {
				resp.sendRedirect("/board/create");
				return;
			}

			String img = "/resource/img/" + writer + "/" + genCode;
			multi.getFile("img").renameTo(new File(path, genCode));

			Map<String, Object> params = new HashMap<>();
			params.put("title", title);
			params.put("img", img);
			params.put("body", body);
			params.put("price", price);
			params.put("writer", writer);
			params.put("area", area);
			params.put("city", city);

			int r = sqlSession.insert("boards.create", params);
			sqlSession.close();
			if (r == 1) {
				resp.sendRedirect("/board/market");
			}
		}else {
			resp.sendRedirect("/board/create?error=a");
		}
	}
}
