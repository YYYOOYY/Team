<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품 중고거래</title>
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
	padding: 1px;
}
</style>
</head>
<body>
	<%@ include file="/common/top.jsp"%>
	<h3>캠핑용품을 캠핑어때에서 만나보세요</h3>
	<div style="text-align: right;">
		<div id="fail"></div>
		<c:choose>
			<c:when test="${sessionScope.logon }">
				<form action="/board/create">
					<button style="background-color: #FFFFFF;">게시글 쓰기</button>
				</form>
				<form action="/board/search">
					<div style="float: center;">
						<input type="text" placeholder="검색" name="search"
							style="height: 30px; width: 30%;" />
						<button type="submit">검색하기</button>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<button id="logon" style="background-color: #FFFFFF;">게시글
					쓰기</button>
				<script>
					document.querySelector("#logon").onclick = function(evt) {
						var returnValue = confirm('로그인이 필요합니다.');
						if (returnValue) {
							document.querySelector(".login_ad").dispatchEvent(
									new Event("click"));
						}
					}
				</script>
				<form action="/board/search">
					<div style="float: center;">
						<input type="text" placeholder="검색" name="search"
							style="height: 30px; width: 30%;" />
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	<div style="padding: 30px;">
		<c:forEach var="boards" items="${boardsAll }">
			<div>
				<a href="/board/detail?code=${boards.code }"> <img
					src="${boards.img }" style="border-radius: 20px; max-width: 15%" />
				</a>
			</div>
			<div>
				<c:choose>
					<c:when test="${boards.status eq '1' }">
						<span style="font-size: 13px">[${boards.area } / ${boards.city }]</span>
					</c:when>
					<c:otherwise>
						<span>[거래완료]</span>
					</c:otherwise>
				</c:choose>
				${boards.title }
			</div>
			<div>
				<p>
					<span style="font-size: 12px"><fmt:formatDate
							value="${boards.writed }" pattern="yyyy.MM.dd" /></span>
			</div>
			<div>
				<b>${boards.price }원</b>
			</div>
			<span style="font-size: 12px">조회 ${boards.viewCount } · 관심
				${boards.interestedCount }</span>
		</c:forEach>
		<!-- 페이징 처리 시작-->
			<div class="text-center pt15 pb10 ws15">
				<c:set var="currentPage"
					value="${empty param.pageNo ? 1 : param.pageNo }" />
				<%--처음으로--%>
				<c:if test="${currentPage >= 11}">
					<c:url value="/board/market" var="target">
						<c:param name="pageNo" value="1" />
					</c:url>
					<a href="${target}" style="color: black;">&lt;&lt;</a>
				</c:if>
				<%----------%>
				<%--이전버튼--%>
				<c:if test="${existPrev }">
					<c:url value="/board/market" var="target">
						<c:param name="pageNo" value="${start-1 }" />
					</c:url>
					<a href="${target}" style="color: black;">&lt;</a>
				</c:if>
				<%----------%>
				<%--현재 누른 페이지--%>
				<c:forEach var="p" begin="${start }" end="${last }">
					<c:url value="/board/market" var="target">
						<c:param name="pageNo" value="${p }" />
					</c:url>
					<c:choose>
						<c:when test="${p eq currentPage }">
							<b style="color: orange;">${p }</b>
						</c:when>
						<c:otherwise>
							<a href="${target }" style="color: black;">${p }</a>
						</c:otherwise>
					</c:choose>
					<%----------------%>
				</c:forEach>
				<%--다음버튼 --%>
				<c:if test="${existNext }">
					<c:url value="/board/market" var="target">
						<c:param name="pageNo" value="${last + 1 }" />
					</c:url>
					<a href="${target }" style="color: black;">&gt;</a>
				</c:if>
				<%----------%>
				<%--마지막으로--%>
				<c:if test="${param.pageNo <= lastPage - lastPage % 10}">
					<c:url value="/board/market" var="target">
						<c:param name="pageNo" value="${lastPage }" />
					</c:url>
					<a href="${target}" style="color: black;">&gt;&gt;</a>
				</c:if>
				<%----------%>
				<!-- 페이징처리 끝 -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="/resource/js/custom.js"></script>
	</div>
</body>
</html>