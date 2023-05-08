<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ķ�ξ?!</title>

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
				<!-- Ű���� �˻� ���� -->
				<form action="/search">
					<div class="col">
						<input type="text" name="search_01" class="col-2" placeholder="�˻�"
							autocomplete="off">
						<!-- Ű���� �˻� �� -->
						<!-- ������ �˻� ���� -->
						<!-- �ȵ� �˻� ���� -->
						<select id="area" name="search_02" class="col-2-1">
							<%-- search_02, Class col-10 --%>
							<option value="" selected>��ü/��</option>
							<c:forEach items="${cityList }" var="c">
								<option value="${c }" ${param.area eq c ? 'selected' : '' }>${c }</option>
							</c:forEach>
						</select>
						<!-- �ȵ� �˻� �� -->
						<!-- ��/�� ���� -->
						<select name="search_03" class="col-2-3" data-group="">
							<%-- class = col-100 --%>
							<option value="" selected>��ü/��/��</option>
						</select> 
						<select style="display: none;" data-group="�����" class="col-2-3">
							<c:forEach items="${seoul }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="�λ��" class="col-2-3">
							<c:forEach items="${busan }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="�뱸��" class="col-2-3">
							<c:forEach items="${daegu }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="��õ��" class="col-2-3">
							<c:forEach items="${incheon }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="���ֽ�" class="col-2-3">
							<c:forEach items="${gwangju }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="������" class="col-2-3">
							<c:forEach items="${daejeon }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="����" class="col-2-3">
							<c:forEach items="${ulsan }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="������" class="col-2-3">
							<c:forEach items="${sejong }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="��⵵" class="col-2-3">
							<c:forEach items="${gyeonggi }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="������" class="col-2-3">
							<c:forEach items="${gangwon }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="��û�ϵ�" class="col-2-3">
							<c:forEach items="${chungcheongbuk }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="��û����" class="col-2-3">
							<c:forEach items="${chungcheongnam }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="����ϵ�" class="col-2-3">
							<c:forEach items="${jeollabuk }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="���󳲵�" class="col-2-3">
							<c:forEach items="${jeollanam }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="���ϵ�" class="col-2-3">
							<c:forEach items="${gyeongsangbuk }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="��󳲵�" class="col-2-3">
							<c:forEach items="${gyeongsangnam }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select> <select style="display: none;" data-group="���ֵ�" class="col-2-3">
							<c:forEach items="${jeju }" var="c">
								<option value="${c }">${c }</option>
							</c:forEach>
						</select>
						<!-- ��/�� �� -->


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
						<!-- ������ �˻� �� -->

						<!-- �׸� �˻� ���� -->
						<select name="search_04" class="col-2">
							<option value="" selected>�׸�</option>
							<c:forEach items="${themaList }" var="t">
								<option value="${t }" ${param.thema eq t ? 'selected' : '' }>${t }</option>
							</c:forEach>
						</select>
						<!-- �׸� �˻� �� -->
						<button type="submit" class="col-2">�˻�</button>
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