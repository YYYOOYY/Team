<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
*{
padding: 1px;
}
</style>
<meta charset="UTF-8">
<title>중고나라</title>
</head>
<body>
<%@ include file="/common/top.jsp" %>
	<h2>디테일 페이지</h2>
	<div>
		<c:choose>
				<c:when test="${sessionScope.logon }">
					<div>
						<img src="${detail.img }" />
					</div>
					<div>
						${detail.writer }
					</div>
					<div>
						${detail.title }				
					<p><span style="font-size: 12px"><fmt:formatDate value="${detail.writed }" pattern="yyyy.MM.dd"/></span>
					</div>
						<span>${detail.body }</span>
						<p><button type="submit">관심상품</button>${detail.interestedCount } | ${detail.viewCount } </p>
					<div>	
						<c:choose>
							<c:when test="${sessionScope.logonUser.getNick() ne detail.writer }">
								<span id="logonModify" style="cursor: pointer; font-size : 13px;">수정</span>·
								<span id="logonDelete" style="cursor: pointer; font-size : 13px;">삭제</span>
								<script>
									document.querySelector("#logonModify").onclick = function(evt) {
										var returnValue = confirm('글 작성자만 수정이 가능합니다.');
										if(returnValue) {
											location.href='/board/detail?code=${param.code }'
										}
									}
									document.querySelector("#logonDelete").onclick = function(evt) {
										var returnValue = confirm('글 작성자만 삭제가 가능합니다.');
										if(returnValue) {
											location.href='/board/detail?code=${param.code }'
										}
									}
								</script>								
							</c:when>
							<c:when test="${sessionScope.logonUser.getNick() eq detail.writer }">							
								<a href="/board/modify?code=${param.code }&writer=${detail.writer }" style = "text-decoration: none;" ><span style="font-size : 13px; color: black; ">수정 </span></a>
								· <span id="boardDelete" style="cursor: pointer;">삭제</span>
								<form action="/board/interest" method="get">
									<input type="hidden" name="code" value=${code } />
								</form>
								<script>
									document.querySelector("#boardDelete").onclick = function(evt) {
										var returnValue = confirm('삭제하시겠습니까?');
										if(returnValue) {
											location.href='/board/delete-task?code=${param.code }'
										}
									}
								</script>
								
							</c:when>
						</c:choose>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<img src="${detail.img }" />
					</div>
					<div>
						${detail.writer }
					</div>
					<div>
						${detail.title }				
					<p><span style="font-size: 12px"><fmt:formatDate value="${detail.writed }" pattern="yyyy.MM.dd"/></span>
					</div>
						<span>${detail.body }</span>
						<p>${detail.interestedCount } | ${detail.viewCount } </p>
				</c:otherwise>
		</c:choose>
	</div>
	
</body>
</html>