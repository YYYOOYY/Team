<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품 중고거래</title>
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- style -->
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
	padding: 3px;
}

.msg {
	padding: 4px;
	border: 1px solid #cccccc;
	margin-bottom: 2px;
}
</style>
</head>
<body>
	<h3>게시글을 수정하세요.</h3>
	<form action="/board/modify-task" method="post">
		<input type="hidden" name="code" value="${code }">
		<div>
			제목 : <input type="text" name="title" value="${title }" />
		</div>
		<div>
			<textarea style="width: 45%; height: 120px; resize: none" name="body">${body }</textarea>
		</div>
		<div>
			가격 : <input type="text" name="price" value="${price }" />
			<button type="submit">등록</button>
		</div>
	</form>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/resource/js/custom.js"></script>
</body>
</html>