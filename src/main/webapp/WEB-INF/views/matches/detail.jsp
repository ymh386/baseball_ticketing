<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc0f1aedeac18218bc9a1b59e6328574&libraries=services,clusterer,drawing"></script>
<style>
	.card-img-top {
    width: 280px;
    height: 180px;
	}

	.bolder {
		font-weight: bolder;
	}

	#div1 {
		height: 110px;
	}

	#div2 {
		height: 350px;
	}

	#div2-1 {
		display: flex;
		flex-direction: column;
	}

	#div3 {
		
	}

	#div3-1 {
		display: flex;
		flex-direction: column;
	}

	#div3-2 {
		display: flex;
		flex-direction: column;
	}

	#div4 {
		height: 110px;
	}
	
</style>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>



<div class="content">
	<div id="wrapper-main">
		<div class="container">
			<div class="row justify-content-center my-5">

				<div id="div1" class="d-flex justify-content-center align-items-center" style="gap: 2rem;">
					<div  class="d-flex justify-content-center align-items-center"
						style="height: 60%;
						background-color: #e6f0fa;
						padding: 12px 30px;
						border-radius: 12px;
						box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);">
						<h2 style="font-size: 2.5rem; margin: 0; color: #2c3e50; font-weight: 600;" class="fw-bold">${matchDate}</h2>
						
					</div>
				</div>
	
				<div id="div2" class="d-flex justify-content-center align-items-center">
					<!-- contents 내용 작성  -->
					
					<div class="row d-flex justify-content-center align-items-center">
						<div class="col d-flex justify-content-end">
							<div class="card shadow-lg rounded-4 text-center" style="width: 18rem;">
								<h3 class="card-header bolder">HOME</h3>
								<c:choose>
									<c:when test="${dto.homeTeam eq 1}"><img src="/resources/images/teams/kia.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 2}"><img src="/resources/images/teams/ssg.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 3}"><img src="/resources/images/teams/hanwha.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 4}"><img src="/resources/images/teams/kiwoom.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 5}"><img src="/resources/images/teams/samsung.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 6}"><img src="/resources/images/teams/lotte.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 7}"><img src="/resources/images/teams/kt.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 8}"><img src="/resources/images/teams/lg.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 9}"><img src="/resources/images/teams/nc.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.homeTeam eq 10}"><img src="/resources/images/teams/doosan.jpg" class="card-img-top"></c:when>
									<c:otherwise><img src="/resources/images/teams/kbo.jpg" class="card-img-top"></c:otherwise>
								</c:choose>
								<div class="card-body">
									<h5 class="card-semititle bolder">${dto.homeTeamDTO.teamName}</h5>
									<p class="card-text">연고지 : ${dto.homeTeamDTO.field}</p>
								</div>
							</div>
						</div>
						<div class="col d-flex justify-content-center">
							<div id="div2-1" class="text-center">
								<p class="text-muted">${matchTime}</p>
								<h3>${dto.matchStatus}</h3>
								<c:choose>
								<c:when test="${dto.matchStatus eq '진행 전'}"><h1><span class="badge text-bg-light">${dto.homeScore} : ${dto.awayScore}</span></h1></c:when>
									<c:when test="${dto.matchStatus eq '진행 중'}"><h1><span class="badge text-bg-primary">${dto.homeScore} : ${dto.awayScore}</span></h1></c:when>
									<c:when test="${dto.matchStatus eq '중단'}"><h1><span class="badge text-bg-warning">${dto.homeScore} : ${dto.awayScore}</span></h1></c:when>
									<c:otherwise><h1><span class="badge text-bg-secondary">${dto.homeScore} : ${dto.awayScore}</span></h1></c:otherwise>
								</c:choose>
								<p>${dto.homeTeamDTO.field}</p>
							</div>
						</div>
						<div class="col d-flex justify-content-start">
							<div class="card shadow-lg rounded-4 text-center" style="width: 18rem;">
								<h3 class="card-header bolder">AWAY</h3>
								<c:choose>
									<c:when test="${dto.awayTeam eq 1}"><img src="/resources/images/teams/kia.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 2}"><img src="/resources/images/teams/ssg.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 3}"><img src="/resources/images/teams/hanwha.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 4}"><img src="/resources/images/teams/kiwoom.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 5}"><img src="/resources/images/teams/samsung.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 6}"><img src="/resources/images/teams/lotte.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 7}"><img src="/resources/images/teams/kt.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 8}"><img src="/resources/images/teams/lg.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 9}"><img src="/resources/images/teams/nc.jpg" class="card-img-top"></c:when>
									<c:when test="${dto.awayTeam eq 10}"><img src="/resources/images/teams/doosan.jpg" class="card-img-top"></c:when>
									<c:otherwise><img src="/resources/images/teams/kbo.jpg" class="card-img-top"></c:otherwise>
								</c:choose>
								<div class="card-body">
									<h5 class="card-semititle bolder">${dto.awayTeamDTO.teamName}</h5>
									<p class="card-text">연고지 : ${dto.awayTeamDTO.field}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="div3">
					<div class="row d-flex justify-content-start align-items-center mt-5">
						<div class="col d-flex justify-content-center">
							<div id="div3-1">
								<h5  class="bolder text-center">경기장 주변 식당 정보</h5>
								<div id="map" lat="${dto.stadiumDTO.latitude}" lng="${dto.stadiumDTO.longitude}" style="width:400px;height:400px;" class="border rounded-3 shadow-sm"></div>
							</div>
						</div>
						<div class="col">
							
							<form style="width: 488px;">
								<div class="mb-3">
								<label class="form-label">경기장</label>
								<input type="text" class="form-control" value="${dto.stadiumDTO.stadiumName}" readonly>
								</div>
								<div class="mb-3">
								<label class="form-label">지역</label>
								<input type="text" class="form-control" value="${dto.homeTeamDTO.field}" readonly>
								</div>
							</form>
							<a class="btn btn-outline-info" href="../stadiums/detail?stadiumNum=${dto.stadiumNum}">경기장 정보 보러가기</a>
						</div>
					</div>
				</div>
				<div id="div4" class="d-flex justify-content-end align-items-center">
					<fmt:formatDate var="today" value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/>
					<c:if test="${dto.matchDate >= today and dto.matchStatus eq '진행 전'}">
						<a class="btn btn-outline-dark" href="./seatList?matchNum=${dto.matchNum}">예매하기</a>
					</c:if>
					<a class="btn btn-outline-dark" href="./getReviewList?matchNum=${dto.matchNum}">경기 리뷰</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/matches/detail.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>