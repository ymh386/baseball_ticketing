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
	
</style>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="continer-fluid my-5">
	<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
		<!-- contents 내용 작성 -->
		<div class="container text-center mb-5">
			<div class="row align-items-start">
			  <h3>${dto.matchDate}</h3>
			  <div class="col">
				<div class="card" style="width: 18rem;">
					<h3 class="card-title">HOME</h3>
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
						<h5 class="card-semititle">${dto.homeTeamDTO.teamName}</h5>
						<p class="card-text">연고지 : ${dto.homeTeamDTO.field}</p>
					</div>
				</div>
			  </div>
			  <div class="col align-self-center">
				<p>${dto.matchTime}</p>
			  	<h3>${dto.matchStatus}</h3>
			  	<c:choose>
			  		<c:when test="${dto.matchStatus eq '진행 중'}"><h1><span class="badge text-bg-primary">${dto.homeScore} : ${dto.awayScore}</span></h1></c:when>
			  		<c:when test="${dto.matchStatus eq '중단'}"><h1><span class="badge text-bg-warning">${dto.homeScore} : ${dto.awayScore}</span></h1></c:when>
			  		<c:otherwise><h1><span class="badge text-bg-secondary">${dto.homeScore} : ${dto.awayScore}</span></h1></c:otherwise>
			  	</c:choose>
				<p>${dto.homeTeamDTO.field}</p>
			  </div>
			  <div class="col">
				<div class="card" style="width: 18rem;">
					<h3 class="card-title">AWAY</h3>
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
						<h5 class="card-semititle">${dto.awayTeamDTO.teamName}</h5>
						<p class="card-text">연고지 : ${dto.awayTeamDTO.field}</p>
					</div>
				</div>
			  </div>
			</div>
		</div>
		<div class="container text-center">
			<div class="row align-items-start">
			  <div class="col">
			  	<h5>경기장 주변 식당 정보</h5>
				<div id="map" lat="${dto.stadiumDTO.latitude}" lng="${dto.stadiumDTO.longitude}" style="width:500px;height:500px;"></div>
			  </div>
			  <div class="col align-self-center">
				<form>
				  <div class="mb-3">
				    <label class="form-label">경기장</label>
				    <input type="text" class="form-control" value="${dto.stadiumDTO.stadiumName}" readonly>
				  </div>
				  <div class="mb-3">
				    <label class="form-label">지역</label>
				    <input type="text" class="form-control" value="${dto.homeTeamDTO.field}" readonly>
				  </div>
				</form>
				<a class="btn btn-info" href="../stadiums/detail?stadiumNum=${dto.stadiumNum}">경기장 정보 보러가기</a>
			  </div>
			  <div class="col align-self-end">
				<fmt:formatDate var="today" value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/>
				<c:if test="${dto.matchDate >= today and dto.matchStatus eq '진행 전'}">
					<a class="btn btn-success" href="./seatList?matchNum=${dto.matchNum}">예매하기</a>
				</c:if>
					<a class="btn btn-danger" href="./getReviewList?matchNum=${dto.matchNum}">경기 리뷰</a>
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