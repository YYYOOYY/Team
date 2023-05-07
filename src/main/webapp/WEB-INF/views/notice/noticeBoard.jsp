<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
*{
	padding: 5px;
	}
</style>
</head>
<body>
	<h3>공지사항</h3>
	<c:forEach items="${sessionScope.logonUser.getId() eq 'master' ? noticeList : noticePublic }" var="notice">
		<div style="border: 1px solid black; width: 30em;" onclick="location.href='/notice/noticeDetail?code=${notice.code}'">
			<span style="font-size: 25px;">
				<c:if test="${sessionScope.logonUser.getId() eq 'master' }">
					[${notice.secret }]
				</c:if>
				제목 : ${notice.title }
			</span>
			<div style="text-align: right; font-size: 12px;">작성자 : ${notice.writer }</div>
			<div>내용 : ${notice.body }</div>
			<div style="text-align: right;">
				<fmt:formatDate value="${notice.writed }" pattern="yyyy.MM.dd"/>
			</div>
			<div style="text-align: right;">👀 ${notice.viewCount }</div>
		</div>
	</c:forEach>
	<c:if test="${sessionScope.logonUser.getId() eq 'master' }">
		<a href="/notice/noticeCreate" style="text-decoration: none">글등록</a>
	</c:if>
</body>
</html>