<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ķ�ξ?!</title>
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
				<span>�±װ˻�</span>
			</button> -->
			<div class="detail_link_btn">
				<h2>�󼼰˻�</h2>
			</div>
			<div class="search_box_inner">
				<%-- �������˻����� --%>
				<ul>
					<li class="tt w-30"><strong class="title">����</strong>
						<div class="select_box">
							<%-- �ȵ��˻� ���� --%>
							<select id="area" name="search_02" class="col-2-1 detail_select">
								<option value="">��ü(��)</option>
								<c:forEach items="${cityList }" var="c">
									<option value="${c }" ${param.area eq c ? 'selected' : '' }>${c }</option>
								</c:forEach>
							</select>
							<%-- �ȵ��˻� �� --%>
						</div></li>
					<li class="w-30">
						<div class="select_box">
							<%-- ��/�� ���� --%>
							<select name="search_03" class="col-2-3 detail_select"
								data-group="">
								<option value="" selected>��ü/��/��</option>
							</select> <select style="display: none;" data-group="�����"
								class="col-2-3 detail_select">
								<c:forEach items="${seoul }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="�λ��"
								class="col-2-3 detail_select">
								<c:forEach items="${busan }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="�뱸��"
								class="col-2-3 detail_select">
								<c:forEach items="${daegu }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="��õ��"
								class="col-2-3 detail_select">
								<c:forEach items="${incheon }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="���ֽ�"
								class="col-2-3 detail_select">
								<c:forEach items="${gwangju }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="������"
								class="col-2-3 detail_select">
								<c:forEach items="${daejeon }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="����"
								class="col-2-3 detail_select">
								<c:forEach items="${ulsan }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="������"
								class="col-2-3 detail_select">
								<c:forEach items="${sejong }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="��⵵"
								class="col-2-3 detail_select">
								<c:forEach items="${gyeonggi }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="������"
								class="col-2-3 detail_select">
								<c:forEach items="${gangwon }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="��û�ϵ�"
								class="col-2-3 detail_select">
								<c:forEach items="${chungcheongbuk }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="��û����"
								class="col-2-3 detail_select">
								<c:forEach items="${chungcheongnam }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="����ϵ�"
								class="col-2-3 detail_select">
								<c:forEach items="${jeollabuk }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="���󳲵�"
								class="col-2-3 detail_select">
								<c:forEach items="${jeollanam }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="���ϵ�"
								class="col-2-3 detail_select">
								<c:forEach items="${gyeongsangbuk }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="��󳲵�"
								class="col-2-3 detail_select">
								<c:forEach items="${gyeongsangnam }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select> <select style="display: none;" data-group="���ֵ�"
								class="col-2-3 detail_select">
								<c:forEach items="${jeju }" var="c">
									<option value="${c }">${c }</option>
								</c:forEach>
							</select>
							<%-- ��/�� �� --%>
						</div>
					</li>
					<%-- �������˻��� --%>
					<%-- �׸��˻����� --%>
					<li class="tt w-30"><strong class="title">�׸�</strong>
						<div class="select_box">
							<select name="search_04" class="col-2 detail_select">
								<option value="" selected>�׸�</option>
								<c:forEach items="${themaList }" var="t">
									<option value="${t }" ${param.thema eq t ? 'selected' : '' }>${t }</option>
								</c:forEach>
							</select>
						</div></li>
				</ul>
				<%-- �׸��˻��� --%>
				<%-- Ű����˻����� --%>
				<ul>
					<li class="tt kwdSearch"><strong class="title">Ű����˻�</strong>
						<div class="input_search">
							<input type="text" name="search_01" class="col-2 search_in"
								placeholder="�˻�" autocomplete="off">
						</div></li>

					<li class="btn">
						<ul>
							<li class="btn_inner">
								<button type="submit" class="col-2 btn-black">�˻�</button>
							</li>
						</ul>
					</li>

				</ul>
				<%-- Ű����˻��� --%>
			</div>
		</form>
	</div>
	<div class="clearfix">
		<div class="cnt_wrap">
			<c:forEach items="${camping }" var="c">
				<div class="board"
					onclick="location.href='/detail?id=${c.contentId}'">
					<div class="board_inner">
						<%-- �����̹��� ���� --%>
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
						<%-- �����̹��� �� --%>
						<div class="board_txt">
							<div class="bold fz20 pb20">[${c.doNm } ${c.sigunguNm }]
								${c.facltNm }</div>
							<%-- �� / �� / ķ�����̸� --%>
							<div class="pb20">${c.lineIntro }</div>
							<%-- ��� �����Ѽ��� --%>
							<div class="pb20">�ּ�: ${c.addr1 } ${c.addr2 } / ����: ${c.tel }</div>
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
			<!-- ����¡ ó�� ����-->
			<div class="text-center pt15 pb10 ws15">
				<c:set var="currentPage"
					value="${empty param.pageNo ? 1 : param.pageNo }" />
				<%--ó������--%>
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
				<%--������ư--%>
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
				<%--���� ���� ������--%>
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
				<%--������ư --%>
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
				<%--����������--%>
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
				<!-- ����¡ó�� �� -->
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