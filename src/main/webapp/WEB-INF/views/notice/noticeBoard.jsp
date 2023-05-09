<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- style -->
<link rel="stylesheet" href="/resource/css/style.css?<%=System.currentTimeMillis()%>">

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
	*{
		padding: 5px;
	}
</style>
</head>
<body>
	<%@ include file="/common/top.jsp"%>
	<h3>캠핑어때에서 빠르게 다양한 소식을 알려드립니다</h3>
	<c:if test="${sessionScope.logonUser.getId() eq 'master' }">
		<a href="/notice/noticeCreate" style="text-decoration: none; color: black; font-size: 15px; background-color: white; float: right;">글등록</a>
	</c:if>
	<h1 style="color: white; text-align: center; font-size: 30px;">캠핑소식</h1>
	<c:forEach
		items="${noticeList }"
		var="notice">
		<div style="margin-bottom: 1px;">
		<div style="border: 1px solid black; width: 80%; background-color: white; margin: auto;"
		onclick="location.href='/notice/noticeDetail?code=${notice.code}'">
			<span style="font-size: 25px;"> <c:if
					test="${sessionScope.logonUser.getId() eq 'master' }">
					[${notice.secret }]
				</c:if></span>
				 <span style="font-size: 25px; cursor: pointer; padding-left: 20px;">${notice.title }</span>
			<div style="text-align: right; font-size: 12px; padding-right: 20px;">작성자 :
				${notice.writer }</div>
			<div style="text-align: right; padding-right: 20px;">👀 ${notice.viewCount }</div>
			<div style="text-align: right; font-size: 14px; padding-right: 20px;">
				<fmt:formatDate value="${notice.writed }" pattern="yyyy.MM.dd" />
			</div>
		</div>
		</div>
	</c:forEach>

	<!-- 페이징 처리 시작-->
			<div class="text-center pt15 pb10 ws15">
				<c:set var="currentPage"
					value="${empty param.pageNo ? 1 : param.pageNo }" />
				<%--처음으로--%>
				<c:if test="${currentPage >= 11}">
					<c:url value="/notice/noticeBoard" var="target">
						<c:param name="pageNo" value="1" />
					</c:url>
					<a href="${target}" style="color: black;">&lt;&lt;</a>
				</c:if>
				<%----------%>
				<%--이전버튼--%>
				<c:if test="${existPrev }">
					<c:url value="/notice/noticeBoard" var="target">
						<c:param name="pageNo" value="${start-1 }" />
					</c:url>
					<a href="${target}" style="color: black;">&lt;</a>
				</c:if>
				<%----------%>
				<%--현재 누른 페이지--%>
				<c:forEach var="p" begin="${start }" end="${last }">
					<c:url value="/notice/noticeBoard" var="target">
						<c:param name="pageNo" value="${p }" />
					</c:url>
					<c:choose>
						<c:when test="${p eq currentPage }">
							<b style="color: white;">${p }</b>
						</c:when>
						<c:otherwise>
							<a href="${target }" style="color: white;">${p }</a>
						</c:otherwise>
					</c:choose>
					<%----------------%>
				</c:forEach>
				<%--다음버튼 --%>
				<c:if test="${existNext }">
					<c:url value="/notice/noticeBoard" var="target">
						<c:param name="pageNo" value="${last + 1 }" />
					</c:url>
					<a href="${target }" style="color: black;">&gt;</a>
				</c:if>
				<%----------%>
				<%--마지막으로--%>
				<c:if test="${param.pageNo <= lastPage - lastPage % 10}">
					<c:url value="/notice/noticeBoard" var="target">
						<c:param name="pageNo" value="${lastPage }" />
					</c:url>
					<a href="${target}" style="color: black;">&gt;&gt;</a>
				</c:if>
				<%----------%>
				<!-- 페이징처리 끝 -->
			</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/resource/js/custom.js"></script>
</body>
</html>