package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

import com.google.gson.Gson;

import data.camping.CampingResponse;
import data.camping.CampingResult;

public class OpenDictAPI {

	public static CampingResponse search(String q) {
		try {
			String targetURL = "http://apis.data.go.kr/B551011/GoCamping";
			String queryString = "serviceKey=tn2QYKN7gYKzFTZslBMJQMYem10LBYlxadGI%2BmhOWQz9W6mZl4BvvgN8mi7LoY7Dkw5gcYV%2FRx8afw%2F6p%2BlyIg%3D%3D";
			queryString += "&_type=json&MobileOS=ETC&MobileApp=CAMPING";

			URI uri = new URI(targetURL + "?" + queryString);
			
	
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
			
			Gson gson = new Gson();
			CampingResult campingResult = gson.fromJson(response.body(), CampingResult.class);
			
			return campingResult.getResponse();
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
}
