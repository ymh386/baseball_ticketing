<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc0f1aedeac18218bc9a1b59e6328574&libraries=services,clusterer,drawing"></script>
<style>

	#div1 {
		height: 110px;
	}

	#div2-1{
		display: flex;
		flex-direction: column;
	}

</style>

</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="content">
	<div id="wrapper-main">
		<div class="container">
			<div class="row justify-content-center my-5">
				<!-- contents 내용 작성 -->
				<div id="div1" class="d-flex justify-content-between align-items-center" style="gap: 2rem;">
					<div  class="d-flex justify-content-center align-items-center"
						style="height: 60%; margin-left: 90px;
						background-color: #e6f0fa;
						padding: 12px 30px;
						border-radius: 12px;
						box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);">
						<h1 style="font-size: 2.5rem; margin: 0; color: #2c3e50; font-weight: 600;" class="fw-bold">${dto.stadiumName}</h1>
						
					</div>
				</div>
				<div class="container text-center mb-5">
					<c:choose>
						<c:when test="${dto.stadiumNum eq 3}"><img src="/resources/images/stadiums/Jamsil.webp" width="1000" height="500" class="border rounded-5 shadow-sm"></c:when>
						<c:when test="${dto.stadiumNum eq 4}"><img src="/resources/images/stadiums/Gochuck.webp" width="1000" height="500" class="border rounded-5 shadow-sm"></c:when>
						<c:when test="${dto.stadiumNum eq 5}"><img src="/resources/images/stadiums/SSG.webp" width="1000" height="500" class="border rounded-5 shadow-sm"></c:when>
						<c:when test="${dto.stadiumNum eq 6}"><img src="/resources/images/stadiums/KT.webp" width="1000" height="500" class="border rounded-5 shadow-sm"></c:when>
						<c:when test="${dto.stadiumNum eq 7}"><img src="/resources/images/stadiums/Hanwha.webp" width="1000" height="500" class="border rounded-5 shadow-sm"></c:when>
						<c:when test="${dto.stadiumNum eq 8}"><img src="/resources/images/stadiums/KIA.webp" width="1000" height="500" class="border rounded-5 shadow-sm"></c:when>
						<c:when test="${dto.stadiumNum eq 9}"><img src="/resources/images/stadiums/Samsung.webp" width="1000" height="500" class="border rounded-5 shadow-sm"></c:when>
						<c:when test="${dto.stadiumNum eq 10}"><img src="/resources/images/stadiums/Lotte.webp" width="1000" height="500" class="border rounded-5 shadow-sm"></c:when>
						<c:otherwise><img src="/resources/images/stadiums/NC.webp" width="1000" height="500" class="border rounded-3 shadow-sm"></c:otherwise>
					</c:choose>
				</div>
				<div id="div2">
					<div class="row d-flex justify-content-start align-items-center mt-5">
						<div class="col d-flex justify-content-center">
							<div id="div2-1">
								<div id="map" lat="${dto.latitude}" lng="${dto.longitude}" style="width:400px;height:400px;" class="border rounded-3 shadow-sm"></div>
								<c:choose>
									<c:when test="${dto.stadiumNum eq 3}"><p class="mt-3"><a href="https://namu.wiki/w/%EC%84%9C%EC%9A%B8%EC%A2%85%ED%95%A9%EC%9A%B4%EB%8F%99%EC%9E%A5%20%EC%95%BC%EA%B5%AC%EC%9E%A5">잠실야구장 정보 보러가기</a> 출처:나무위키</p></c:when>
									<c:when test="${dto.stadiumNum eq 4}"><p class="mt-3"><a href="https://namu.wiki/w/%EA%B3%A0%EC%B2%99%20%EC%8A%A4%EC%B9%B4%EC%9D%B4%EB%8F%94">고척스카이돔 정보 보러가기</a> 출처:나무위키</p></c:when>
									<c:when test="${dto.stadiumNum eq 5}"><p class="mt-3"><a href="https://namu.wiki/w/%EC%9D%B8%EC%B2%9C%20SSG%20%EB%9E%9C%EB%8D%94%EC%8A%A4%ED%95%84%EB%93%9C">SSG랜더스필드 정보 보러가기</a> 출처:나무위키</p></c:when>
									<c:when test="${dto.stadiumNum eq 6}"><p class="mt-3"><a href="https://namu.wiki/w/%EC%88%98%EC%9B%90%20%EC%BC%80%EC%9D%B4%ED%8B%B0%20%EC%9C%84%EC%A6%88%20%ED%8C%8C%ED%81%AC">KT위즈파크 정보 보러가기</a> 출처:나무위키</p></c:when>
									<c:when test="${dto.stadiumNum eq 7}"><p class="mt-3"><a href="https://namu.wiki/w/%EB%8C%80%EC%A0%84%20%ED%95%9C%ED%99%94%EC%83%9D%EB%AA%85%20%EB%B3%BC%ED%8C%8C%ED%81%AC">대전한화생명볼파크 정보 보러가기</a> 출처:나무위키</p></c:when>
									<c:when test="${dto.stadiumNum eq 8}"><p class="mt-3"><a href="https://namu.wiki/w/%EA%B4%91%EC%A3%BC-%EA%B8%B0%EC%95%84%20%EC%B1%94%ED%94%BC%EC%96%B8%EC%8A%A4%20%ED%95%84%EB%93%9C">광주챔피언스필드 정보 보러가기</a> 출처:나무위키</p></c:when>
									<c:when test="${dto.stadiumNum eq 9}"><p class="mt-3"><a href="https://namu.wiki/w/%EB%8C%80%EA%B5%AC%20%EC%82%BC%EC%84%B1%20%EB%9D%BC%EC%9D%B4%EC%98%A8%EC%A6%88%20%ED%8C%8C%ED%81%AC">대구라이온즈파크 정보 보러가기</a> 출처:나무위키</p></c:when>
									<c:when test="${dto.stadiumNum eq 10}"><p class="mt-3"><a href="https://namu.wiki/w/%EC%82%AC%EC%A7%81%20%EC%95%BC%EA%B5%AC%EC%9E%A5">사직야구장 정보 보러가기</a> 출처:나무위키</p></c:when>
									<c:when test="${dto.stadiumNum eq 11}"><p class="mt-3"><a href="https://namu.wiki/w/%EC%B0%BD%EC%9B%90%20NC%20%ED%8C%8C%ED%81%AC">창원NC파크 정보 보러가기</a> 출처:나무위키</p></c:when>
								</c:choose>
							</div>
						</div>
						<div class="col align-self-start">
							<form style="width: 488px;">
								<div class="mb-3">
								<label class="form-label">경기장</label>
								<input type="text" class="form-control" value="${dto.stadiumName}" readonly>
								</div>
								<div class="mb-3">
								<label class="form-label">(지역)주소</label>
								<c:choose>
									<c:when test="${dto.stadiumNum eq 3}"><input type="text" class="form-control" value="(서울)서울특별시 송파구 올림픽로 25(잠실동)" readonly></c:when>
									<c:when test="${dto.stadiumNum eq 4}"><input type="text" class="form-control" value="(서울)서울특별시 구로구 경인로 430(고척동)" readonly></c:when>
									<c:when test="${dto.stadiumNum eq 5}"><input type="text" class="form-control" value="(인천)인천광역시 미추홀구 매소홀로 618" readonly></c:when>
									<c:when test="${dto.stadiumNum eq 6}"><input type="text" class="form-control" value="(경기 수원)경기도 수원시 장안구 경수대로 893" readonly></c:when>
									<c:when test="${dto.stadiumNum eq 7}"><input type="text" class="form-control" value="(대전)대전광역시 중구 대종로 373" readonly></c:when>
									<c:when test="${dto.stadiumNum eq 8}"><input type="text" class="form-control" value="(광주)광주광역시 북구 서림로 10" readonly></c:when>
									<c:when test="${dto.stadiumNum eq 9}"><input type="text" class="form-control" value="(대구)대구광역시 수성구 야구전설로 1" readonly></c:when>
									<c:when test="${dto.stadiumNum eq 10}"><input type="text" class="form-control" value="(부산)부산광역시 동래구 사직로 45(사직동)" readonly></c:when>
									<c:when test="${dto.stadiumNum eq 11}"><input type="text" class="form-control" value="(경남 창원)경상남도 창원시 마산회원구 삼호로 63" readonly></c:when>
								</c:choose>
								</div>
								<div class="mb-3">
									<label class="form-label">좌석 수</label>
									<c:choose>
										<c:when test="${dto.stadiumNum eq 3}"><input type="text" class="form-control" value="23,750석" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 4}"><input type="text" class="form-control" value="16,600석" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 5}"><input type="text" class="form-control" value="23,300석" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 6}"><input type="text" class="form-control" value="18,700석" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 7}"><input type="text" class="form-control" value="20,007석" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 8}"><input type="text" class="form-control" value="20,500석" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 9}"><input type="text" class="form-control" value="24,000석" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 10}"><input type="text" class="form-control" value="22,665석" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 11}"><input type="text" class="form-control" value="18,000석" readonly></c:when>
								</c:choose>
								</div>
								<div class="mb-3">
									<label class="form-label">홈 구단</label>
									<c:choose>
										<c:when test="${dto.stadiumNum eq 3}"><input type="text" class="form-control" value="LG트윈스, 두산베어스" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 4}"><input type="text" class="form-control" value="키움히어로즈" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 5}"><input type="text" class="form-control" value="SSG랜더스" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 6}"><input type="text" class="form-control" value="KT위즈" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 7}"><input type="text" class="form-control" value="한화이글스" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 8}"><input type="text" class="form-control" value="KIA타이거즈" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 9}"><input type="text" class="form-control" value="삼성라이온즈" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 10}"><input type="text" class="form-control" value="롯데자이언츠" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 11}"><input type="text" class="form-control" value="NC다이노스" readonly></c:when>
									</c:choose>
								</div>
								<div class="mb-3">
									<label class="form-label">덕아웃</label>
									<c:choose>
										<c:when test="${dto.stadiumNum eq 3}"><input type="text" class="form-control" value="1루(홈)/3루(원정)" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 4}"><input type="text" class="form-control" value="1루(홈)/3루(원정)" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 5}"><input type="text" class="form-control" value="1루(홈)/3루(원정)" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 6}"><input type="text" class="form-control" value="1루(홈)/3루(원정)" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 7}"><input type="text" class="form-control" value="1루(홈)/3루(원정)" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 8}"><input type="text" class="form-control" value="3루(홈)/1루(원정)" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 9}"><input type="text" class="form-control" value="3루(홈)/1루(원정)" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 10}"><input type="text" class="form-control" value="1루(홈)/3루(원정)" readonly></c:when>
										<c:when test="${dto.stadiumNum eq 11}"><input type="text" class="form-control" value="1루(홈)/3루(원정)" readonly></c:when>
									</c:choose>
								</div>
							</form>
						</div>
					</div>  	
				</div>
			</div>
		</div>
	</div>
</div>

<script src="/resources/js/stadiums/detail.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>