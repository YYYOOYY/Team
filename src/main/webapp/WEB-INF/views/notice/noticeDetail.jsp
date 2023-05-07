<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		padding: 5px;
	}
</style>
</head>
<body>
	<h2 style="text-align: center;">공지사항</h2>
		<div style="border: 1px solid black; width: 500px; margin: auto;">
			<div style="font-size: 25px; text-align: center;">제목 : ${notice.title }</div>
			<div style="text-align: right; font-size: 12px;">작성자 : ${notice.writer }</div>
			<div style="text-align: left;">내용 : ${notice.body }</div>
			<div style="text-align: right;">
				<fmt:formatDate value="${notice.writed }" pattern="yyyy.MM.dd"/>
			</div>
			<div style="text-align: right;">👀 ${notice.viewCount }</div>
		</div>
		<c:if test="${sessionScope.logonUser.getId() eq 'master' }">
			<a href="/notice/noticeModify?code=${notice.code }" style="text-decoration: none;">수정</a> |
			<a href="/notice/noticeDelete?code=${notice.code }" style="text-decoration: none;">삭제</a>
		</c:if>
</body>
</html>