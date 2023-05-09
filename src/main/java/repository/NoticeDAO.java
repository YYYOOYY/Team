package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import data.notice.Notice;

public class NoticeDAO extends DAO{
	
	public static int create(String title, String body, String secret) {
		SqlSession session = factory.openSession(true);
		Map<String, Object> obj = new HashMap<>();
		obj.put("title", title);
		obj.put("body", body);
		obj.put("secret", secret);
		
		int r = session.insert("notice.create", obj);
		
		session.close();
		
		return r;
	}
	
	public static List<Notice> findByAll() {
		SqlSession session = factory.openSession();
		
		List<Notice> notice = session.selectList("notice.findByAll");
		
		session.close();
		
		return notice;
	}
	
	public static List<Notice> findByPublic() {
		SqlSession session = factory.openSession();
		
		List<Notice> notice = session.selectList("notice.findByPublic");
		
		session.close();
		
		return notice;
	}
	
	public static Notice findByNotice(String code) {
		SqlSession session = factory.openSession();
		
		Notice notice = session.selectOne("notice.findByNotice", code);
		
		session.close();
		
		return notice;
	}
	
	public static int modifyNotice(String title, String body, String code, String secret) {
		SqlSession session = factory.openSession(true);
		
		Map<String, Object> obj = new HashMap<>();
		obj.put("title", title);
		obj.put("body", body);
		obj.put("code", code);
		obj.put("secret", secret);
		
		int r = session.update("notice.modifyNotice", obj);
		
		session.close();
		
		return r;
	}
	
	public static int updateViewCount(String code) {
		SqlSession session = factory.openSession(true);
		
		int r = session.update("notice.updateViewCount", code);
		
		session.close();
		
		return r;
	}
	
	public static int delete(String code) {
		SqlSession session = factory.openSession(true);
		
		int r = session.delete("notice.delete", code);
		
		session.close();
		
		return r;
	}
}
