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
<title>캠핑어때 중고나라</title>
</head>
<body>
<%@ include file="/common/top.jsp" %>
	<%--로그인 시 보이는 중고거래 게시판 글(디테일)영역 --%>
	<div>
		<c:choose>
				<c:when test="${sessionScope.logon }">
					<div style="font-size: 20px;">
						<span>[${detail.area } / ${detail.city }]</span>
						${detail.title } <span style="font-size: 12px;">⁽작성자:${detail.writer }⁾</span>
					</div>		
					<div>
						<img src="${detail.img }" />
					</div>
						<span>${detail.body }</span>
						<p>
						<c:choose>
							<c:when test="${heart }">
								💗		
							</c:when>
							<c:otherwise>
								🤍					
							</c:otherwise>
						</c:choose> 
						${detail.interestedCount } 👀 ${detail.viewCount } 
						<span onclick="location.href='/board/interest-task?code=${detail.code }'" style="cursor: pointer;">
							<span style="font-size: 12px;">
								<c:choose>
									<c:when test="${heart }">
										관심상품취소	
									</c:when>
									<c:otherwise>
										관심상품등록	
									</c:otherwise>
								</c:choose>
							</span>
						</span>
						</p>
					<div>
					<div>	
						<p><span style="font-size: 12px"><fmt:formatDate value="${detail.writed }" pattern="yyyy.MM.dd"/></span>
					</div>	
						<c:choose>
							<c:when test="${sessionScope.logonUser.getNick() ne detail.writer }">
								<span id="logonModify" style="cursor: pointer; font-size : 13px;">수정</span> ·
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
								<a href="/board/modify?code=${param.code }&writer=${detail.writer }&title=${detail.title }&body=${detail.body }&price=${detail.price }" style = "text-decoration: none;" ><span style="font-size : 13px; color: black; ">수정</span></a>
								· <span id="boardDelete" style="cursor: pointer; font-size : 13px;">삭제</span>
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
				<%--비로그인 시 보이는 중고거래 게시판 글(디테일)영역 --%>
				<c:otherwise>
					<div style="font-size: 20px;">
						<span>[${detail.area } / ${detail.city }]</span>
						${detail.title } <span style="font-size: 12px;">⁽작성자:${detail.writer }⁾</span>
					</div>		
					<div>
						<img src="${detail.img }" />
					</div>
						<span>${detail.body }</span>
						<p>🤍 ${detail.interestedCount } 👀 ${detail.viewCount } </p>
					<div>				
						<p><span style="font-size: 12px"><fmt:formatDate value="${detail.writed }" pattern="yyyy.MM.dd"/></span>
					</div>
				</c:otherwise>
		</c:choose>
	</div>
	<%--중고거래 게시판 댓글 영역--%>
	<div>
	
	
	</div>
</body>
</html>