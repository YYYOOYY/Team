<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>캠핑어때?!</title>

<!-- style -->
<link rel="stylesheet" href="/resource/css/style.css?<%=System.currentTimeMillis()%>">

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

</head>

<body>
	<%@ include file="/common/top.jsp"%>
	<section class="search_wrap">
		<div class="search_inner">
			<div class="search_form">
				<!-- 키워드 검색 시작 -->
				<form action="/search">
					<div class="col">
						<input type="text" name="search_01" class="col-2" placeholder="검색"
							autocomplete="off">
						<!-- 키워드 검색 끝 -->
						<!-- 지역별 검색 시작 -->
						<!-- 팔도 검색 시작 -->
						<select id="area" name="search_02" class="col-2-1">
							<%-- search_02, Class col-10 --%>
							<option value="" selected>전체/도</option>
							<c:forEach items="${cityList }" var="c">
								<option value="${c }" ${param.area eq c ? 'selected' : '' }>${c }</option>
							</c:forEach>
						</select>
						<!-- 팔도 검색 끝 -->
						<!-- 시/도 시작 -->
						<select name="search_03" class="col-2-3" data-group="">
							<%-- class = col-100 --%>
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
						<!-- 시/도 끝 -->


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
						<!-- 지역별 검색 끝 -->

						<!-- 테마 검색 시작 -->
						<select name="search_04" class="col-2">
							<option value="" selected>테마</option>
							<c:forEach items="${themaList }" var="t">
								<option value="${t }" ${param.thema eq t ? 'selected' : '' }>${t }</option>
							</c:forEach>
						</select>
						<!-- 테마 검색 끝 -->
						<button type="submit" class="col-2">검색</button>
					</div>
				</form>
			</div>
		</div>

	</section>
	<!-- main search -->



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/resource/js/custom.js"></script>

</body>
</html>