<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<style>
	#div1 {
		height: 110px;
	}
</style>

<div class="content">
	<div class="wrapper-main">
	
		<div class="container">
		    <div class="row justify-content-center my-5">
				<!-- contents 내용 작성 -->
				<div data-matchnum="${param.matchNum}" id="mn" class="container text-center">
					<div id="div1" class="d-flex justify-content-between align-items-center" style="gap: 2rem;">
					    <!-- 제목 영역 -->
					    <div  class="d-flex justify-content-center align-items-center"
						     style="height: 60%; margin-left: 30px;
						            background-color: #e6f0fa;
						            padding: 12px 30px;
						            border-radius: 12px;
						            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);">
						    
						    <h3 style="font-size: 2.5rem; margin: 0; color: #2c3e50; font-weight: 600;">
						        좌석선택
						    </h3>
						</div>
					</div>
					<div class="d-flex justify-content-end align-items-center mb-5">
						<p>C : <button type="button" class="btn btn-warning"></button> 15000원 B : <button type="button" class="btn btn-success"></button>20000원</p>
						<p>A : <button type="button" class="btn btn-primary"></button> 30000원 매진 : <button type="button" class="btn btn-secondary"></button></p>
					</div> 
					
					<div class="row align-items-center">
						<c:forEach items="${list}" var="l">
							<div class="col align-self-center">
								<c:forEach begin="1" end="${l.seatCount}" var="i">
									<c:choose>
										<c:when test="${l.seatLevel eq 'C'}">
											<button data-seatlevel="${l.seatLevel}" type="button" class="btn btn-outline-warning seatBtn">${i}</button>	
										</c:when>
										<c:when test="${l.seatLevel eq 'B'}">
											<button data-seatlevel="${l.seatLevel}" type="button" class="btn btn-outline-success seatBtn">${i}</button>
											</c:when>
										<c:when test="${l.seatLevel eq 'A'}">
											<button data-seatlevel="${l.seatLevel}" type="button" class="btn btn-outline-primary seatBtn">${i}</button>
											</c:when>
									</c:choose>
								</c:forEach>
							</div>
						</c:forEach>
						<c:forEach items="${tlist}" var="t">
							<input data-ticketseat="${t.seatNum}" type="hidden" value="" class="ticketseat">
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="/resources/js/matches/seatList.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>