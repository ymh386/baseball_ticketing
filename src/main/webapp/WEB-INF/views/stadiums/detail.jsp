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
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="continer-fluid my-5">
	<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
		<!-- contents 내용 작성 -->
		 <div class="container text-center mb-5">
			 <c:choose>
				 <c:when test="${dto.stadiumNum eq 3}"><img src="/resources/images/stadiums/Jamsil.jpg" width="700" height="500"></c:when>
				 <c:when test="${dto.stadiumNum eq 4}"><img src="/resources/images/stadiums/Gochuck.jpg" width="700" height="500"></c:when>
				 <c:when test="${dto.stadiumNum eq 5}"><img src="/resources/images/stadiums/SSG.jpg" width="700" height="500"></c:when>
				 <c:when test="${dto.stadiumNum eq 6}"><img src="/resources/images/stadiums/KT.jpg" width="700" height="500"></c:when>
				 <c:when test="${dto.stadiumNum eq 7}"><img src="/resources/images/stadiums/Hanwha.jpg" width="700" height="500"></c:when>
				 <c:when test="${dto.stadiumNum eq 8}"><img src="/resources/images/stadiums/KIA.jpg" width="700" height="500"></c:when>
				 <c:when test="${dto.stadiumNum eq 9}"><img src="/resources/images/stadiums/Samsung.jpg" width="700" height="500"></c:when>
				 <c:when test="${dto.stadiumNum eq 10}"><img src="/resources/images/stadiums/Lotte.jpg" width="700" height="500"></c:when>
				 <c:otherwise><img src="/resources/images/stadiums/NCjpg.jpg" width="700" height="500"></c:otherwise>
			 </c:choose>
		 </div>
		<div class="container text-center">
			<div class="row align-items-center">
			  <div class="col">
				<div id="map" lat="${dto.latitude}" lng="${dto.longitude}" style="width:500px;height:500px;"></div>
			  </div>
			  <div class="col">
				<form>
					<div class="mb-3">
					  <label class="form-label">경기장</label>
					  <input type="text" class="form-control" value="${dto.stadiumName}" readonly>
					</div>
					<div class="mb-3">
					  <label class="form-label">위도</label>
					  <input type="text" class="form-control" value="${dto.latitude}" readonly>
					</div>
					<div class="mb-3">
						<label class="form-label">경도</label>
						<input type="text" class="form-control" value="${dto.longitude}" readonly>
					</div>
				  </form>
			  </div>
			  <div class="col">
				상세설명칸
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