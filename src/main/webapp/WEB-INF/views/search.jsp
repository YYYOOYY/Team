<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>캠핑어때?!</title>
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
	<div class="search_box">
		<form action="/search">
			<!-- <button class="tag_link_btn">
				<span>태그검색</span>
			</button> -->
			<div class="detail_link_btn">
				<h2>상세검색</h2>
			</div>
			<div class="search_box_inner">
				<%-- 지역별검색시작 --%>
				<ul>
					<li class="tt w-30"><strong class="title">지역</strong>
						<div class="select_box">
							<%-- 팔도검색 시작 --%>
							<select id="area" name="search_02" class="col-2-1 detail_select">
								<option value="">전체(도)</option>
								<c:forEach items="${cityList }" var="c">
									<option value="${c }" ${param.area eq c ? 'selected' : '' }>${c }</option>
								</c:forEach>
							</select>
							<%-- 팔도검색 끝 --%>
						</div></li>
					<li class="w-30">
						<div class="select_box">
							<%-- 시/도 시작 --%>
							<select name="search_03" class="col-2-3 detail_select"
								data-group="">
								<option value="" selected>전체/시/군</option>
							</select> <select style="display: none;" data-group="서울시"
								class="col-2-3 detail_select">
								<c:forEach items="${seoul }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="부산시"
								class="col-2-3 detail_select">
								<c:forEach items="${busan }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="대구시"
								class="col-2-3 detail_select">
								<c:forEach items="${daegu }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="인천시"
								class="col-2-3 detail_select">
								<c:forEach items="${incheon }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="광주시"
								class="col-2-3 detail_select">
								<c:forEach items="${gwangju }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="대전시"
								class="col-2-3 detail_select">
								<c:forEach items="${daejeon }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="울산시"
								class="col-2-3 detail_select">
								<c:forEach items="${ulsan }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="세종시"
								class="col-2-3 detail_select">
								<c:forEach items="${sejong }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="경기도"
								class="col-2-3 detail_select">
								<c:forEach items="${gyeonggi }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="강원도"
								class="col-2-3 detail_select">
								<c:forEach items="${gangwon }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="충청북도"
								class="col-2-3 detail_select">
								<c:forEach items="${chungcheongbuk }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="충청남도"
								class="col-2-3 detail_select">
								<c:forEach items="${chungcheongnam }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="전라북도"
								class="col-2-3 detail_select">
								<c:forEach items="${jeollabuk }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="전라남도"
								class="col-2-3 detail_select">
								<c:forEach items="${jeollanam }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="경상북도"
								class="col-2-3 detail_select">
								<c:forEach items="${gyeongsangbuk }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="경상남도"
								class="col-2-3 detail_select">
								<c:forEach items="${gyeongsangnam }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="제주도"
								class="col-2-3 detail_select">
								<c:forEach items="${jeju }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select>
							<%-- 시/도 끝 --%>
						</div>
					</li>
					<%-- 지역별검색끝 --%>
					<%-- 테마검색시작 --%>
					<li class="tt w-30"><strong class="title">테마</strong>
						<div class="select_box">
							<select name="search_04" class="col-2 detail_select">
								<option value="" selected>테마</option>
								<c:forEach items="${themaList }" var="t">
									<option value="${t }" ${param.thema eq t ? 'selected' : '' }>${t }</option>
								</c:forEach>
							</select>
						</div></li>
				</ul>
				<%-- 테마검색끝 --%>
				<%-- 키워드검색시작 --%>
				<ul>
					<li class="tt kwdSearch"><strong class="title">키워드검색</strong>
						<div class="input_search">
							<input type="text" name="search_01" class="col-2 search_in"
								placeholder="검색" autocomplete="off">
						</div></li>

					<li class="btn">
						<ul>
							<li class="btn_inner">
								<button type="submit" class="col-2 btn-black">검색</button>
							</li>
						</ul>
					</li>

				</ul>
				<%-- 키워드검색끝 --%>
			</div>
		</form>
	</div>
	<div class="clearfix">
		<div class="cnt_wrap">
			<c:forEach items="${camping }" var="c">
				<div class="board"
					onclick="location.href='/detail?id=${c.contentId}'">
					<div class="board_inner">
						<%-- 메인이미지 시작 --%>
						<div class="board_img">
							<c:choose>
								<c:when test="${empty c.firstImageUrl }">
									<img src="/resource/img/logo_01.png" width="100px"
										height="100px" />
								</c:when>
								<c:otherwise>
									<img src="${c.firstImageUrl }" width="100px" height="100px" onerror="this.src='/resource/img/logo_01.png'"/>
								</c:otherwise>
							</c:choose>
						</div>
						<%-- 메인이미지 끝 --%>
						<div class="board_txt">
							<div class="bold fz20 pb20">[${c.doNm } ${c.sigunguNm }]
								${c.facltNm }</div>
							<%-- 도 / 시 / 캠핑장이름 --%>
							<div class="pb20">${c.lineIntro }</div>
							<%-- 펜션 간단한설명 --%>
							<div class="pb20">주소: ${c.addr1 } ${c.addr2 } / 문의: ${c.tel }</div>
							<div class="txt_box">
								<c:forEach items="${c.sbrsClItems }" var="s">
									<div class="iz">
										<div>
											<img src="${s.resource }"  style="width: 100%;height: 100%"/>
										</div>
										<div>${s.name }</div>
									</div>

								</c:forEach>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>
			<script>
						const cityLoad = function(evt) {
							document
									.querySelectorAll(".col-2-3")
									.forEach(
											function(one) {
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
			<!-- 페이징 처리 시작-->
			<div class="text-center pt15 pb10 ws15">
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
		</div>
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/resource/js/custom.js"></script>
</body>
</html>