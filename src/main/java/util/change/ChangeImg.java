package util.change;

import java.util.ArrayList;
import java.util.List;

import data.camping.CampingItem;
import util.GoCampingAPI;

public class ChangeImg {
	public static List<String> changeImg(String campingId){
		
		CampingItem camping = GoCampingAPI.findByCampingItem(campingId);
		
		List<String> flist = new ArrayList<>();
		
		String facility = camping.getSbrsCl();
		String[] f = facility.split(",");
		for(int i = 0; i < f.length; i++) {
			if(f[i].equals("전기")) {
				flist.add("전기그림 주소");
			}else if(f[i].equals("무선인터넷")) {
				flist.add("와이파이그림 주소");
			}else if(f[i].equals("장작판매")) {
				flist.add("장작판매그림 주소");
			}else if(f[i].equals("온수")) {
				flist.add("온수그림 주소");
			}else if(f[i].equals("물놀이장")) {
				flist.add("물놀이장그림 주소");
			}else if(f[i].equals("놀이터")) {
				flist.add("놀이터그림 주소");
			}else if(f[i].equals("운동시설")) {
				flist.add("운동시설그림 주소");
			}else if(f[i].equals("산책로")) {
				flist.add("산책로그림 주소");
			}else if(f[i].equals("마트.편의점")) {
				flist.add("마트.편의점그림 주소");
			}else if(f[i].equals("트렘폴린")) {
				flist.add("트렘폴린그림 주소");
			}else if(f[i].equals("운동장")) {
				flist.add("운동장그림 주소");
			}
		}
		
		return flist;
	}
}
