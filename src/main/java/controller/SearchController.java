package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.camping.CampingItem;
import data.camping.CampingItems;
import data.camping.CampingResponse;
import util.OpenDictAPI;

@WebServlet("/search")
public class SearchController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageNo = req.getParameter("pageNo");
		
		CampingResponse camping = OpenDictAPI.search(pageNo);
		
		if(camping != null) {
			req.setAttribute("camping", camping.getBody().getItems().getItem());
			req.setAttribute("total", camping.getBody().getTotalCount());
		}
		
		int p;
		if(req.getParameter("pageNo") == null) {
			p = 1;
		}else {
			p = Integer.parseInt(req.getParameter("pageNo"));
		}
		
		
		int total = camping.getBody().getTotalCount();
		int lastPage = total / 10 + (total % 10 > 0 ? 1 : 0);
		
		int start = p % 10 == 0 ? p - 9 : p - (p % 10) + 1;
		int last = p % 10 == 0 ? p : p - (p % 10) + 10;
		
		last = last > lastPage ? lastPage : last;
		
		req.setAttribute("start", start);
		req.setAttribute("last", last);
		req.setAttribute("lastPage", lastPage);
		
		boolean existPrev = start == 1 ? false : true;
		boolean existNext = last < lastPage-1 ? true : false;	
		
		req.setAttribute("existPrev", existPrev);
		req.setAttribute("existNext", existNext);
		
		req.getRequestDispatcher("/WEB-INF/views/search.jsp").forward(req, resp);
	}
}
