package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import data.camping.CampingItem;
import data.camping.CampingResult;

public class GoCampingAPI {

	public static List<CampingItem> cache;
	
	// 서버킬 때 캐시에 넣어놓는 작업
	public static void loadOn() {
		try {
			String targetURL = "http://apis.data.go.kr/B551011/GoCamping/basedList";
			String queryString = "serviceKey=tn2QYKN7gYKzFTZslBMJQMYem10LBYlxadGI%2BmhOWQz9W6mZl4BvvgN8mi7LoY7Dkw5gcYV%2FRx8afw%2F6p%2BlyIg%3D%3D";
			queryString += "&_type=json&MobileOS=ETC&MobileApp=CAMPING&numOfRows=3436";

			URI uri = new URI(targetURL + "?" + queryString);

			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();
			CampingResult campingResult = gson.fromJson(response.body(), CampingResult.class);

			cache = campingResult.getResponse().getBody().getItems().getItem();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 캐시에 저장된 값들 중 10개씩 끊어서 가져오는 작업
	public static List<CampingItem> search(String pageNo) {
		int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
		int from = (page - 1) * 10;
		int to = page == 344 ? from + 6 : page * 10;
		try {
			return cache.subList(from, to);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 캐시에 저장된 값들 중 ContentId가 들어온 id 값과 같은 정보를 찾는 작업
	public static CampingItem findByCampingItem(String id) {
		CampingItem found = null;
		for(CampingItem t : cache) {
			if(t.getContentId().equals(id)) {
				found = t;
				break;
			}
		}
		return found;
//		return cache.stream().filter(t -> t.getContentId().equals(id)).findFirst().get();
	}
	
	public static List<CampingItem> find(String area, String city, String thema, String keyword) {
		List<CampingItem> found = new ArrayList<>();
		for (CampingItem t : cache) {
			if(!area.equals("") && !t.getDoNm().equals(area)) {
				continue;
			}
			if(!city.equals("") && !t.getSigunguNm().equals(city)) {
				continue;
			}
			if(!thema.equals("") && !t.getLctCl().equals(thema)) {
				continue;
			}
			if(!keyword.equals("") && !t.getFacltNm().contains(keyword)) {
				continue;
			}
			found.add(t);
		}
		return found;
	}
	
	public static List<CampingItem> findSearch(List<CampingItem> campings, String pageNo) {
		int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
		int from = (page - 1) * 10;
		int to = page == (campings.size() / 10 + 1) ? from + (campings.size() % 10) : page * 10;
		try {
			return campings.subList(from, to);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
