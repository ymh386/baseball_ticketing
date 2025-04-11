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
<link rel="stylesheet" href="/resources/css/toTop.css" />
<style>

	.logo {
		width: 100px;
		height: 100px;
	}

	.bolder{
		font-weight: bolder;
	}

	#select1{
		width: 100px;
	}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="container-fluid my-5">
	<div class="row col-md-8 offset-md-2">
		<!-- contents 내용 작성 -->
		<h1 class="bolder">경기일정・결과</h1>
		<c:if test="${not empty sessionScope.user and sessionScope.user.userId eq 'admin'}">
			<div class="row">
				<div class="col-md-4 offset-md-8">
					<a href="./add" class="btn btn-success">경기등록</a>
					<a href="./delete" class="btn btn-danger">경기삭제</a>
				</div>
			</div>
		</c:if>
						
		<div class="mb-3">
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
		
		
		
		
		<table class="table text-center align-middle">
			<thead>				
				<tr>
					
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${list}" var="v" varStatus="vs">

				<tr style="cursor: pointer;" onclick="location.href='./detail?matchNum=${v.matchNum}'">
					<td><h3>${matchDateList[vs.index]}</h3> <p>${matchTimeList[vs.index]}</p></td>
					<td>
						<h5 class = "bolder" style="color:darkgray">
							<c:choose>
								<c:when test="${v.homeTeam eq 1}"><img src="/resources/images/teams/kia.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 2}"><img src="/resources/images/teams/ssg.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 3}"><img src="/resources/images/teams/hanwha.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 4}"><img src="/resources/images/teams/kiwoom.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 5}"><img src="/resources/images/teams/samsung.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 6}"><img src="/resources/images/teams/lotte.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 7}"><img src="/resources/images/teams/kt.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 8}"><img src="/resources/images/teams/lg.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 9}"><img src="/resources/images/teams/nc.jpg" class="logo"></c:when>
								<c:when test="${v.homeTeam eq 10}"><img src="/resources/images/teams/doosan.jpg" class="logo"></c:when>
								<c:otherwise><img src="/resources/images/teams/kbo.jpg" class="logo"></c:otherwise>
							</c:choose>
							VS
							<c:choose>
								<c:when test="${v.awayTeam eq 1}"><img src="/resources/images/teams/kia.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 2}"><img src="/resources/images/teams/ssg.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 3}"><img src="/resources/images/teams/hanwha.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 4}"><img src="/resources/images/teams/kiwoom.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 5}"><img src="/resources/images/teams/samsung.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 6}"><img src="/resources/images/teams/lotte.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 7}"><img src="/resources/images/teams/kt.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 8}"><img src="/resources/images/teams/lg.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 9}"><img src="/resources/images/teams/nc.jpg" class="logo"></c:when>
								<c:when test="${v.awayTeam eq 10}"><img src="/resources/images/teams/doosan.jpg" class="logo"></c:when>
								<c:otherwise><img src="/resources/images/teams/kbo.jpg" class="logo"></c:otherwise>
							</c:choose>
						</h5>
					</td>
					<td class="bolder line">${v.homeTeamDTO.teamName} VS ${v.awayTeamDTO.teamName}</td>
					<td class="line">${v.stadiumDTO.stadiumName}</td>
					<td class="line">${v.matchStatus}</td>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>

<script src="/resources/js/qna/toTop.js"></script>
<script src="/resources/js/matches/matchList.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>