package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.camping.CampingItem;
import data.img.ImageItem;
import data.img.ImageResponse;
import util.CampingImgAPI;
import util.GoCampingAPI;
import util.change.ChangeImg;

@WebServlet("/detail")
public class DetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String campingId = req.getParameter("id");
		
		// 모든 이미지를 찾는 코드
		ImageResponse imgs = CampingImgAPI.search(campingId);
		if(imgs != null) {
			ImageItem[] items = imgs.getBody().getItems().getItem();
			
			List<String> li = new ArrayList<>();
			for(ImageItem i : items) {
				String[] strs = i.getImageUrl().split("/");

				li.add(strs[0]+"//"+strs[2]+"/"+strs[3]+"/"+strs[4]+"/"+strs[5]+"/thumb/thumb_1000_"+strs[6]);
			}
			
			req.setAttribute("images", li);
		}
		// 이미지 3개만 찾는 코드
		String[] strs = new String[3];
		if(imgs != null) {
			for(int i = 0; i < strs.length; i++) {
				strs[i] = imgs.getBody().getItems().getItem()[i+1].getImageUrl();
				
			}
			req.setAttribute("imgs", strs);
		}
		
		// List<String> flist = ChangeImg.changeImg(campingId);
		// req.setAttribute("facility", flist);
		
		// 특정 id로 특정 캠핑장 정보 불러오는 코드
		req.setAttribute("camping", GoCampingAPI.findByCampingItem(campingId));
		
		req.getRequestDispatcher("/WEB-INF/views/detail.jsp").forward(req, resp);
	}
}
