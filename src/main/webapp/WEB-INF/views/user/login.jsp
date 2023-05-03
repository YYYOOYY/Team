<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑어때 로그인</title>
<link rel="stylesheet" href="/resource/css/style.css?${millis }" />
</head>
<body>
	<div class="root">
		<form action="/user/login-task?code=${sessionScope.code }" method="post" class="sign-form" autocomplete='off'>
			<h2>캠핑어때 로그인</h2> 
			<div style="margin: 0.4em">
				<input type="text" placeholder="아이디" name="id" value="${ID_SAVE }"
					class="join-input" required />
			</div>
			<div style="margin: 0.4em">
				<input type="password" placeholder="비밀번호" name="pass" class="join-input" />
			</div>
			<div style="margin: 0.4em">
				<button type="submit" class="join-btn">다음</button>
			</div>
		</form>
		<p style="flex: 0.1">
			계정이 없으신가요? <a href="/user/join">가입하기</a>
		</p>
	</div>
</body>
</html>