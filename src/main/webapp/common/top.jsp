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
						<li>${sessionScope.logonUser.getNick() }</li>
						<li>|</li>
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
<c:choose>
	<c:when test="${param.unauthorized eq null }">
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
	</c:when>
	<c:otherwise>
		<div class="layer_bg" style="display: block">
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
						<div style="color: red;">아이디 혹은 비밀번호가 일치하지 않습니다.</div>
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
		
	</c:otherwise>
</c:choose>
<!-- login popup -->
<c:choose>
	<c:when test="${param.fail eq null && param.error eq null }">
		<div id="layer_bg_join" class="layer_bg_join">
			<div class="layer">
				<h4 class="join_h4">Join</h4>
				<div>
					<c:url value="/user/join-task" var="joinTo" />
					<form action="${joinTo }" method="post" autocomplete='off'>
						<div class="login-input">
							<input type="text" placeholder="ID (영어/숫자 4 ~ 10 자)" name="id" class="col-10"  pattern="[a-z0-9]{4,10}" required/>
						</div>
						<div class="login-input">
							<input type="text" placeholder="Nick Name" name="nick"
								class="col-10" />
						</div>
						<div class="login-input">
							<input type="password" placeholder="Password (영어+숫자 6 ~ 20 자)" name="pass"
								class="col-10" pattern="[a-z0-9]{6,20}" required/>
						</div>
		
						<button type="submit" class="button_2">Join</button>
					</form>
				</div>
				<a href="#" class="layer_close">X</a>
			</div>
		</div>
	</c:when>
	<c:when test="${param.fail ne null && param.error eq null }">
		<div id="layer_bg_join" class="layer_bg_join" style="display: block">
			<div class="layer">
				<h4 class="join_h4">Join</h4>
				<div>
					<c:url value="/user/join-task" var="joinTo" />
					<form action="${joinTo }" method="post" autocomplete='off'>
						<div class="login-input">
							<input type="text" placeholder="ID (영어/숫자 4 ~ 10 자)" name="id" class="col-10" />
						</div>
						<div class="login-input">
							<input type="text" placeholder="Nick Name" name="nick"
								class="col-10" />
						</div>
						<div class="login-input">
							<input type="password" placeholder="Password (영어+숫자 6 ~ 20 자)" name="pass"
								class="col-10" />
						</div>
						<div style="color: red;">
							이미 사용중인 아이디 혹은 닉네임 입니다.
						</div>
						<button type="submit" class="button_2">Join</button>
					</form>
				</div>
				<a href="#" class="layer_close">X</a>
			</div>
		</div>
	</c:when>
		<c:when test="${param.fail eq null && param.error ne null }">
		<div id="layer_bg_join" class="layer_bg_join" style="display: block">
			<div class="layer">
				<h4 class="join_h4">Join</h4>
				<div>
					<c:url value="/user/join-task" var="joinTo" />
					<form action="${joinTo }" method="post" autocomplete='off'>
						<div class="login-input">
							<input type="text" placeholder="ID (영어/숫자 4 ~ 10 자)" name="id" class="col-10" pattern="[a-z0-9]{4,10}" required/>
						</div>
						<div class="login-input">
							<input type="text" placeholder="Nick Name" name="nick"
								class="col-10" />
						</div>
						<div class="login-input">
							<input type="password" placeholder="Password (영어+숫자 6 ~ 20 자)" name="pass"
								class="col-10" pattern="[a-z0-9]{6,20}" required/>
						</div>
						<div style="color: red;">
							요청한 방식과 일치하지 않습니다.
						</div>
						<button type="submit" class="button_2">Join</button>
					</form>
				</div>
				<a href="#" class="layer_close">X</a>
			</div>
		</div>
	</c:when>
</c:choose>
<!-- join popup -->
