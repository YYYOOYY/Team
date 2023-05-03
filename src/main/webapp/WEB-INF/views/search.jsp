<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>캠핑어때?!</title>
</head>
<body>
	<%@ include file="/common/top.jsp"%>
	<form action="/search">
		<%-- 키워드검색시작 --%>
		<input type="text" name="search_01" class="col-2" placeholder="검색"
			autocomplete="off">
		<%-- 키워드검색끝 --%>
		<%-- 지역별검색시작 --%>
		<div>
			<%-- 팔도검색 시작 --%>
			<select id="area" name="search_02" class="col-2-1">
				<option value="">전체(도)</option>
				<c:forEach items="${cityList }" var="c">
					<option value="${c }" ${param.area eq c ? 'selected' : '' }>${c }</option>
				</c:forEach>
			</select>
			<%-- 팔도검색 끝 --%>
			<%-- 시/도 시작 --%>
			<select name="search_03" class="col-2-3" data-group="">
				<option value="" selected>전체/시/군</option>
			</select> 
			<select style="display: none;" data-group="서울시" class="col-2-3">
				<c:forEach items="${seoul }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="부산시" class="col-2-3">
				<c:forEach items="${busan }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="대구시" class="col-2-3">
				<c:forEach items="${daegu }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="인천시" class="col-2-3">
				<c:forEach items="${incheon }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="광주시" class="col-2-3">
				<c:forEach items="${gwangju }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="대전시" class="col-2-3">
				<c:forEach items="${daejeon }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="울산시" class="col-2-3">
				<c:forEach items="${ulsan }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="세종시" class="col-2-3">
				<c:forEach items="${sejong }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="경기도" class="col-2-3">
				<c:forEach items="${gyeonggi }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="강원도" class="col-2-3">
				<c:forEach items="${gangwon }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="충청북도" class="col-2-3">
				<c:forEach items="${chungcheongbuk }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="충청남도" class="col-2-3">
				<c:forEach items="${chungcheongnam }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="전라북도" class="col-2-3">
				<c:forEach items="${jeollabuk }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="전라남도" class="col-2-3">
				<c:forEach items="${jeollanam }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="경상북도" class="col-2-3">
				<c:forEach items="${gyeongsangbuk }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="경상남도" class="col-2-3">
				<c:forEach items="${gyeongsangnam }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select> <select style="display: none;" data-group="제주도" class="col-2-3">
				<c:forEach items="${jeju }" var="c">
					<option value="${c }">${c }</option>
				</c:forEach>
			</select>
			<%-- 시/도 끝 --%>
		</div>
		<script>
			const cityLoad = function(evt) {
				document.querySelectorAll(".col-2-3").forEach(function(one) {
					if (one.dataset.group != evt.target.value) {
						one.name = "";
						one.style.display = "none";
					} else {
						one.name = "search_03";
						one.style.display = "";
					}
				})
			};
			document.querySelector("#area").onchange = cityLoad;

			document.onloadend = cityLoad;
		</script>
		<%-- 지역별검색끝 --%>
		<%-- 테마검색시작 --%>
		<select name="search_04" class="col-2">
			<option value="" selected>테마</option>
			<c:forEach items="${themaList }" var="t">
				<option value="${t }" ${param.thema eq t ? 'selected' : '' }>${t }</option>
			</c:forEach>
		</select>
		<%-- 테마검색끝 --%>
		<button type="submit" class="col-2">검색</button>
	</form>
	<c:forEach items="${camping }" var="c">
		<div onclick="location.href='/detail?id=${c.contentId}'"
			style="border: 1px solid black; cursor: pointer;">
			<%-- 메인이미지 시작 --%>
			<c:choose>
				<c:when test="${empty c.firstImageUrl }">
					<img src="/resource/img/logo_01.png" width="100px" height="100px" />
				</c:when>
				<c:otherwise>
					<img src="${c.firstImageUrl }" width="100px" height="100px" />
				</c:otherwise>
			</c:choose>
			<%-- 메인이미지 끝 --%>
			<div>[${c.doNm } ${c.sigunguNm }] ${c.facltNm }</div>
			<%-- 도 / 시 / 캠핑장이름 --%>
			<div>${c.lineIntro }</div>
			<%-- 펜션 간단한설명 --%>
			<div>주소: ${c.addr1 } ${c.addr2 } / 문의: ${c.tel }</div>
			<div>
				<c:forTokens items="${c.sbrsCl }" delims="," var="f">
					${f }
				</c:forTokens>
			</div>
		</div>
	</c:forEach>
	<!-- 페이징 처리 시작-->
	<div>
		<c:set var="currentPage"
			value="${empty param.pageNo ? 1 : param.pageNo }" />
		<%--처음으로--%>
		<c:if test="${currentPage >= 11}">
			<c:url value="/search" var="target">
				<c:param name="pageNo" value="1" />
				<c:param name="area" value="${param.area }" />
				<c:param name="city" value="${param.city }" />
				<c:param name="thema" value="${param.thema }" />
				<c:param name="keyword" value="${param.keyword }" />
			</c:url>
			<a href="${target}" style="color: black;">&lt;&lt;</a>
		</c:if>
		<%----------%>
		<%--이전버튼--%>
		<c:if test="${existPrev }">
			<c:url value="/search" var="target">
				<c:param name="pageNo" value="${start-1 }" />
				<c:param name="area" value="${param.area }" />
				<c:param name="city" value="${param.city }" />
				<c:param name="thema" value="${param.thema }" />
				<c:param name="keyword" value="${param.keyword }" />
			</c:url>
			<a href="${target}" style="color: black;">&lt;</a>
		</c:if>
		<%----------%>
		<%--현재 누른 페이지--%>
		<c:forEach var="p" begin="${start }" end="${last }">
			<c:url value="/search" var="target">
				<c:param name="pageNo" value="${p }" />
				<c:param name="area" value="${param.area }" />
				<c:param name="city" value="${param.city }" />
				<c:param name="thema" value="${param.thema }" />
				<c:param name="keyword" value="${param.keyword }" />
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
			<c:url value="/search" var="target">
				<c:param name="pageNo" value="${last + 1 }" />
				<c:param name="area" value="${param.area }" />
				<c:param name="city" value="${param.city }" />
				<c:param name="thema" value="${param.thema }" />
				<c:param name="keyword" value="${param.keyword }" />
			</c:url>
			<a href="${target }" style="color: black;">&gt;</a>
		</c:if>
		<%----------%>
		<%--마지막으로--%>
		<c:if test="${param.pageNo <= lastPage - lastPage % 10}">
			<c:url value="/search" var="target">
				<c:param name="pageNo" value="${lastPage }" />
				<c:param name="area" value="${param.area }" />
				<c:param name="city" value="${param.city }" />
				<c:param name="thema" value="${param.thema }" />
				<c:param name="keyword" value="${param.keyword }" />
			</c:url>
			<a href="${target}" style="color: black;">&gt;&gt;</a>
		</c:if>
		<%----------%>
		<!-- 페이징처리 끝 -->
	</div>
	<script>
		document.querySelector("#area").dispatchEvent(new Event("change"));
		document.querySelectorAll(".col-2-3").forEach(one=>{
			if(one.dataset.group === document.querySelector("#area").value) {
				one.name="search_03";
				one.value="${param.city}";
			}
		});
	</script>
</body>
</html>