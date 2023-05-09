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
	box-sizing: border-box;
}

.post-container {
	display: flex;
	flex-wrap: wrap;
}

.post {
	width: 20%;
	height: 340px;
	padding: 4px;
}

.post>div {
	background-color: #f2f2f2;
	height: 100%;
	flex-direction: column;
}

li {
	list-style: none;
}
</style>
</head>
<body>
	<%@ include file="/common/top.jsp"%>
	<h3>캠핑용품을 캠핑어때에서 만나보세요</h3>
	<div onclick="location.href='/notice/noticeDetail?code=81'" style="padding-bottom: 10px; text-align: center; font-size: 25px; color: white;">${notice.title }</div>
	<div style="padding: 10px; background-color: #fff;">
		<div id="fail"></div>
		<c:choose>
			<c:when test="${sessionScope.logon }">
			<div style="display: flex; justify-content: space-between; flex-direction: inherit;">
				<div style="text-align: right;">
					<form action="/board/create">
						<button style="background-color: #FFFFFF; width: 230px; height: 31px;">게시글 쓰기</button>
					</form>
				</div>
				<div style="text-align: left;">
					<form action="/board/search">
						<div style="float: center;">
							<input type="text" placeholder="검색" name="search"
								style="    height: 31px; width: 96%;" autocomplete="pff"/>
						</div>
				</form>
				</div>
				</div>
			</c:when>
			
			<c:otherwise>
			<div style="display: flex; justify-content: space-between; flex-direction: inherit;">
				<div style="text-align: right;">
					<button id="logon" style="background-color: #FFFFFF; width: 230px; height: 31px;">게시글 쓰기</button>
					<script>
						document.querySelector("#logon").onclick = function(evt) {
							var returnValue = confirm('로그인이 필요합니다.');
							if (returnValue) {
								document.querySelector(".login_ad").dispatchEvent(
										new Event("click"));
							}
						}
					</script>
				</div>
				<div style="text-align: left;">
				<form action="/board/search">
					<div style="float: center;">
						<input type="text" placeholder="검색" name="search"
							style="height: 31px; width: 96%;" autocomplete="off"/>
					</div>
				</form>
				</div>
			</div>
			</c:otherwise>
		</c:choose>
		<div style="display: flex; align-items: center; flex-direction: row; flex-wrap: wrap; display: flex; justify-content: flex-start;">
			<c:forEach var="boards" items="${boardsAll }">
				<div class="post">
					<div>
						<div style="height: 60% ;">
							<a href="/board/detail?code=${boards.code }"> <img
								src="${boards.img }" style="height: 100%;  width:100%; border-radius : 8px; object-fit :cover" />
							</a>
						</div>
						<div style="height: 40% ">
							<ul>
								<c:choose>
									<c:when test="${boards.status eq '1' }">
										<li><span style="font-size: 13px">[${boards.area }
												/ ${boards.city }]</span></li>
									</c:when>
									<c:otherwise>
										<li><span>[거래완료]</span></li>
									</c:otherwise>
								</c:choose>
								<li>${boards.title }</li>
								<li><span style="font-size: 12px"><fmt:formatDate
											value="${boards.writed }" pattern="yyyy.MM.dd" /></span></li>
								<li><b>${boards.price }원</b></li>
								<li><span style="font-size: 12px">조회
										${boards.viewCount } · 관심 ${boards.interestedCount }</span></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<!-- 페이징 처리 시작-->
		<div class="text-center pt15 pb10 ws15">
			<c:set var="currentPage"
				value="${empty param.pageNo ? 1 : param.pageNo }" />
			<%--처음으로--%>
			<c:if test="${currentPage >= 11}">
				<c:url value="/board/market" var="target">
					<c:param name="pageNo" value="1" />
				</c:url>
				<a href="${target}" style="color: white;">&lt;&lt;</a>
			</c:if>
			<%----------%>
			<%--이전버튼--%>
			<c:if test="${existPrev }">
				<c:url value="/board/market" var="target">
					<c:param name="pageNo" value="${start-1 }" />
				</c:url>
				<a href="${target}" style="color: white;">&lt;</a>
			</c:if>
			<%----------%>
			<%--현재 누른 페이지--%>
			<c:forEach var="p" begin="${start }" end="${last }">
				<c:url value="/board/market" var="target">
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
				<c:url value="/board/market" var="target">
					<c:param name="pageNo" value="${last + 1 }" />
				</c:url>
				<a href="${target }" style="color: white;">&gt;</a>
			</c:if>
			<%----------%>
			<%--마지막으로--%>
			<c:if test="${param.pageNo <= lastPage - lastPage % 10}">
				<c:url value="/board/market" var="target">
					<c:param name="pageNo" value="${lastPage }" />
				</c:url>
				<a href="${target}" style="color: white;">&gt;&gt;</a>
			</c:if>
			<%----------%>
			<!-- 페이징처리 끝 -->
		</div>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="/resource/js/custom.js"></script>
	</div>
</body>
</html>