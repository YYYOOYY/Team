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
						<c:choose>
							<c:when test="${detail.status eq '1' }">
								<span>[${detail.area } / ${detail.city }]</span>
							</c:when>
							<c:otherwise>
								<span>[거래완료]</span>
							</c:otherwise>							
						</c:choose>
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
					<div id="transaction">
						<c:choose>
							<c:when test="${detail.status eq '1' }">
								거래완료로 변경
							</c:when>
							<c:otherwise>							
								거래중으로 변경
							</c:otherwise>
						</c:choose>
					</div>
						<script>
							document.querySelector("#transaction").onclick = function(evt) {
								var returnValue = confirm('거래상태를 바꾸시겠습니까?');
								if(returnValue) {
									location.href='/board/transaction?code=${param.code }'
								}
							}	
						</script>
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
						<c:choose>
							<c:when test="${detail.status eq '1' }">
								<span>[${detail.area } / ${detail.city }]</span>
							</c:when>
							<c:otherwise>
								<span>[거래완료]</span>
							</c:otherwise>							
						</c:choose>
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
	
		<hr/>
	<%--중고거래 게시판 댓글쓰기 영역--%>
	<div style="padding: 7px;">
		<c:choose>
			<c:when test="${countComments eq null }">
				댓글쓰기 (0개)
			</c:when>
			<c:otherwise>
				댓글쓰기 (${countComments }개)
			</c:otherwise>
		</c:choose>
		<form action="/board/comment-task?code=${code }" method="post">
		<div>
			<textarea name="body" style="resize: none; width: 95%; height: 60px; padding: 10px; " placeholder="상품과 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다."></textarea>
			<button type="submit" style="float: right; height: 80px;">등록</button>		
		</div>
		</form>
		<%--댓글 뷰 영역--%>
		<div>
			<c:forEach items="${list }" var="comments">
			<p>${comments.writer } |
			${comments.body } | <fmt:formatDate value="${detail.writed }" pattern="yyyy.MM.dd"/></p>			
			</c:forEach> 
		</div>
	</div>
					<!-- 페이징 처리 시작-->
			<div class="text-center pt15 pb10 ws15">
				<c:set var="currentPage"
					value="${empty param.pageNo ? 1 : param.pageNo }" />
				<%--처음으로--%>
				<c:if test="${currentPage >= 11}">
					<c:url value="/board/detail" var="target">
						<c:param name="code" value="${detail.code }"/>
						<c:param name="pageNo" value="1" />
					</c:url>
					<a href="${target}" style="color: black;">&lt;&lt;</a>
				</c:if>
				<%----------%>
				<%--이전버튼--%>
				<c:if test="${existPrev }">
					<c:url value="/board/detail" var="target">
						<c:param name="code" value="${detail.code }"/>
						<c:param name="pageNo" value="${start-1 }" />
					</c:url>
					<a href="${target}" style="color: black;">&lt;</a>
				</c:if>
				<%----------%>
				<%--현재 누른 페이지--%>
				<c:forEach var="p" begin="${start }" end="${last }">
					<c:url value="/board/detail" var="target">
						<c:param name="code" value="${detail.code }"/>
						<c:param name="pageNo" value="${p }" />
					</c:url>
					<c:choose>
						<c:when test="${p eq currentPage }">
							<b style="color: orange;">${p }</b>
						</c:when>
						<c:otherwise>
							<a href="${target }" style="color: black;">${p }</a>
						</c:otherwise>
					</c:choose>
					<%----------------%>
				</c:forEach>
				<%--다음버튼 --%>
				<c:if test="${existNext }">
					<c:url value="/board/detail" var="target">
						<c:param name="code" value="${detail.code }"/>
						<c:param name="pageNo" value="${last + 1 }" />
					</c:url>
					<a href="${target }" style="color: black;">&gt;</a>
				</c:if>
				<%----------%>
				<%--마지막으로--%>
				<c:if test="${param.pageNo <= lastPage - lastPage % 10}">
					<c:url value="/board/detail" var="target">
						<c:param name="code" value="${detail.code }"/>
						<c:param name="pageNo" value="${lastPage }" />
					</c:url>
					<a href="${target}" style="color: black;">&gt;&gt;</a>
				</c:if>
				<%----------%>
				<!-- 페이징처리 끝 -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="/resource/js/custom.js"></script>
	</div>
	
</body>
</html>