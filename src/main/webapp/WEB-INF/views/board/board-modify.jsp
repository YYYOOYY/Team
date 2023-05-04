<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품 중고거래</title>
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
	<form action="/board/create-task" method="post">
		<div>
			제목 : 
			<input type="text" name="title" value="${title }" />
		</div>
		<div>
			<textarea  style="width: 45%; height: 120px; resize: none" name="body">${body }</textarea>
		</div>
		<div>
			가격 :
			<input type="text" name="price" value="${price }"/>
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>