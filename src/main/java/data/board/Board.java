package data.board;

import java.util.Date;

public class Board {
	// 키값
	String code;
	// 작성자
	String writer;
	// 글 제목
	String title;
	// 글 내용
	String body;
	// 글 작성일
	Date writed;
	// 관심수 
	int interestedCount;
	// 조회수
	int viewCount;
	// 물품가격
	int price;
	// 거래상태확인
	int status;
	// 물품사진
	String img;
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getWrited() {
		return writed;
	}
	public void setWrited(Date wirted) {
		this.writed = wirted;
	}
	public int getInterestedCount() {
		return interestedCount;
	}
	public void setInterestedCount(int interestedCount) {
		this.interestedCount = interestedCount;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
