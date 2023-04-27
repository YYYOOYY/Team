<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����������</title>
</head>
<body>
<%@ include file="/common/top.jsp" %>
	<form action="search">
		<%-- Ű����˻����� --%>
		<input type="text" name="keyword">
		<%-- Ű����˻��� --%>
		<%-- �������˻����� --%>
		<div>
		<%-- �ȵ��˻����� --%>
		<select id="area" name="area">
			<option value="">��ü/��</option>
			<c:forEach items="${cityList }" var="c">
				<option value="${c }">${c }</option>
			</c:forEach>
		</select>
		<select name="city" class="city" data-group>
			<option value="">��ü/��/��</option>
		</select>
		<%-- �ȵ��˻��� --%>
		<%-- ��/�� ���� --%>
		<select name="city" style="display: none;" data-group="�����" class="city">
			<c:forTokens items="������,������,���ϱ�,������,���Ǳ�,������,���α�,��õ��,�����,������,���빮��,���۱�,������,���빮��,���ʱ�,������,���ϱ�,���ı�,��õ��,��������,��걸,����,���α�,�߱�,�߶���" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="�λ��" class="city">
			<c:forTokens items="������,������,���屺,����,����,������,�λ�����,�ϱ�,���,���ϱ�,����,������,������,������,�߱�,�ؿ�뱸" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="�뱸��" class="city">
			<c:forTokens items="����,�޼���,�޼���,����,�ϱ�,����,����,������,�߱�" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="��õ��" class="city">
			<c:forTokens items="��ȭ��,��籸,����,������,����,����,����,������,������,�߱�" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="���ֽ�" class="city">
			<c:forTokens items="���걸,����,����,�ϱ�,����" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="������" class="city">
			<c:forTokens items="�����,����,����,������,�߱�" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="����" class="city">
			<c:forTokens items="����,����,�ϱ�,���ֱ�,�߱�" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="������" class="city">
			<c:forTokens items="�ݳ���,������,������,������,������" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="��⵵" class="city">
			<c:forTokens items="����,����,��õ��,�����,���ֽ�,������,������,������,�����ֽ�,����õ��,��õ��,������,������,�����,�Ȼ��,�ȼ���,�Ⱦ��,���ֽ�,����,���ֽ�,��õ��,�����,���ν�,�ǿս�,�����ν�,��õ��,���ֽ�,���ý�,��õ��,�ϳ���,ȭ����" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="������" class="city">
			<c:forTokens items="������,����,���ؽ�,��ô��,���ʽ�,�籸��,��籺,������,���ֽ�,������,������,ö����,��õ��,�¹��,��â��,ȫõ��,ȭõ��,Ⱦ����" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="��û�ϵ�" class="city">
			<c:forTokens items="���걺,�ܾ籺,������,������,��õ��,������,��õ��,����,��õ��,û����,û�ֽ�,���ֽ�" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="��û����" class="city">
			<c:forTokens items="����,���ֽ�,�ݻ걺,����,������,���ɽ�,�ο���,�����,��õ��,�ƻ��,���걺,õ�Ƚ�,û�籺,�¾ȱ�,ȫ����" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="����ϵ�" class="city">
			<c:forTokens items="��â��,�����,������,������,���ֱ�,�ξȱ�,��â��,���ֱ�,�ͻ��,�ӽǱ�,�����,���ֽ�,������,���ȱ�" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="���󳲵�" class="city">
			<c:forTokens items="������,���ﱺ,���,�����,���ʱ�,���ֽ�,��籺,������,���ȱ�,������,��õ��,�žȱ�,������,������,���ϱ�,�ϵ���,�强��,���ﱺ,������,����,�س���,ȭ����" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="���ϵ�" class="city">
			<c:forTokens items="����,���ֽ�,��ɱ�,���̽�,������,��õ��,�����,��ȭ��,���ֽ�,���ֱ�,�ȵ���,������,���籺,���ֽ�,��õ��,��õ��,�︪��,������,�Ǽ���,û����,û�۱�,ĥ�,���׽�" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="��󳲵�" class="city">
			<c:forTokens items="������,��â��,����,���ؽ�,���ر�,�о��,��õ��,��û��,����,�Ƿɱ�,���ֽ�,â�籺,â����,�뿵��,�ϵ���,�Ծȱ�,�Ծ籺,��õ��" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<select name="city" style="display: none;" data-group="���ֵ�" class="city">
			<c:forTokens items="��������,���ֽ�" delims="," var="city">
				<option value="${city }">${city }</option>
			</c:forTokens>
		</select>
		<%-- ��/�� �� --%>
		</div>
		<script>
			document.querySelector("#area").onchange = function(evt) {
				document.querySelectorAll(".city").forEach(function(one) {
					console.log(evt, one)
					if(one.dataset.group != evt.target.value){
						one.style.display = "none";
					}else{
						one.style.display = "";
					}
				})
			};
		</script>
		<%-- �������˻��� --%>
		<%-- �׸��˻����� --%>
		<div>
		<select name="thema">
			<option value="">��ü</option>
			<c:forEach items="${themaList }" var="t">
				<option value="${t }">${t }</option>
			</c:forEach>
		</select>
		</div>
		<%-- �׸��˻��� --%>
		<button type="submit">�˻�</button>
	</form>
</body>
</html>