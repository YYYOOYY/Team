package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.camping.CampingItem;
import util.GoCampingAPI;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.setAttribute("cate", 1);

		String pageNo = req.getParameter("pageNo");

		String area = req.getParameter("search_02");
		String city = req.getParameter("search_03");
		String thema = req.getParameter("search_04");
		String keyword = req.getParameter("search_01");
		
		int p;
		if (req.getParameter("pageNo") == null) {
			p = 1;
		} else {
			p = Integer.parseInt(req.getParameter("pageNo"));
		}
		
		if(area == null && city == null && thema == null && keyword == null) {
			List<CampingItem> campings = GoCampingAPI.search(pageNo);
			
			if (campings != null) {
				req.setAttribute("camping", campings);
				req.setAttribute("total", GoCampingAPI.cache.size());
			}
			
			int total = GoCampingAPI.cache.size();
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
		}else {
			if(city == null || city.equals("전체")) {
				city = "";
			}
			List<CampingItem> camping = GoCampingAPI.find(area, city, thema, keyword);
			
			List<CampingItem> campings = GoCampingAPI.findSearch(camping, pageNo);
			
			if (campings != null) {
				req.setAttribute("camping", campings);
				req.setAttribute("total", camping.size());
			}
			int total = camping.size();
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
		}

		String[] themaList = { "해변", "섬", "산", "숲", "계곡", "강", "호수", "도심" };
		String[] cityList = { "서울시", "부산시", "대구시", "인천시", "광주시", "대전시", "울산시", "세종시", "경기도", "강원도", "충청북도", "충청남도",
				"전라북도", "전라남도", "경상북도", "경상남도", "제주도" };

		req.setAttribute("themaList", themaList);
		req.setAttribute("cityList", cityList);
		// ------------------------------------------------------

		String[] seoul = { "전체", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
				"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" };
		req.setAttribute("seoul", seoul);

		String[] busan = { "전체", "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구",
				"영도구", "중구", "해운대구" };
		req.setAttribute("busan", busan);

		String[] daegu = { "전체", "남구", "달서구", "달성군", "동구", "북구", "상주", "서구", "수성구", "중구" };
		req.setAttribute("daegu", daegu);

		String[] incheon = { "전체", "강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구" };
		req.setAttribute("incheon", incheon);

		String[] gwangju = { "전체", "광산구", "남구", "동구", "북구", "서구" };
		req.setAttribute("gwangju", gwangju);

		String[] daejeon = { "전체", "대덕구", "동구", "서구", "유성구", "중구" };
		req.setAttribute("daejeon", daejeon);

		String[] ulsan = { "전체", "남구", "동구", "북구", "울주군", "중구" };
		req.setAttribute("ulsan", ulsan);

		String[] sejong = { "전체", "금남면", "세종시", "소정면", "연서면", "전동면" };
		req.setAttribute("sejong", sejong);

		String[] gyeonggi = { "전체", "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시",
				"성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시",
				"이천시", "파주시", "평택시", "포천시", "하남시", "화성시" };
		req.setAttribute("gyeonggi", gyeonggi);

		String[] gangwon = { "전체", "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군",
				"춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군" };
		req.setAttribute("gangwon", gangwon);

		String[] chungcheongbuk = { "전체", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청원군", "청주시",
				"충주시" };
		req.setAttribute("chungcheongbuk", chungcheongbuk);

		String[] chungcheongnam = { "전체", "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군",
				"천안시", "청양군", "태안군", "홍성군" };
		req.setAttribute("chungcheongnam", chungcheongnam);

		String[] jeollabuk = { "전체", "고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시",
				"정읍시", "진안군" };
		req.setAttribute("jeollabuk", jeollabuk);

		String[] jeollanam = { "전체", "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군",
				"여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" };
		req.setAttribute("jeollanam", jeollanam);

		String[] gyeongsangbuk = { "전체", "경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시",
				"영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시" };
		req.setAttribute("gyeongsangbuk", gyeongsangbuk);

		String[] gyeongsangnam = { "전체", "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시",
				"창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군" };
		req.setAttribute("gyeongsangnam", gyeongsangnam);

		String[] jeju = { "전체", "제주시", "서귀포시" };
		req.setAttribute("jeju", jeju);

		// ------------------------------------------------------


		req.getRequestDispatcher("/WEB-INF/views/search.jsp").forward(req, resp);
	}
}
