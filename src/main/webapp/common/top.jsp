<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
<img src="/resource/img/logo.png"  width="100px" height="100px" onclick="location.href='/index'"/>
<a href="/search">ķ���� �˻�</a>	<a href="">ķ�θ���</a> <a href="">ķ�μҽ�</a>	
<c:choose>
	<c:when test="${sessionScope.logon }">
		<a href="/logout">�α׾ƿ�</a>
	</c:when>
	<c:otherwise>
		<a href="/login">�α���</a>
	</c:otherwise>
</c:choose>
</div>
