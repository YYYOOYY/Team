package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/index")
public class IndexController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String[] themaList = {"해변","섬","산","숲","계곡","강","호수","도심"};
		String[] cityList = {"서울시","부산시","대구시","인천시","광주시","대전시","울산시","세종시",
							"경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"};
	
		
		req.setAttribute("themaList", themaList);
		req.setAttribute("cityList", cityList);
		
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}
}
