<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품 중고거래</title>
<style>
*{
padding: 1px;
}
</style>
</head>
<body>
<%@ include file="/common/top.jsp" %>
	<h3>캠핑용품을 캠핑어때에서 만나보세요</h3>
	<div style="text-align: right" >
		<form action="/board/create">
		<button>물건등록</button>
		</form>
	</div>
	<c:forEach var="boards" items="${boardsAll }">
		<div>
			<img src="${boards.img }" style ="border-radius: 20px; max-width: 15%"/>
		</div>
		<div>
			${boards.title }
		</div>
		<div>
			<b>${boards.price }원</b>
		</div>
		<span style="font-size: 12px">조회 ${boards.viewCount } · 관심 ${boards.interestedCount }</span>
	</c:forEach>
	
</body>
</html>