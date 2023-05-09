<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- style -->
<link rel="stylesheet"
	href="/resource/css/style.css?<%=System.currentTimeMillis()%>">

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
* {
	padding: 5px;
}
</style>
</head>
<body>
	<%@ include file="/common/top.jsp"%>
	<c:if test="${sessionScope.logonUser.getId() eq 'master' }">
		<a href="/notice/noticeDelete?code=${notice.code }"
			style="text-decoration: none; color: black; font-size: 15px; background-color: white; float: right;"> [삭제] </a>
		<a href="/notice/noticeModify?code=${notice.code }"
			style="text-decoration: none; color: black; font-size: 15px; background-color: white; float: right;"> [수정] </a>
	</c:if>
	<h2 style="text-align: center; color: white; font-size: 30px;">캠핑소식</h2>
	<div
		style="border: 1px solid black; width: 80%; margin: auto; background-color: white;">
		<div style="font-size: 25px; text-align: center;">${notice.title }</div>
		<div style="text-align: right; font-size: 12px;">작성자 :
			${notice.writer }</div>
		<div style="text-align: left;">${notice.body }</div>
		<div style="text-align: right;">
			<fmt:formatDate value="${notice.writed }" pattern="yyyy.MM.dd" />
		</div>
		<div style="text-align: right;">👀 ${notice.viewCount }</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/resource/js/custom.js"></script>
</body>
</html>