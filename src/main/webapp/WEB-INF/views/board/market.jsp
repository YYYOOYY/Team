<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품 중고거래</title>
<link rel="stylesheet" href="/resource/css/style.css">

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
*{
padding: 1px;
color: white;
}
</style>
</head>
<body>
<%@ include file="/common/top.jsp" %>
	<h3>캠핑용품을 캠핑어때에서 만나보세요</h3>
	<div style="text-align: right;" >	
		<div id="fail"> </div>
		<c:choose>
			<c:when test="${sessionScope.logon }">
				<form action="/board/create">
				<button style="background-color: black;">게시글 쓰기</button>
				</form>
			</c:when>
			<c:otherwise>
				<button id="logon" style="background-color: black;">게시글 쓰기</button>
					<script>
						document.querySelector("#logon").onclick = function(evt) {
							var returnValue = confirm('로그인이 필요합니다.');
							if(returnValue) {
								document.querySelector(".login_ad").dispatchEvent(new Event("click"));
							}
						}
					</script>
			</c:otherwise>
		</c:choose>
	</div>
	<c:forEach var="boards" items="${boardsAll }">
		<div>
			<a href="/board/detail?code=${boards.code }">
			<img src="${boards.img }" style ="border-radius: 20px; max-width: 15%"/>
			</a>
		</div>
		<div>
			<span style="font-size:13px ">[${boards.area } / ${boards.city }]</span>${boards.title }
		</div>
		<div>
			<p><span style="font-size: 12px"><fmt:formatDate value="${boards.writed }" pattern="yyyy.MM.dd"/></span>
		</div>
		<div>
			<b>${boards.price }원</b>
		</div>
		<span style="font-size: 12px">조회 ${boards.viewCount } · 관심 ${boards.interestedCount }</span>
	</c:forEach>
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/resource/js/custom.js"></script>
</body>
</html>