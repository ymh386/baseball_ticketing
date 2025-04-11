<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">

</head>
<body>

<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<%-- <div class="container my-5">
	<div class="row">
		<!-- 왼쪽: 유저 정보 카드 -->
		<div class="col-md-4">
			<div class="card p-4 shadow-sm">
				<h2 class="text-center mb-4">${user.name}님 마이페이지</h2>
				
				<div class="alert alert-primary">
					<strong>포인트:</strong> ${user.point}P
				</div>

				<!-- 버튼 목록 -->
				<div class="d-grid gap-2 mt-4">
					<button class="btn btn-outline-primary" onclick="location.href='./pwUpdate'">비밀번호 변경</button>
					<button class="btn btn-outline-success" onclick="location.href='./getTicket'">티켓 확인</button>
					<button class="btn btn-outline-info" onclick="location.href='../tickets/paymentList'">결제 내역</button>
					<button class="btn btn-outline-danger" onclick="location.href='./userDelete'">회원탈퇴</button>
				</div>
			</div>
		</div>

		<!-- 오른쪽: 팀 정보 및 경기 일정 -->
		<div class="col-md-8 d-flex flex-column gap-4">
			<!-- MY TEAM 정보 -->
			<div class="card p-4 shadow-sm">
				<h3 class="text-center">MY TEAM</h3>

				<c:set var="teamName"
					value="${user.teamNum == 1 ? '기아 타이거즈' : 
					         user.teamNum == 2 ? 'SSG 랜더스' : 
					         user.teamNum == 3 ? '한화 이글스' :
					         user.teamNum == 4 ? '키움 히어로즈' : 
					         user.teamNum == 5 ? '삼성 라이온즈' : 
					         user.teamNum == 6 ? '롯데 자이언츠' : 
					         user.teamNum == 7 ? '케이티 위즈' : 
					         user.teamNum == 8 ? '엘지 트윈스' : 
					         user.teamNum == 9 ? '엔씨 다이노스' : 
					         user.teamNum == 10 ? '두산 베어스' : '미지정'}" />

				<div class="text-center mt-3">
					<h4>${teamName}</h4>
					<img
						src="${pageContext.request.contextPath}/resources/images/teams/${
							teamName == '기아 타이거즈' ? 'kia' :
							teamName == 'SSG 랜더스' ? 'ssg' :
							teamName == '한화 이글스' ? 'hanwha' :
							teamName == '키움 히어로즈' ? 'kiwoom' :
							teamName == '삼성 라이온즈' ? 'samsung' :
							teamName == '롯데 자이언츠' ? 'lotte' :
							teamName == '케이티 위즈' ? 'kt' :
							teamName == '엘지 트윈스' ? 'lg' :
							teamName == '엔씨 다이노스' ? 'nc' :
							teamName == '두산 베어스' ? 'doosan' : 'kbo'}.jpg"
						alt="${teamName} 로고"
						style="width: 280px; height: 180px;" class="mt-2">
				</div>
			</div>

			<!-- 팀의 다가오는 경기 리스트 -->
			<c:if test="${not empty myTeamMatches}">
				<div class="card p-4 shadow-sm">
					<h5 class="mb-3">다가오는 경기 일정</h5>
					<table class="table table-bordered text-center">
						<thead class="table-light">
							<tr>
								<th>홈팀</th>
								<th>어웨이팀</th>
								<th>경기 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="match" items="${team}">
								<tr>
									<td>${match.homeTeam}</td>
									<td>${match.awayTeam}</td>
									<td><fmt:formatDate value="${match.matchDate}" pattern="yyyy-MM-dd HH:mm" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>

			<!-- 다음 경기 -->
			<c:set var="homeTeamName"
				value="${upcomingMatch.homeTeam == 1 ? '기아 타이거즈' :
				       upcomingMatch.homeTeam == 2 ? 'SSG 랜더스' :
				       upcomingMatch.homeTeam == 3 ? '한화 이글스' :
				       upcomingMatch.homeTeam == 4 ? '키움 히어로즈' :
				       upcomingMatch.homeTeam == 5 ? '삼성 라이온즈' :
				       upcomingMatch.homeTeam == 6 ? '롯데 자이언츠' :
				       upcomingMatch.homeTeam == 7 ? '케이티 위즈' :
				       upcomingMatch.homeTeam == 8 ? '엘지 트윈스' :
				       upcomingMatch.homeTeam == 9 ? '엔씨 다이노스' :
				       upcomingMatch.homeTeam == 10 ? '두산 베어스' : '미지정'}" />

			<c:set var="awayTeamName"
				value="${upcomingMatch.awayTeam == 1 ? '기아 타이거즈' :
				       upcomingMatch.awayTeam == 2 ? 'SSG 랜더스' :
				       upcomingMatch.awayTeam == 3 ? '한화 이글스' :
				       upcomingMatch.awayTeam == 4 ? '키움 히어로즈' :
				       upcomingMatch.awayTeam == 5 ? '삼성 라이온즈' :
				       upcomingMatch.awayTeam == 6 ? '롯데 자이언츠' :
				       upcomingMatch.awayTeam == 7 ? '케이티 위즈' :
				       upcomingMatch.awayTeam == 8 ? '엘지 트윈스' :
				       upcomingMatch.awayTeam == 9 ? '엔씨 다이노스' :
				       upcomingMatch.awayTeam == 10 ? '두산 베어스' : '미지정'}" />

			<c:if test="${not empty upcomingMatch}">
				<div class="card p-4 shadow-sm">
					<h5 class="text-center mb-3">${teamName}의 다음 경기</h5>
					<div class="row text-center">
						<div class="col-md-4">
							<strong>홈팀</strong><br>${homeTeamName}
						</div>
						<div class="col-md-4">
							<strong>VS</strong><br>
							<fmt:formatDate value="${upcomingMatch.matchDate}" pattern="yyyy-MM-dd HH:mm" />
						</div>
						<div class="col-md-4">
							<strong>어웨이팀</strong><br>${awayTeamName}
						</div>
					</div>
				</div>
			</c:if>

			<c:if test="${empty upcomingMatch}">
				<div class="alert alert-warning text-center">
					등록된 선호팀의 예정된 경기가 없습니다.
				</div>
			</c:if>
		</div>
	</div>
</div>
 --%>



<div class="container my-5">
    <div class="row">

        <!-- 유저 정보 -->
        <div class="col-md-4 mb-3">
            <div class="card p-4 text-center shadow-sm h-100">
                <img src="${pageContext.request.contextPath}/resources/images/teams/kbo.jpg"
                     alt="프로필" class="rounded-circle mb-3" width="80">
                <h5 class="mb-1">${user.name}</h5>
                <hr>

                <!-- MY TEAM 영역 (작고 간결하게) -->
                <div class="card p-3 shadow-sm mt-2" style="font-size: 0.9rem;">
                    <h6 class="text-center mb-2" style="font-weight: bold;">MY TEAM</h6>

                    <c:set var="teamName"
                        value="${user.teamNum == 1 ? '기아 타이거즈' : 
                                 user.teamNum == 2 ? 'SSG 랜더스' : 
                                 user.teamNum == 3 ? '한화 이글스' :
                                 user.teamNum == 4 ? '키움 히어로즈' : 
                                 user.teamNum == 5 ? '삼성 라이온즈' : 
                                 user.teamNum == 6 ? '롯데 자이언츠' : 
                                 user.teamNum == 7 ? '케이티 위즈' : 
                                 user.teamNum == 8 ? '엘지 트윈스' : 
                                 user.teamNum == 9 ? '엔씨 다이노스' : 
                                 user.teamNum == 10 ? '두산 베어스' : '미지정'}" />

                    <div class="text-center">
                        <div class="mb-2" style="font-weight: 500;">${teamName}</div>
                        <img
                            src="${pageContext.request.contextPath}/resources/images/teams/${
                                teamName == '기아 타이거즈' ? 'kia' :
                                teamName == 'SSG 랜더스' ? 'ssg' :
                                teamName == '한화 이글스' ? 'hanwha' :
                                teamName == '키움 히어로즈' ? 'kiwoom' :
                                teamName == '삼성 라이온즈' ? 'samsung' :
                                teamName == '롯데 자이언츠' ? 'lotte' :
                                teamName == '케이티 위즈' ? 'kt' :
                                teamName == '엘지 트윈스' ? 'lg' :
                                teamName == '엔씨 다이노스' ? 'nc' :
                                teamName == '두산 베어스' ? 'doosan' : 'kbo'}.jpg"
                            alt="${teamName} 로고"
                            style="width: 100px; height: auto;"
                            class="img-fluid mt-1">
                    </div>
                </div>
            </div>
        </div>

        <!-- 포인트 카드 -->
        <div class="col-md-4 mb-3">
            <div class="card text-center shadow-sm p-4 h-100 d-flex flex-column justify-content-center align-items-center">
                  <div class="text-center">
                        <div class="mb-2" style="font-weight: 500;"><h3 class="">point card</h3></div>
                        <img
                            src="${pageContext.request.contextPath}/resources/images/teams/${
                                teamName == '기아 타이거즈' ? 'kia' :
                                teamName == 'SSG 랜더스' ? 'ssg' :
                                teamName == '한화 이글스' ? 'hanwha' :
                                teamName == '키움 히어로즈' ? 'kiwoom' :
                                teamName == '삼성 라이온즈' ? 'samsung' :
                                teamName == '롯데 자이언츠' ? 'lotte' :
                                teamName == '케이티 위즈' ? 'kt' :
                                teamName == '엘지 트윈스' ? 'lg' :
                                teamName == '엔씨 다이노스' ? 'nc' :
                                teamName == '두산 베어스' ? 'doosan' : 'kbo'}.jpg"
                            alt="${teamName} 로고"
                            style="width: 600px; height: auto;"
                            class="img-fluid mt-1">
                    </div>
             	<div class="alert">
					<strong>포인트:</strong> ${user.point}P
				</div>
            </div>
        </div>

        <!-- 내역 메뉴 버튼들 -->
		 <div class="col-md-4 mb-3">
		    <div class="card shadow-sm p-4 h-100 d-flex flex-column justify-content-center">
		        <button class="btn btn-outline-dark text-center w-100 mb-2" onclick="location.href='./getTicket'">티켓 내역</button>
		        <button class="btn btn-outline-dark text-center w-100 mb-2" onclick="location.href='../tickets/paymentList'">결제 내역</button>
		        <button class="btn btn-outline-dark text-center w-100 mb-2" onclick="location.href='./pwUpdate'">비밀번호 변경</button>
		        <button class="btn btn-outline-dark text-center w-100" onclick="location.href='./userDelete'">회원 탈퇴</button>
		    </div>
		</div>

        
        		<!-- 다음 경기 -->
			<c:set var="homeTeamName"
				value="${upcomingMatch.homeTeam == 1 ? '기아 타이거즈' :
				       upcomingMatch.homeTeam == 2 ? 'SSG 랜더스' :
				       upcomingMatch.homeTeam == 3 ? '한화 이글스' :
				       upcomingMatch.homeTeam == 4 ? '키움 히어로즈' :
				       upcomingMatch.homeTeam == 5 ? '삼성 라이온즈' :
				       upcomingMatch.homeTeam == 6 ? '롯데 자이언츠' :
				       upcomingMatch.homeTeam == 7 ? '케이티 위즈' :
				       upcomingMatch.homeTeam == 8 ? '엘지 트윈스' :
				       upcomingMatch.homeTeam == 9 ? '엔씨 다이노스' :
				       upcomingMatch.homeTeam == 10 ? '두산 베어스' : '미지정'}" />

			<c:set var="awayTeamName"
				value="${upcomingMatch.awayTeam == 1 ? '기아 타이거즈' :
				       upcomingMatch.awayTeam == 2 ? 'SSG 랜더스' :
				       upcomingMatch.awayTeam == 3 ? '한화 이글스' :
				       upcomingMatch.awayTeam == 4 ? '키움 히어로즈' :
				       upcomingMatch.awayTeam == 5 ? '삼성 라이온즈' :
				       upcomingMatch.awayTeam == 6 ? '롯데 자이언츠' :
				       upcomingMatch.awayTeam == 7 ? '케이티 위즈' :
				       upcomingMatch.awayTeam == 8 ? '엘지 트윈스' :
				       upcomingMatch.awayTeam == 9 ? '엔씨 다이노스' :
				       upcomingMatch.awayTeam == 10 ? '두산 베어스' : '미지정'}" />

			<c:if test="${not empty upcomingMatch}">
				<div class="card p-4 shadow-sm">
					<h5 class="text-center mb-3">${teamName}의 다음 경기</h5>
					<div class="row text-center">
						<div class="col-md-4">
							<strong>홈팀</strong><br>${homeTeamName}
						</div>
						<div class="col-md-4">
							<strong>VS</strong><br>
							<fmt:formatDate value="${upcomingMatch.matchDate}" pattern="yyyy-MM-dd HH:mm" />
						</div>
						<div class="col-md-4">
							<strong>어웨이팀</strong><br>${awayTeamName}
						</div>
					</div>
				</div>
			</c:if>

			<c:if test="${empty upcomingMatch}">
				<div class="alert alert-warning text-center">
					등록된 선호팀의 예정된 경기가 없습니다.
				</div>
			</c:if>

    </div>
</div>





<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>

</body>
</html>
