<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 고캠핑기준 맨위 --%>
	<div style="border: 1px solid black"> 
		<div>${camping.facltNm }</div>
		<div>${camping.lineIntro }</div>
		<c:if test="${camping.themaEnvrnCl != '' }">
			<div>태그 : 
				<c:forTokens items="${camping.themaEnvrnCl }" delims="," var="tag">
					#${tag }
				</c:forTokens>
			</div>
		</c:if>
	</div>
	
	<%-- 고캠핑기준 사진, 메인정보들 --%>
	<div style="border: 1px solid black; display: flex;"> 
		<%-- 사진 --%>
		<div style="flex: 5.5">
			<c:choose>
				<c:when test="${empty camping.firstImageUrl }">
					<img src="/resource/img/logo_01.png"  width="600px" height="500px"/>
				</c:when>
				<c:otherwise>
					<img src="${camping.firstImageUrl }" width="600px" height="500px" onerror="this.src='/resource/img/logo_01.png'"/>
				</c:otherwise>
			</c:choose>
		</div>
		<%-- 메인정보 --%>
		<div style="flex: 4.5">
			<div>주소 : ${camping.addr1 } ${camping.addr2 }</div>
			<div>문의처 : ${camping.tel }</div>
			<div>캠핑장 환경 : ${camping.lctCl } / ${camping.facltDivNm }</div>
			<div>캠핑장 유형 : ${camping.induty }</div>
			<c:if test="${camping.operPdCl != '' || camping.operDeCl != '' }">
				<div>운영기간 : ${camping.operPdCl } [${camping.operDeCl }]</div>
			</c:if>
			<div>홈페이지 : <a href="${camping.homepage }">홈페이지 바로가기</a></div>
			<c:if test="${camping.resveCl != '' }">
				<div>예약방법 : ${camping.resveCl }</div>
			</c:if>
			<c:if test="${camping.posblFcltyCl != '' }">
				<div>주변이용가능시설 : ${camping.posblFcltyCl }</div>
			</c:if>
		</div>
	</div>
	
	<%-- 고캠핑기준 사진3개와 캠핑장 설명 --%>
	<div style="border: 1px solid black; display: flex; flex-direction: column;">
		<%-- 사진3개 --%>
		<div style="flex: 6">
			<c:choose>
				<c:when test="${empty imgs[0] }">
					<img src="/resource/img/logo_01.png" width="200px" height="180px"/>
				</c:when>
				<c:otherwise>
					<img src="${imgs[0] }" width="200px" height="180px"/>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty imgs[1] }">
					<img src="/resource/img/logo_01.png" width="200px" height="180px"/>
				</c:when>
				<c:otherwise>
					<img src="${imgs[1] }" width="200px" height="180px"/>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty imgs[2] }">
					<img src="/resource/img/logo_01.png" width="200px" height="180px"/>
				</c:when>
				<c:otherwise>
					<img src="${imgs[2] }" width="200px" height="180px"/>
				</c:otherwise>
			</c:choose>
		</div>
		<%-- 캠핑장 설명 --%>
		<div style="flex: 4">
			${camping.intro }
		</div>
	</div>
	
	<%-- 고캠핑기준 기타 주요시설 --%>
	<div style="border: 1px solid black;">
		<c:if test="${camping.gnrlSiteCo >= 1 || camping.autoSiteCo >= 1 || camping.glampSiteCo >= 1 || camping.caravSiteCo >= 1 || camping.indvdlCaravSiteCo >= 1 }">
			<div>주요시설 :
				<c:choose>
					<c:when test="${camping.gnrlSiteCo != '0' }">
						일반야영장(${camping.gnrlSiteCo })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.autoSiteCo != '0' }">
						자동차야영장(${camping.autoSiteCo })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.glampSiteCo != '0' }">
						글램핑(${camping.glampSiteCo })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.caravSiteCo != '0' }">
						카라반(${camping.caravSiteCo })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.indvdlCaravSiteCo != '0' }">
						개인 카라반(${camping.indvdlCaravSiteCo })
					</c:when>
				</c:choose>
			</div>
		</c:if>
		<div>기타정보 : 
			<c:choose>
				<c:when test="${camping.trlerAcmpnyAt eq 'Y' }">
					개인 트레일러 입장가능 
				</c:when>
				<c:when test="${camping.caravAcmpnyAt eq 'Y' }">
					개인 카라반 입장가능 
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${camping.animalCmgCl eq '가능' }">
					반려동물 동반 가능
				</c:when>
				<c:otherwise>
					반려동물 동반 불가능
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${camping.sbrsEtc ne '' }">
			<div>기타 부대시설 : 
				${camping.sbrsEtc }
			</div>
		</c:if>
		<c:if test="${camping.sitedStnc ne 0 }">
			<div>사이트 간격 : ${camping.sitedStnc }M</div>
		</c:if>
		<c:if test="${camping.siteBottomCl1 >= 1 || camping.siteBottomCl2 >= 1 || camping.siteBottomCl3 >= 1 || camping.siteBottomCl4 >= 1 || camping.siteBottomCl5 >= 1 }">
			<div>바닥형태 (단위:면) : 
				<c:choose>
					<c:when test="${camping.siteBottomCl1 ne '0' }">
						잔디(${camping.siteBottomCl1 })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.siteBottomCl2 ne '0' }">
						파쇄석(${camping.siteBottomCl2 })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.siteBottomCl3 ne '0' }">
						테크(${camping.siteBottomCl3 })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.siteBottomCl4 ne '0' }">
						자갈(${camping.siteBottomCl4 })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.siteBottomCl5 ne '0' }">
						맨흙(${camping.siteBottomCl5 })
					</c:when>
				</c:choose>
			</div>
		</c:if>
		<c:if test="${camping.siteMg1Width >= 1 || camping.siteMg2Width >= 1 || camping.siteMg3Width >= 1 }">
			<div>사이트 크기 : 
				<c:choose>
					<c:when test="${camping.siteMg1Co >= 1 }">
						${camping.siteMg1Width }X${camping.siteMg1Vrticl } (${camping.siteMg1Co }개)
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.siteMg2Co >= 1 }">
						,${camping.siteMg2Width }X${camping.siteMg2Vrticl } (${camping.siteMg2Co }개)
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.siteMg3Co >= 1 }">
						,${camping.siteMg3Width }X${camping.siteMg3Vrticl } (${camping.siteMg3Co }개)
					</c:when>
				</c:choose>
			</div>
		</c:if>
		<c:if test="${camping.eqpmnLendCl ne '' }">
			<div>캠핑장비대여 : 
				<c:forTokens items="${camping.eqpmnLendCl }" delims="," var="one">
					●${one }
				</c:forTokens>
			</div>
		</c:if>
		<c:if test="${camping.brazierCl ne '' }">
			<div>화로대 : ${camping.brazierCl }</div>
		</c:if>
		<c:if test="${camping.extshrCo >= 1 || camping.frprvtWrppCo >= 1 || camping.frprvtSandCo >= 1 || camping.fireSensorCo >= 1 }">
			<div>안전시설현황 : 
				<c:choose>
					<c:when test="${camping.extshrCo ne 0 }">
						소화기 (${camping.extshrCo })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.frprvtWrppCo ne 0 }">
						방화수 (${camping.frprvtWrppCo })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.frprvtSandCo ne 0 }">
						방화사 (${camping.frprvtSandCo })
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${camping.fireSensorCo ne 0 }">
						화재감시기 (${camping.fireSensorCo })
					</c:when>
				</c:choose>
			</div>
		</c:if>
		<c:if test="${camping.tooltip ne '' }">
			<div>주변관광지 정보 : 
				${camping.tooltip }
			</div>
		</c:if>
	</div>
	<%-- 고캠핑기준 사진들 --%>
	<div style="border: 1px solid black;">
		<c:forEach items="${images }" var="i">
			<img src="${i }" width="150px" height="120px" onerror="this.style='display: none'"/>
		</c:forEach>
	</div>
	
	<div id="map" style="width: 400px; height: 300px; max-width: 400px; border: 1px solid black;">-</div>
		<c:if test="${camping.mapX eq '' || camping.mapY eq '' }">
			위치가 정확하지 않아 지도를 불러오지 못했습니다.
		</c:if>
		<c:if test="${camping.mapX ne '' && camping.mapY ne '' }">
		<div style="margin-top: 10px;">
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94072c8aeb913ec7aeaec91f4cf80dc2"></script>
			<script>
			
				let pos = new kakao.maps.LatLng(${camping.mapY}, ${camping.mapX});
				
				let container = document.querySelector('#map');
				let options = {
					center : pos, 
					level : 4
				};
		
				let map = new kakao.maps.Map(container, options);
				
				let marker = new kakao.maps.Marker({
				    position: pos
				});
				
				marker.setMap(map);
				
			</script>
		</div>
		</c:if>
</body>
</html>