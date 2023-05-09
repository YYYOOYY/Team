<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑어때 중고나라</title>
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

</head>
<body>
	<%@ include file="/common/top.jsp"%>
	<div style="padding: 5px;">
	<%--로그인 시 보이는 중고거래 게시판 글(디테일)영역 --%>
	<div style="border: 1px; text-align: center; background-color: white;">
		<c:choose>
			<c:when test="${sessionScope.logon }">
				<div>
					<div style="display: flex; justify-content: space-between;">
						<div style="flex: 1; text-align: center; padding-left: 120px; padding: 5px;">
							<c:choose>
								<c:when test="${detail.status eq '1' }">
									<span style="font-size: 30px; padding: 5px;">[${detail.area } / ${detail.city }]</span>
								</c:when>
								<c:otherwise>
									<span style="font-size: 30px; padding: 5px;">[거래완료]</span>
								</c:otherwise>
							</c:choose>
							<span style="font-size: 30px;">${detail.title }</span>
						</div>
						<div style="text-align: right; padding-top: 50px; padding: 5px;">
							<span style="font-size: 15px;">판매자 : ${detail.writer }</span>
						</div>
					</div>
					<c:if test="${detail.writer eq sessionScope.logonUser.getNick() }">
						<div id="transaction" style="cursor: pointer; text-align: right; font-size: 12px; padding: 5px;">
							<c:choose>
								<c:when test="${detail.status eq '1' }">
									거래상태 : 거래완료(변경)
								</c:when>
								<c:otherwise>							
									거래상태 : 거래중(변경)
								</c:otherwise>
							</c:choose>
						</div>
					</c:if>
				</div>
				<div style=" border-top: 1px solid gray; padding: 5px;;">
					<img src="${detail.img }" width="30%"/>
				</div>
				<div style="font-size: 17px; padding-bottom: 20px; padding: 5px;">${detail.body }</div>
				<div style="text-align: left; border-top: 1px solid gray; padding-top: 10px; padding-left: 20px; padding: 5px;">
					<c:choose>
						<c:when test="${heart }">
								💗
							</c:when>
						<c:otherwise>
								🤍					
							</c:otherwise>
					</c:choose>
					<span>${detail.interestedCount } 👀 ${detail.viewCount }</span>
				</div>
				<div style="cursor: pointer; text-align: left; padding-left: 20px; padding: 5px;">
					<a href="/board/interest-task?code=${detail.code }" style="font-size: 12px; text-decoration: none; color: black; padding: 5px;">
					<c:choose>
							<c:when test="${heart }">
										관심상품취소	
									</c:when>
							<c:otherwise>
										관심상품등록	
							</c:otherwise>
						</c:choose>
					</a>
					<div style="font-size: 12px; float: right; padding-right: 20px;">
									<fmt:formatDate value="${detail.writed }" pattern="yyyy.MM.dd" />
					</div>
					
					<script>
						document.querySelector("#transaction").onclick = function(
								evt) {
							var returnValue = confirm('거래상태를 바꾸시겠습니까?');
							if (returnValue) {
								location.href = '/board/transaction?code=${param.code }'
							}
						}
					</script>
				</div>
				<div style="text-align: right; padding-right: 12px; padding: 5px;">
					<c:choose>
						<c:when
							test="${sessionScope.logonUser.getNick() ne detail.writer }">
							<span id="logonModify" style="cursor: pointer; font-size: 13px;">수정</span> ·
								<span id="logonDelete" style="cursor: pointer; font-size: 13px;">삭제</span>
								
							<script>
								document.querySelector("#logonModify").onclick = function(
										evt) {
									var returnValue = confirm('글 작성자만 수정이 가능합니다.');
									if (returnValue) {
										location.href = '/board/detail?code=${param.code }'
									}
								}
								document.querySelector("#logonDelete").onclick = function(
										evt) {
									var returnValue = confirm('글 작성자만 삭제가 가능합니다.');
									if (returnValue) {
										location.href = '/board/detail?code=${param.code }'
									}
								}
							</script>
						</c:when>
						<c:when
							test="${sessionScope.logonUser.getNick() eq detail.writer }">
							<a href="/board/modify?code=${param.code }&writer=${detail.writer }&title=${detail.title }&body=${detail.body }&price=${detail.price }"
								style="text-decoration: none;">
								<span style="font-size: 13px; color: black;">수정</span></a>
								· <span id="boardDelete" style="cursor: pointer; font-size: 13px;">삭제</span>					
							<script>
								document.querySelector("#boardDelete").onclick = function(
										evt) {
									var returnValue = confirm('삭제하시겠습니까?');
									if (returnValue) {
										location.href = '/board/delete-task?code=${param.code }'
									}
								}
							</script>
						</c:when>
					</c:choose>
				</div>
			</c:when>
			<%--비로그인 시 보이는 중고거래 게시판 글(디테일)영역 --%>
			<c:otherwise>
				<div>
					<div style="display: flex; justify-content: space-between;">
						<div style="flex: 1; text-align: center; padding-left: 120px; padding: 5px;">
							<c:choose>
								<c:when test="${detail.status eq '1' }">
									<span style="font-size: 30px; padding: 5px;">[${detail.area } / ${detail.city }]</span>
								</c:when>
								<c:otherwise>
									<span style="font-size: 30px; padding: 5px;">[거래완료]</span>
								</c:otherwise>
							</c:choose>
							<span style="font-size: 30px; padding: 5px;">${detail.title }</span>
						</div>
						<div style="text-align: right; padding-top: 50px; padding: 5px;">
							<span style="font-size: 15px;">판매자 : ${detail.writer }</span>
						</div>
					</div>
				</div>
				<div style=" border-top: 1px solid gray; padding: 5px;">
					<img src="${detail.img }" width="30%"/>
				</div>
				<div style="font-size: 17px; padding-bottom: 20px; padding: 5px;">${detail.body }</div>
				<div style="text-align: left; border-top: 1px solid gray; padding-top: 10px; padding-left: 20px; padding: 5px;">
				🤍 ${detail.interestedCount } 👀 ${detail.viewCount }
					<div style="font-size: 12px; float: right; padding-right: 20px; padding: 5px;">
						<fmt:formatDate value="${detail.writed }" pattern="yyyy.MM.dd" />
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	
	<div style="padding: 5px;">
	<%--중고거래 게시판 댓글쓰기 영역--%>
	<div style="padding: 7px; background-color: white;">
		<c:choose>
			<c:when test="${countComments eq null }">
				댓글쓰기 (0개)
			</c:when>
			<c:otherwise>
				댓글쓰기 (${countComments }개)
			</c:otherwise>
		</c:choose>
		<form action="/board/comment-task?code=${code }" method="post">
			<div style="padding: 5px;">
				<textarea name="body"
					style="resize: none; width: 95%; height: 60px; padding: 10px;"
					placeholder="${sessionScope.logon ? '상품과 무관한 댓글이나 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다.' : '댓글을 작성하시려면 로그인이 필요합니다.' }" 
					${sessionScope.logon ? '' : 'readonly' }></textarea>
				<button type="submit" style="float: right; height: 60px; background-color: gray; color: white;">등록</button>
			</div>
		</form>
		<%--댓글 뷰 영역--%>
		<div>
			<div style="display: flex; justify-content: space-between; border-bottom: 1px solid gray; padding: 5px;">
				<span style=" font-size: 20px; flex: 1; padding: 5px; text-align: center;">작성자</span>
				<span style=" font-size: 20px; flex: 8; padding: 5px; padding-left: 15px;">내용</span>
				<span style=" font-size: 20px; flex: 1; padding: 5px;; text-align: center;">작성일</span>
			</div>
			<c:forEach items="${list }" var="comments">
				<span style="display: flex; justify-content: space-between; padding: 5px;">
						<span style="flex: 1; padding: 5px; border-bottom: 1px solid gray; text-align: center;">${comments.writer }</span>
						<span style="flex: 8; padding: 5px; border-left: 1px solid gray; padding-left: 15px; border-bottom: 1px solid gray;">${comments.body }</span>
						<span style="flex: 1; padding: 5px; border-left: 1px solid gray; text-align: center; border-bottom: 1px solid gray;">
						<fmt:formatDate value="${detail.writed }" pattern="yyyy.MM.dd" /></span>
				</span>
			</c:forEach>
		</div>
		</div>
	</div>
	<!-- 페이징 처리 시작-->
	<div class="text-center pt15 pb10 ws15">
		<c:set var="currentPage"
			value="${empty param.pageNo ? 1 : param.pageNo }" />
		<%--처음으로--%>
		<c:if test="${currentPage >= 11}">
			<c:url value="/board/detail" var="target">
				<c:param name="code" value="${detail.code }" />
				<c:param name="pageNo" value="1" />
			</c:url>
			<a href="${target}" style="color: white;">&lt;&lt;</a>
		</c:if>
		<%----------%>
		<%--이전버튼--%>
		<c:if test="${existPrev }">
			<c:url value="/board/detail" var="target">
				<c:param name="code" value="${detail.code }" />
				<c:param name="pageNo" value="${start-1 }" />
			</c:url>
			<a href="${target}" style="color: white;">&lt;</a>
		</c:if>
		<%----------%>
		<%--현재 누른 페이지--%>
		<c:forEach var="p" begin="${start }" end="${last }">
			<c:url value="/board/detail" var="target">
				<c:param name="code" value="${detail.code }" />
				<c:param name="pageNo" value="${p }" />
			</c:url>
			<c:choose>
				<c:when test="${p eq currentPage }">
					<b style="color: white;">${p }</b>
				</c:when>
				<c:otherwise>
					<a href="${target }" style="color: white;">${p }</a>
				</c:otherwise>
			</c:choose>
			<%----------------%>
		</c:forEach>
		<%--다음버튼 --%>
		<c:if test="${existNext }">
			<c:url value="/board/detail" var="target">
				<c:param name="code" value="${detail.code }" />
				<c:param name="pageNo" value="${last + 1 }" />
			</c:url>
			<a href="${target }" style="color: white;">&gt;</a>
		</c:if>
		<%----------%>
		<%--마지막으로--%>
		<c:if test="${param.pageNo <= lastPage - lastPage % 10}">
			<c:url value="/board/detail" var="target">
				<c:param name="code" value="${detail.code }" />
				<c:param name="pageNo" value="${lastPage }" />
			</c:url>
			<a href="${target}" style="color: white;">&gt;&gt;</a>
		</c:if>
		<%----------%>
		<!-- 페이징처리 끝 -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="/resource/js/custom.js"></script>
	</div>

</body>
</html>