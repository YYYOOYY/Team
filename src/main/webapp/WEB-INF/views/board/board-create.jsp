<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<c:if test="${error eq 'a' }">
		<span style="color: red">값 똑바로 넣어라</span>
	</c:if>
	<%--중고거래 게시판 물품 등록--%>
	<h3>거래하고싶은 물품을 등록하세요</h3>
	<form action="/board/create-task" method="post"
		enctype="multipart/form-data">
		원하는 거래 장소를 선택 하세요 :
		<select id="area" name="search_02" class="col-2-1">
			<!-- 지역별 검색 시작 -->
			<%-- search_02, Class col-10 --%>
			<option value="" selected>전체/도</option>
			<c:forEach items="${areaList }" var="c">
				<option value="${c }" ${param.area eq c ? 'selected' : '' }>${c }</option>
			</c:forEach>
		</select>
		<!-- 팔도 검색 끝 -->
		<!-- 시/도 시작 -->
		<select name="search_03" class="col-2-3" data-group="">
			<%-- class = col-100 --%>
			<option value="" selected>전체/시/군</option>
		</select> <select style="display: none;" data-group="서울시" class="col-2-3">
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
		
		<p style="color: red; font-size:12px;">(❗지역은 다시 설정할 수 없으니 신중히 선택해 주세요.)</p>
		<div>
			제목 : <input type="text" name="title" placeholder="제목을 입력하세요" /> <input
				type="file" placeholder="파일선택" name="img" accept="image/*" />
		</div>
		<div>
			<textarea style="width: 45%; height: 120px; resize: none" name="body"
				placeholder="캠핑용품을 올리고 내용을 작성해주세요.(판매 금지 물품은 게시가 제한될 수 있어요.)"></textarea>
		</div>
		<div>
			가격 : <input type="text" name="price" placeholder="물품가격을 입력하세요" />
			<button type="submit">등록</button>
		</div>
	</form>

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
</body>
</html>