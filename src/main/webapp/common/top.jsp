<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
<form action="/index" onclick="location.href='/index'">
	<img src="/resource/img/logo.png" />
</form>
<a href="">ķ���� �˻�</a>	<a href="/board/market">ķ�θ���</a> <a href="">ķ�μҽ�</a>	
<c:choose>
	<c:when test="${sessionScope.logon }">
		<a href="/logout">�α׾ƿ�</a>
	</c:when>
	<c:otherwise>
		<a href="/login">�α���</a>
	</c:otherwise>
</c:choose>
</div>
