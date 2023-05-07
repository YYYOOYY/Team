<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/notice/noticeModify-task">
		<input type="hidden" name="code" value="${code }">
		<select name="secret">
			<option value="public" ${notice.secret eq 'public' ? 'selected' : '' }>공개</option>
			<option value="private" ${notice.secret eq 'private' ? 'selected' : '' }>비공개</option>
		</select>
		<div>
			<textarea style="width: 500px; height: 500px; resize: none" name="body">${notice.body }</textarea>
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>