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
		border: 1px solid darkgray;
	}

	#div1 {
		height: 110px;
	}

	#div2 {
		height: 100%;
		padding:0 43px;
	}

	.table-body {
		border-top: 2px solid darkgrey;
	}

	.table {
		

	}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>


<div class="content">
	<div class="wrapper-main">
		<div class="container">
		    <div class="row justify-content-center my-5">	
		        <div id="div1" class="d-flex justify-content-between align-items-center" style="gap: 2rem;">
				<!-- contents 내용 작성 -->
					<div  class="d-flex justify-content-center align-items-center"
						style="height: 60%; margin-left: 30px;
							background-color: #e6f0fa;
							padding: 12px 30px;
							border-radius: 12px;
							box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);">
						<h1 style="font-size: 2.5rem; margin: 0; color: #2c3e50; font-weight: 600;">경기일정・결과</h1>
					</div>
					
					<div class="d-flex justify-content-center align-items-end" 
					style="height: 100%; margin-right: 30px; margin-bottom: 30px;">
						<select class="form-select" id="select1" name="month" onchange="handleOnChange(this)" data-month="${changedMonth}">
								
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

						<div class="form-check mx-3">
							<label class="form-check-label" for="myTeam">선호 팀 경기보기</label>
							<input myTeamNum="${myTeamNum}" class="form-check-input" type="checkbox" value="" id="myTeam">
						</div>
					</div>
				</div>
				<c:if test="${not empty sessionScope.user and sessionScope.user.userId eq 'admin'}">
					<div style="height: 80px;" class="d-flex justify-content-end align-items-center">
						
						<a href="./add" class="btn btn-success">경기등록</a>
						<a href="./delete" class="btn btn-danger">경기삭제</a>
						
					</div>
				</c:if>
									
				
				
				
				<div id="div2">
					<table class="table text-center align-middle">
						<thead>				
							<tr>
								
							</tr>
						</thead>
						<tbody class="table-body">
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
		</div>	
	</div>
</div>

<script src="/resources/js/qna/toTop.js"></script>
<script src="/resources/js/matches/matchList.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>