<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- style -->
<link rel="stylesheet" href="/resource/css/style.css?<%=System.currentTimeMillis()%>">

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

</head>
<body>
	<%@ include file="/common/top.jsp"%>
	<form action="/notice/noticeModify-task">
		<input type="hidden" name="code" value="${code }">
		 <select name="secret">
			<option value="public"
				${notice.secret eq 'public' ? 'selected' : '' }>공개</option>
			<option value="private"
				${notice.secret eq 'private' ? 'selected' : '' }>비공개</option>
			<option value="open" ${notice.secret eq 'open' ? 'selected' : '' }>특정공개</option>
		</select>
		<div>
			<input type="text" name="title" autocomplete="off" value="${notice.title }"/>
		</div>
		<div>
			<textarea style="width: 500px; height: 500px; resize: none"
				name="body">${notice.body }</textarea>
		</div>
		<button type="submit">등록</button>
	</form>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/resource/js/custom.js"></script>
</body>
</html>