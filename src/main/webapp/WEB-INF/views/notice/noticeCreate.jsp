<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/notice/noticeCreate-task">
		<select name="secret">
			<option value="public">공개</option>
			<option value="private">비공개</option>
		</select>
		<div>
			<input type="text" name="title" autocomplete="off"/>
		</div>
		<div>
			<textarea style="width: 500px; height: 500px; resize: none" name="body"></textarea>
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>