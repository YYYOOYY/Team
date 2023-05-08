<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header">
	<div class="section">
		<div class="logo">
			<img src="/resource/img/logo_01.png" alt="캠핑어때 logo"
				onclick="location.href='/index'" />
		</div>
		<div class="nav">
			<ul>
				<li><a href="/search">캠핑장 검색</a></li>
				<li><a href="/board/market">장비 중고나라</a></li>
				<li><a href="/notice/noticeBoard">캠핑 소식</a></li>
			</ul>
		</div>
		<div class="login">
			<ul>
				<c:choose>
					<c:when test="${sessionScope.logon }">
						<li class="login_ad"><a href="/logout">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="login_ad">로그인</li>
						<li>|</li>
						<li class="join_ad">회원가입</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
<!--  header -->

<div class="layer_bg">
	<div class="layer">
		<h4 class="layer_h4">Login</h4>
		<div class="layer_login">
			<form action="/user/login-task" method="post" autocomplete='off'>
				<input type="hidden" name="code" value="${param.code }" />
				<div class="login-input">
					<input type="text" placeholder="ID" name="id" class="col-10"
						required />
				</div>
				<div class="login-input">
					<input type="password" placeholder="Password" name="pass"
						class="col-10" />
				</div>

				<button type="submit" class="button_1">Login</button>
			</form>
		</div>
		<a href="#" class="layer_close">X</a>
		<div class="login_join">
			<p>
				아직 회원이 아니신가요? 가입 후 더욱 재미난 캠핑을 즐겨보세요 <a href="#layer_bg_join"
					id="mvJoin">가입하기</a>
			</p>
		</div>

	</div>
</div>
<!-- login popup -->

<div id="layer_bg_join" class="layer_bg_join">
	<div class="layer">
		<h4 class="join_h4">Join</h4>
		<div>
			<c:url value="/user/join-task" var="joinTo" />
			<form action="${joinTo }" method="post" autocomplete='off'>
				<div class="login-input">
					<input type="text" placeholder="ID" name="id" class="col-10" />
				</div>
				<div class="login-input">
					<input type="text" placeholder="Nick Name" name="nick"
						class="col-10" />
				</div>
				<div class="login-input">
					<input type="password" placeholder="Password" name="pass"
						class="col-10" />
				</div>

				<button type="submit" class="button_2">Join</button>
			</form>
		</div>
		<a href="#" class="layer_close">X</a>
	</div>
</div>
<!-- join popup -->
