package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import data.camping.CampingItem;
import data.camping.CampingResponse;
import data.camping.CampingResult;

public class GoCampingAPI {

	private static Map<String, CampingItem> cache;
	static {
		cache = new HashMap<>();
	}
	
	public static CampingResponse search(String pageNo) {
		try {
			String targetURL = "http://apis.data.go.kr/B551011/GoCamping/basedList";
			String queryString = "serviceKey=tn2QYKN7gYKzFTZslBMJQMYem10LBYlxadGI%2BmhOWQz9W6mZl4BvvgN8mi7LoY7Dkw5gcYV%2FRx8afw%2F6p%2BlyIg%3D%3D";
			queryString += "&_type=json&MobileOS=ETC&MobileApp=CAMPING&pageNo="+pageNo;

			URI uri = new URI(targetURL + "?" + queryString);
			
	
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
			
			Gson gson = new Gson();
			CampingResult campingResult = gson.fromJson(response.body(), CampingResult.class);
			
			for(CampingItem one : campingResult.getResponse().getBody().getItems().getItem()) {
				cache.put(one.getContentId(), one);
			}
			
			return campingResult.getResponse();
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public static CampingItem findByCampingItem(String id) {
		return cache.get(id);
	}
	
}
