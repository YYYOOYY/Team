package data.camping;

public class CampingItem {
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
	
	// 바베큐 시설정보 ex) 개별, 공동
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
	
	
}
