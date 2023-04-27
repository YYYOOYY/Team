<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
<form action="/index" onclick="location.href='/index'">
	<img src="/resource/img/logo.png" />
</form>
<a href="">캠핑장 검색</a>	<a href="/board/market">캠핑마켓</a> <a href="">캠핑소식</a>	
<c:choose>
	<c:when test="${sessionScope.logon }">
		<a href="/logout">로그아웃</a>
	</c:when>
	<c:otherwise>
		<a href="/login">로그인</a>
	</c:otherwise>
</c:choose>
</div>
