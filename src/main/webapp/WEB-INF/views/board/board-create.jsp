<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래 물건등록</title>
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
	<h3>거래하고싶은 물품을 등록하세요</h3>
	<form action="/board/create-task" method="post" enctype="multipart/from-data">
		<div>
			제목 : 
			<input type="text" name="title" placeholder="제목을 입력하세요" />
			<input type="file" placeholder="파일선택" name="img" />
		</div>
		<div>
			<textarea  style="width: 45%; height: 120px; resize: none" name="body" placeholder="내용을 입력하세요"></textarea>
		</div>
		<div>
			물품가격 :
			<input type="text" name="price" placeholder="물품가격을 입력하세요"/>
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>