package util.change;

import java.util.ArrayList;
import java.util.List;

import data.camping.CampingItem;
import data.camping.SbrsClItem;
import util.GoCampingAPI;

public class ChangeImg {
	public static List<SbrsClItem> create(String str){
		
		List<SbrsClItem> li = new ArrayList<>();
		
		String[] strs = str.split(",");
		for(int i = 0; i < strs.length; i++) {
			if(strs[i].equals("전기")) {
				SbrsClItem sbrs = new SbrsClItem("전기", "/resource/img/01.png");
				li.add(sbrs);
			}else if(strs[i].equals("무선인터넷")) {
				SbrsClItem sbrs = new SbrsClItem("무선인터넷", "/resource/img/02.png");
				li.add(sbrs);
			}else if(strs[i].equals("장작판매")) {
				SbrsClItem sbrs = new SbrsClItem("장작판매", "/resource/img/03.png");
				li.add(sbrs);
			}else if(strs[i].equals("온수")) {
				SbrsClItem sbrs = new SbrsClItem("온수", "/resource/img/04.png");
				li.add(sbrs);
			}else if(strs[i].equals("물놀이장")) {
				SbrsClItem sbrs = new SbrsClItem("물놀이장", "/resource/img/05.png");
				li.add(sbrs);
			}else if(strs[i].equals("놀이터")) {
				SbrsClItem sbrs = new SbrsClItem("놀이터", "/resource/img/06.png");
				li.add(sbrs);
			}else if(strs[i].equals("운동시설")) {
				SbrsClItem sbrs = new SbrsClItem("운동시설", "/resource/img/07.png");
				li.add(sbrs);
			}else if(strs[i].equals("산책로")) {
				SbrsClItem sbrs = new SbrsClItem("산책로", "/resource/img/08.png");
				li.add(sbrs);
			}else if(strs[i].equals("마트.편의점")) {
				SbrsClItem sbrs = new SbrsClItem("마트.편의점", "/resource/img/09.png");
				li.add(sbrs);
			}else if(strs[i].equals("트렘폴린")) {
				SbrsClItem sbrs = new SbrsClItem("트렘폴린", "/resource/img/10.png");
				li.add(sbrs);
			}else if(strs[i].equals("운동장")) {
				SbrsClItem sbrs = new SbrsClItem("운동장", "/resource/img/11.png");
				li.add(sbrs);
			}
		}
		
		return li;
	}
}
