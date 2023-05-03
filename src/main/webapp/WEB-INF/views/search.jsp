<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ķ�ξ?!</title>
</head>
<body>
	<%@ include file="/common/top.jsp"%>
	<form action="/search">
		<%-- Ű����˻����� --%>
		<input type="text" name="search_01" class="col-2" placeholder="�˻�"
			autocomplete="off">
		<%-- Ű����˻��� --%>
		<%-- �������˻����� --%>
		<div>
			<%-- �ȵ��˻� ���� --%>
			<select id="area" name="search_02" class="col-2-1">
				<option value="">��ü(��)</option>
				<c:forEach items="${cityList }" var="c">
					<option value="${c }" ${param.area eq c ? 'selected' : '' }>${c }</option>
				</c:forEach>
			</select>
			<%-- �ȵ��˻� �� --%>
			<%-- ��/�� ���� --%>
			<select name="search_03" class="col-2-3" data-group="">
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
			<%-- ��/�� �� --%>
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
		<%-- �������˻��� --%>
		<%-- �׸��˻����� --%>
		<select name="search_04" class="col-2">
			<option value="" selected>�׸�</option>
			<c:forEach items="${themaList }" var="t">
				<option value="${t }" ${param.thema eq t ? 'selected' : '' }>${t }</option>
			</c:forEach>
		</select>
		<%-- �׸��˻��� --%>
		<button type="submit" class="col-2">�˻�</button>
	</form>
	<c:forEach items="${camping }" var="c">
		<div onclick="location.href='/detail?id=${c.contentId}'"
			style="border: 1px solid black; cursor: pointer;">
			<%-- �����̹��� ���� --%>
			<c:choose>
				<c:when test="${empty c.firstImageUrl }">
					<img src="/resource/img/logo_01.png" width="100px" height="100px" />
				</c:when>
				<c:otherwise>
					<img src="${c.firstImageUrl }" width="100px" height="100px" />
				</c:otherwise>
			</c:choose>
			<%-- �����̹��� �� --%>
			<div>[${c.doNm } ${c.sigunguNm }] ${c.facltNm }</div>
			<%-- �� / �� / ķ�����̸� --%>
			<div>${c.lineIntro }</div>
			<%-- ��� �����Ѽ��� --%>
			<div>�ּ�: ${c.addr1 } ${c.addr2 } / ����: ${c.tel }</div>
			<div>
				<c:forTokens items="${c.sbrsCl }" delims="," var="f">
					${f }
				</c:forTokens>
			</div>
		</div>
	</c:forEach>
	<!-- ����¡ ó�� ����-->
	<div>
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