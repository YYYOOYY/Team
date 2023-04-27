package user.controller;

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
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/user/join-task")
public class UserJoinTaskController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		SqlSessionFactory factory =
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String nick = req.getParameter("nick");
		String hashpw = "";
		
		// 비밀번호 암호화 (영어 + 숫자가 6글자 이상이 되도록)
		// 아이디 (영어 + 숫자가 10글자 이하가 되도록)
		if(id.matches("[a-z0-9]+")&&  id.length() <= 10 && pass.matches("[a-z0-9]+") && pass.length() >= 6 ) {
			hashpw = BCrypt.hashpw(pass, BCrypt.gensalt());
			Map<String, Object> params = new HashMap<>();
			params.put("id", id);
			params.put("pass", hashpw);
			params.put("nick", nick);
			sqlSession.selectList("users.create", params);
			
			req.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("/WEB-INF/views/user/join.jsp").forward(req, resp);
		}
		
		
	}
}
