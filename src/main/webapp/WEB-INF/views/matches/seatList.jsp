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

<div class="continer-fluid my-5">
	<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
		<!-- contents 내용 작성 -->
		<div data-matchnum="${param.matchNum}" id="mn" class="container text-center">
			<div class="row">
				<div class="col">
				</div>
				<div class="col">
					<h3>좌석선택</h3>
				</div>
				<div class="col">
					<p>C : <button type="button" class="btn btn-warning"></button> 15000원 B : <button type="button" class="btn btn-success"></button>20000원</p>
					<p>A : <button type="button" class="btn btn-primary"></button> 30000원 매진 : <button type="button" class="btn btn-secondary"></button></p>
				</div>
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

<script src="/resources/js/matches/seatList.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>