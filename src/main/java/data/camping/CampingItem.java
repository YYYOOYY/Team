package data.camping;

public class CampingItem {
	// 캠핑장 ID
	String contentId;
	
	// 상호
	String facltNm;
	
	// 캠핑장 사진
	String firstImageUrl;
	
	// 캠핑장 간단한 설명인트로
	String lineIntro;
	
	// 캠핑장 설명인트로
	String intro;
	
	// 운영하는 곳 ex) 민간
	String facltDivNm;
	
	// 캠핑장 카테고리
	String lctCl;
	
	// 캠핑장의 부가설명 ex) 영청드림랜드는 하계 수영장과 동계 눈썰매장을...
	String featureNm;
	
	// 캠핑장 유형 ex) 일반야영장 or 자동차야영장 등
	String induty;
	
	// 캠핑장 지역(도)
	String doNm;
	
	// 캠핑장 지역(시 / 군)
	String sigunguNm;
	
	// 캠핑장 주소
	String addr1;
	
	// 캠핑장 상세주소(왠만한 데이터는 없음)
	String addr2;
	
	// 캠핑장 위도
	String mapX;
	
	// 캠핑장 경도
	String mapY;
	
	// 캠핑장 오는길 부가설명 ex) 울양양고속도로 강촌IC에서 ... 30분 후 도착
	String direction;
	
	// 대표전화
	String tel;
	
	// 메인홈페이지
	String homepage;
	
	// 예약방법
	String resveCl;
	
	// 주변 관광 팁?
	String tooltip;
	
	// 글램핑 시설정보
	String glampInnerFclty;
	
	// 카라반 시설정보
	String caravInnerFclty;
	
	// 운영시즌 ex) 봄, 여름, 가을, 겨울
	String operPdCl;
	
	// 운영기간 ex) 평일 + 주말
	String operDeCl;
	
	// 바베큐 시설정보 ex) 개별, 공동, 불가
	String brazierCl;
	
	// 캠핑장 시설정보 (고캠핑에 캠핑장 시설정보)
	String sbrsCl;
	
	// 기타 부대시설
	String sbrsEtc;
	
	// 애견동반 가능 유무 ex) 가능 or 불가능
	String animalCmgCl;
	
	// 주변 가능한 취미?
	String posblFcltyCl;
	
	// 캠핑장 태그
	String themaEnvrnCl;

	// 일반야영장 갯수
	String gnrlSiteCo;
	
	// 자동차야영장 갯수
	String autoSiteCo;
	
	// 글램핑 갯수
	String glampSiteCo;
	
	// 카라반 갯수
	String caravSiteCo;
	
	// 개인 카라반 사이트 갯수
	String indvdlCaravSiteCo;
	
	// 사이트 간격
	String sitedStnc;
	
	// 사이트 1 크기 - 가로
	String siteMg1Width;
	
	// 사이트 1 크기 - 세로
	String siteMg1Vrticl;
	
	// 사이트 1 갯수
	String siteMg1Co;
	
	// 사이트 2 크기 - 가로
	String siteMg2Width;
		
	// 사이트 2 크기 - 세로
	String siteMg2Vrticl;
		
	// 사이트 2 갯수
	String siteMg2Co;
		
	// 사이트 3 크기 - 가로
	String siteMg3Width;
	
	// 사이트 3 크기 - 세로
	String siteMg3Vrticl;
		
	// 사이트 3 갯수
	String siteMg3Co;
		
	// 바닥형태 - 파쇄석
	String siteBottomCl2;
	
	// 바닥형태 - 자갈
	String siteBottomCl4;
		
	// 바닥형태 - 테크
	String siteBottomCl3;
	
	// 바닥형태 - 잔디
	String siteBottomCl1;
	
	// 바닥형태 - 맨흙
	String siteBottomCl5;
	
	// 소화기
	String extshrCo;
	
	// 방화수
	String frprvtWrppCo;
	
	// 방화사
	String frprvtSandCo;
	
	// 화재감시기
	String fireSensorCo;
	
	
	public String getFacltNm() {
		return facltNm;
	}

	public String getFirstImageUrl() {
		return firstImageUrl;
	}

	public String getLineIntro() {
		return lineIntro;
	}

	public String getIntro() {
		return intro;
	}

	public String getFacltDivNm() {
		return facltDivNm;
	}

	public String getLctCl() {
		return lctCl;
	}

	public String getFeatureNm() {
		return featureNm;
	}

	public String getInduty() {
		return induty;
	}

	public String getDoNm() {
		return doNm;
	}

	public String getSigunguNm() {
		return sigunguNm;
	}

	public String getAddr1() {
		return addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public String getMapX() {
		return mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public String getTel() {
		return tel;
	}

	public String getHomepage() {
		return homepage;
	}

	public String getResveCl() {
		return resveCl;
	}

	public String getTooltip() {
		return tooltip;
	}

	public String getGlampInnerFclty() {
		return glampInnerFclty;
	}

	public String getCaravInnerFclty() {
		return caravInnerFclty;
	}

	public String getOperPdCl() {
		return operPdCl;
	}

	public String getOperDeCl() {
		return operDeCl;
	}

	public String getBrazierCl() {
		return brazierCl;
	}

	public String getSbrsCl() {
		return sbrsCl;
	}

	public String getSbrsEtc() {
		return sbrsEtc;
	}

	public String getAnimalCmgCl() {
		return animalCmgCl;
	}

	public String getPosblFcltyCl() {
		return posblFcltyCl;
	}

	public String getThemaEnvrnCl() {
		return themaEnvrnCl;
	}

	public String getContentId() {
		return contentId;
	}

	public String getDirection() {
		return direction;
	}

	public String getGnrlSiteCo() {
		return gnrlSiteCo;
	}

	public String getAutoSiteCo() {
		return autoSiteCo;
	}

	public String getGlampSiteCo() {
		return glampSiteCo;
	}

	public String getCaravSiteCo() {
		return caravSiteCo;
	}

	public String getIndvdlCaravSiteCo() {
		return indvdlCaravSiteCo;
	}

	public String getSitedStnc() {
		return sitedStnc;
	}

	public String getSiteMg1Width() {
		return siteMg1Width;
	}

	public String getSiteMg1Vrticl() {
		return siteMg1Vrticl;
	}

	public String getSiteMg1Co() {
		return siteMg1Co;
	}

	public String getSiteMg2Width() {
		return siteMg2Width;
	}

	public String getSiteMg2Vrticl() {
		return siteMg2Vrticl;
	}

	public String getSiteMg2Co() {
		return siteMg2Co;
	}

	public String getSiteMg3Width() {
		return siteMg3Width;
	}

	public String getSiteMg3Vrticl() {
		return siteMg3Vrticl;
	}

	public String getSiteMg3Co() {
		return siteMg3Co;
	}

	public String getSiteBottomCl2() {
		return siteBottomCl2;
	}

	public String getSiteBottomCl4() {
		return siteBottomCl4;
	}

	public String getSiteBottomCl3() {
		return siteBottomCl3;
	}

	public String getSiteBottomCl1() {
		return siteBottomCl1;
	}

	public String getSiteBottomCl5() {
		return siteBottomCl5;
	}

	public String getExtshrCo() {
		return extshrCo;
	}

	public String getFrprvtWrppCo() {
		return frprvtWrppCo;
	}

	public String getFrprvtSandCo() {
		return frprvtSandCo;
	}

	public String getFireSensorCo() {
		return fireSensorCo;
	}
	
	
}
