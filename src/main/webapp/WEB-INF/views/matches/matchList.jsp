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

</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="container-fluid my-5">
	<div class="row col-md-8 offset-md-2">
		<!-- contents 내용 작성 -->
		<h1>경기 리스트</h1>
						
		<div>
		<select id="select1" name="month" onchange="handleOnChange(this)" data-month="${changedMonth}">
				
			<c:forEach var="i" begin="01" end="12">
				<c:choose>
				
					<c:when test="${i < 10}">
						<option value="${i}">0${i}</option>
					</c:when>
					
					<c:otherwise>
						<option value="${i}">${i}</option>
					</c:otherwise>
					
				</c:choose>				
			</c:forEach>
		</select> 월
		</div>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>경기 번호</th>
					<th>경기 일자</th>					
					<th>경기 상세</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="v">
				<tr>
					<td>${v.matchNum}</td>					
					<td>${v.matchDate}</td>					
					<td><button onclick="location.href='./detail?matchNum=${v.matchNum}'">
					보기</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
				
	</div>
</div>


<script src="/resources/js/matches/matchList.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>